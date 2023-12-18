// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_foreground_service/flutter_foreground_service.dart';
import 'package:screenshot/screenshot.dart';

class TrackLocation extends StatefulWidget {
  const TrackLocation({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TrackLocationState createState() => _TrackLocationState();
}

class _TrackLocationState extends State<TrackLocation> {

  final ScreenshotController _screenshotController = ScreenshotController();

  String? exerciseId;
  String userPace = 'N/A';
  String distance = "N/A";
  String heartRateText = "N";
  String caloriesText = "00";
  String formattedDuration = '00:00:00';
  String watchId = "";

  bool isRunning = false;
  bool showError = false;
  bool isMapExpanded = true;
  bool showWidgets1 = false;
  bool showWidgets2 = false;
  bool showWidgets3 = false;
  bool shouldUpdateListeners = true;

  int secondsElapsed = 0;

  List<Marker> markers = [];
  List<LatLng> polylinePoints = [];
  
  late Timer timer;
  late String userId;
  late Timer paceTimer;
  late String dateToday;
  late Uint8List? imageBytes;
  late MapController mapController;
  late DatabaseReference databaseReference;
  late DatabaseReference stopRef;
  late DatabaseReference pauseRef;
  late DatabaseReference caloriesRef;
  late DatabaseReference distanceRef;
  late DatabaseReference heartRateRef;

  LatLng originalCenter = const LatLng(3.14661, 101.69515);

  Polyline polyline = Polyline(
    points: [],
    strokeWidth: 4,
    color: Colors.pink,
  );

  double totalDistance = 0;

  void updateDuration() {
    if (isRunning == true) {
      setState(() {
        secondsElapsed++;
        final hours = secondsElapsed ~/ 3600;
        final minutes = (secondsElapsed % 3600) ~/ 60;
        final seconds = secondsElapsed % 60;
        formattedDuration =
            "$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
      });
    } else {
      formattedDuration = formattedDuration;
    }
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (Timer timer) {
      if (!isRunning) {
        timer.cancel();
      } else {
        updateDuration();
      }
    });
  }

  void startRunning() async {
    setState(() {
      isRunning = true;
    });
    Geolocator.getPositionStream().listen((Position position) {
      updateMapPosition(position);
    });
  }

  Future<void> stopRunning() async {
    try{
      imageBytes = await _screenshotController.capture();
      stopForegroundService();
      setState(() {
        isRunning = false;

      });
      setState(() {
        markers.clear();
        polylinePoints.clear();
        polyline.points.clear();
        mapController.move(originalCenter, 10);
      });

      Geolocator.getPositionStream().listen((Position position) {}).cancel();

      await saveExerciseDataToFirebase();
    } catch (error) {
      debugPrint("Error Encountered");
    }
  }

  Future<void> uploadScreenshotToFirebase(
      Uint8List? imageBytes, String exerciseId) async {
    if (imageBytes == null) {
      debugPrint("No image");
      return;
    }
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      String storagePath = 'Exercise/image/$exerciseId.jpg';
      Reference storageReference =
          FirebaseStorage.instance.ref().child(storagePath);

      UploadTask uploadTask = storageReference.putData(
          imageBytes, SettableMetadata(contentType: 'image/jpeg'));

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await databaseReference
          .child('Exercise')
          .child(userId)
          .child(dateToday)
          .child(exerciseId)
          .update({'imageUrl': downloadUrl});
      debugPrint(
          'Image uploaded to Firebase Storage, URL saved to Firebase Realtime Database');
          Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(initialIndex: 3),
        ),
    );
    } catch (error) {
      debugPrint('Error uploading image to Firebase: $error');
    }
  }

  Future <void> saveExerciseDataToFirebase () async {
    dateToday = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String hourMinute = DateFormat('HH.mm').format(DateTime.now());
    exerciseId = databaseReference
        .child('Exercise')
        .child(userId)
        .child(dateToday)
        .push()
        .key;

    Map<String, dynamic> exerciseData = {
      'hourMinute': hourMinute,
      'distance': distance,
      'duration': formattedDuration,
      'pace': userPace,
      'calories': caloriesText
    };

    // Save data to Firebase
    databaseReference
        .child('Exercise')
        .child(userId)
        .child(dateToday)
        .child(exerciseId!)
        .set(exerciseData)
        .then((_) {
      debugPrint('Data saved to Firebase');
      if (exerciseId != null) {
        uploadScreenshotToFirebase(imageBytes, exerciseId.toString());
        debugPrint("oh well");
      }
    }).catchError((error) {
      debugPrint('Failed to save data to Firebase: $error');
    });
  }

  void startForegroundService() async {
    ForegroundService().start();
    debugPrint("Started service");
  }

  void stopForegroundService() async {
    ForegroundService().stop();
    debugPrint("Stopped service");
  }

  void updatePace() {
    final pace = calculatePace(calculateDistance(), secondsElapsed);
    setState(() {
      userPace = pace.toString();
    });
  }

  void updateMapPosition(Position position) {
    if (!isRunning) {
      return;
    }

    final LatLng latLng = LatLng(position.latitude, position.longitude);
    setState(() {
      markers.clear();
      markers.add(
        Marker(
          width: 45.0,
          height: 45.0,
          point: latLng,
          builder: (ctx) => Container(
            color: Colors.transparent,
            child: Image.asset(
              'assets/images/running.png',
              width: 45.0,
              height: 45.0,
            ),
          ),
        ),
      );
      markers.add(
        Marker(
          width: 45.0,
          height: 45.0,
          point: latLng,
          builder: (ctx) => Container(
            color: Colors.transparent,
            child: Image.asset(
              'assets/images/running.png',
              width: 45.0,
              height: 45.0,
            ),
          ),
        ),
      );
      polylinePoints.add(latLng);
      polyline.points.add(latLng);
      mapController.move(latLng, 16.10);

      // Update total distance
      if (polylinePoints.length > 1) {
        totalDistance += Geolocator.distanceBetween(
          polylinePoints[polylinePoints.length - 2].latitude,
          polylinePoints[polylinePoints.length - 2].longitude,
          latLng.latitude,
          latLng.longitude,
        );
        //distance = (totalDistance / 1000).toStringAsFixed(2);
      }
    });
  }

  double calculateDistance() {
    double totalDistance = 0;
    for (int i = 0; i < polylinePoints.length - 1; i++) {
      totalDistance += Geolocator.distanceBetween(
        polylinePoints[i].latitude,
        polylinePoints[i].longitude,
        polylinePoints[i + 1].latitude,
        polylinePoints[i + 1].longitude,
      );
    }
    return totalDistance;
  }

  String calculatePace(double totalDistance, int totalSeconds) {
    if (totalDistance <= 0 || totalSeconds <= 0) {
      return "N/A";
    }

    double paceInMinutesPerKm = (totalSeconds / 60) / (totalDistance / 1000);
    int minutes = paceInMinutesPerKm.toInt();
    int seconds = ((paceInMinutesPerKm - minutes) * 60).toInt();

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void updateCalories(dynamic caloriesValue) {

    int roundedCalories = caloriesValue.round();

    setState(() {
      caloriesText = roundedCalories.toString();
    });

}

  void updateDistance(dynamic distanceWatch) {

    double distanceFetch = distanceWatch.toDouble();

    // Convert meters to kilometers
    double distanceInKm = distanceFetch / 1000;

    // Round to two decimal places
    String formattedDistance = distanceInKm.toStringAsFixed(2);

    setState(() {
      // Update the state with the formatted distance
      distance = formattedDistance;
    });

}

  void updateHeartRate(dynamic heartrate) {

    int heartRateFetch = heartrate;

    setState(() {
      heartRateText = heartRateFetch.toString();
    });

}


  void updateStatus(dynamic status) {

      bool statusNow = status;

      if(statusNow == false) {
        stopRunning(); 
      }

  }

  void updateRunStatus(dynamic status) {

      bool statusNow = status;
      if(statusNow == true) {
        if(mounted) {
          setState(() {
            isRunning = false;
            shouldUpdateListeners = false;
          });
        }
      } else {
        if(mounted) {
          setState(() {
            isRunning = true;
            shouldUpdateListeners = true;
          });
        }    
        startTimer();
        startRunning();
      }

  }

  Future<void> fetchWatchId() async {
  User? user = FirebaseAuth.instance.currentUser;
  try {
    if(user != null) {
      String userId = user.uid;
      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child('users').child(userId).child("smartwatch").once()).snapshot;

      if(dataSnapshot.value != null) {
        watchId = dataSnapshot.value.toString();
      }
    }
    debugPrint("This is your WATCH ID $watchId NOICEEEEEEEEEEEE");
    initializeData();
  } catch (error) {
    debugPrint('Error fetching scanned data: $error');
  }
}

Future<void> initializeData() async {
  
    databaseReference = FirebaseDatabase.instance.ref();
    userId = FirebaseAuth.instance.currentUser!.uid;

    caloriesRef = databaseReference.child('SmartWatch/$watchId/ExerciseSessions/002/Calories');
    distanceRef = databaseReference.child('SmartWatch/$watchId/ExerciseSessions/002/Distance');
    heartRateRef = databaseReference.child('SmartWatch/$watchId/ExerciseSessions/002/HeartRate');

    stopRef = databaseReference.child('SmartWatch/$watchId/ExerciseStatus');
    pauseRef = databaseReference.child('SmartWatch/$watchId/RunStatus');

    caloriesRef.onValue.listen((DatabaseEvent event) {
      if (!shouldUpdateListeners) return;
      dynamic caloriesValue = event.snapshot.value;
      if(caloriesValue != null) {
        updateCalories(caloriesValue);
      }
      
    });

    distanceRef.onValue.listen((DatabaseEvent event) {
      if (!shouldUpdateListeners) return;
      dynamic distanceValue = event.snapshot.value;
      if(distanceValue != null ) {
        updateDistance(distanceValue);
      }
      
    });

    heartRateRef.onValue.listen((DatabaseEvent event) {
      if (!shouldUpdateListeners) return;
      dynamic heartRateValue = event.snapshot.value;
      if(heartRateValue != null) {
        updateHeartRate(heartRateValue);
      }
      
    });
    stopRef.onValue.listen((DatabaseEvent event) {
      dynamic stopRun = event.snapshot.value;
      if (stopRun != null ){
        updateStatus(stopRun);
      }
      
    });
    pauseRef.onValue.listen((DatabaseEvent event) {
      dynamic pauseRun = event.snapshot.value;
      if(pauseRun != null) {
        updateRunStatus(pauseRun);
      }
    });
}

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    startForegroundService();
    mapController = MapController();

    startRunning();

    paceTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      updatePace();
    });
    fetchWatchId();

  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _screenshotController,
      child: Stack(
        children: [
          Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: isMapExpanded ? 650 : 475,
                  width: double.infinity,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      interactiveFlags: InteractiveFlag.none,
                      center: const LatLng(3.14661, 101.69515),
                      zoom: 10,
                    ),
                    nonRotatedChildren: [
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution('Mapbox',
                              onTap: () => launchUrl(Uri.parse(
                                  'https://www.mapbox.com/about/maps/'))),
                        ],
                      ),
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://api.mapbox.com/styles/v1/azim-razmi/cln080fjn013f01ns8xhkczvp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXppbS1yYXptaSIsImEiOiJjbG16eXpqZ3UxOHcwMnFvNzRrN2hlemV0In0.91Bg7Xu9ZhxZ5Ioeo3YHhg',
                        additionalOptions: const {
                          'accessToken':
                              'pk.eyJ1IjoiYXppbS1yYXptaSIsImEiOiJjbG16eXpqZ3UxOHcwMnFvNzRrN2hlemV0In0.91Bg7Xu9ZhxZ5Ioeo3YHhg',
                          'id': 'mapbox.satellite',
                        },
                      ),
                      MarkerLayer(
                        markers: markers,
                      ),
                      PolylineLayer(
                        polylines: [polyline],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isMapExpanded = !isMapExpanded;
                            showWidgets1 = !showWidgets1;
                            showWidgets2 = !showWidgets2;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent),
                        child: Text(
                          isMapExpanded ? 'Λ' : 'V',
                          style: const TextStyle(
                              color: Color.fromARGB(167, 233, 30, 98),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 180,
                                  height: 24,
                                  child: Text(
                                    distance,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                    width: 180,
                                    child: Text(
                                      'KM',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 12,
                                          color: Color.fromARGB(110, 0, 0, 0)),
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Text(formattedDuration,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                ),
                                const SizedBox(
                                  width: 180,
                                  child: Text(
                                    'Duration',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12,
                                        color: Color.fromRGBO(
                                            139, 139, 139, 0.427)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Visibility(
                            visible: showWidgets1,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 180,
                                  height: 24,
                                  child: Text(caloriesText,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontFamily: 'Arial',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                ),
                                const SizedBox(
                                  width: 180,
                                  height: 50,
                                  child: Text(
                                    'Kcal',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12,
                                        color: Color.fromARGB(110, 0, 0, 0)),
                                  ),
                                )
                              ],
                            )),
                        Visibility(
                          visible: showWidgets1,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 180,
                                  height: 24,
                                  child: 
                                  Text(
                                    userPace,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                const SizedBox(
                                  width: 180,
                                  height: 50,
                                  child: Text(
                                    'Pace',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12,
                                        color: Color.fromARGB(110, 0, 0, 0)
                                  ),
                                ),
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                    Visibility(
                          visible: showWidgets1,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 13,
                                ),
                                SizedBox(
                                  width: 180,
                                  height: 24,
                                  child: 
                                  Text(
                                    heartRateText,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                const SizedBox(
                                  width: 180,
                                  height: 50,
                                  child: Text(
                                    'Heart Rate',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12,
                                        color: Color.fromARGB(110, 0, 0, 0)
                                  ),
                                ),
                              )
                            ],
                          )
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    ForegroundService().stop();
    timer.cancel();
    stopRunning();
    super.dispose();
  }
}
