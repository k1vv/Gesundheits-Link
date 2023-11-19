import 'dart:async';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackLocation extends StatefulWidget {
  const TrackLocation({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TrackLocationState createState() => _TrackLocationState();
}

class _TrackLocationState extends State<TrackLocation> {
  late MapController mapController;
  List<Marker> markers = [];
  bool isRunning = false;
  bool showError = false;
  bool isMapExpanded = true;
  String userPace = 'N/A';
  String distance= "N/A";
  LatLng originalCenter = const LatLng(3.14661, 101.69515);
  bool showWidgets1 = false;
  bool showWidgets2 = false;
  bool showWidgets3 = false;
  List<LatLng> polylinePoints = [];
  Polyline polyline = Polyline(
    points: [],
    strokeWidth: 4,
    color: Colors.blue,
  );
  late Timer paceTimer;
  late Timer timer;

  int secondsElapsed = 0;
  String formattedDuration = '00:00:00';

  void updateDuration() {
    if(isRunning == true) {
      setState(() {
        secondsElapsed++;
        final hours = secondsElapsed ~/ 3600;
        final minutes = (secondsElapsed % 3600) ~/ 60;
        final seconds = secondsElapsed % 60;
        formattedDuration = "$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
      });
    } else {
      formattedDuration = formattedDuration;
    }
  }

  void pauseTimer() {
    timer.cancel();
  }

  void resumeTimer() {
    startTimer();
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

  void stopRunning() {
    setState(() {
      isRunning = false;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MainPage(
                    initialIndex: 3,
                  )));
    });
    setState(() {
      markers.clear();
      polylinePoints.clear();
      polyline.points.clear();
      mapController.move(originalCenter, 10);
    });

    Geolocator.getPositionStream().listen((Position position) {}).cancel();
  }

  void updatePace() {
    final pace = calculatePace(calculateDistance(), secondsElapsed);
    setState(() {
      userPace = pace.toString();
    });
  }

  void updateMapPosition(Position position) { 
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
      polylinePoints.add(latLng);
      polyline.points.add(latLng);
      mapController.move(latLng, 16.10);
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
  
  @override
  void initState() {
    super.initState();
    mapController = MapController();
    startRunning();
    startTimer();
    distance = (calculateDistance() / 1000).toStringAsFixed(2);
    paceTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      updatePace();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: isMapExpanded ? 650 : 475,
                width: 360,
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
                                        color: Color.fromARGB(110, 0, 0, 0)
                                    ),
                                  )                                  
                                ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 180,
                                child: Text(
                                  formattedDuration,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black)
                                ),
                              ),
                              const SizedBox(
                                width: 180,
                                child: Text(
                                  'Duration',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12,
                                        color: Color.fromRGBO(139, 139, 139, 0.427)
                                    ),
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
                          child: const Column(
                            children: [
                            SizedBox(height: 30,),
                              SizedBox(
                                width: 180,
                                height: 24,
                                child: Text(
                                  '00',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black)
                                ),
                              ),
                              SizedBox(
                                width: 180,
                                height: 50,
                                child: Text(
                                  'Kcal',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 12,
                                        color: Color.fromARGB(110, 0, 0, 0)
                                    ),
                                ),
                              )
                            ],
                          )),
                      Visibility(
                          visible: showWidgets1,
                          child: Column(
                            children: [
                            const SizedBox(height: 30,),
                              SizedBox(
                                  width: 180,
                                  height: 24,
                                  child: Text(
                                    userPace,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black)
                                  )),
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
                          )),
                    ],
                  ),
                  Visibility(
                    visible: showWidgets2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showWidgets2 = !showWidgets2;
                                showWidgets3 = !showWidgets3;
                                isRunning = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent),
                            child: Image.asset(
                              'assets/images/pause.png',
                              width: 60,
                              height: 60,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showWidgets3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              stopRunning();
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent),
                            child: Image.asset(
                              'assets/images/stop.png',
                              width: 60,
                              height: 60,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showWidgets3 = !showWidgets3;
                                showWidgets2 = !showWidgets2;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent),
                            child: Image.asset(
                              'assets/images/start.png',
                              width: 60,
                              height: 60,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  @override
  void dispose() {
    timer.cancel(); // Ensure the timer is canceled when the widget is disposed
    stopRunning();
    super.dispose();
  }
}