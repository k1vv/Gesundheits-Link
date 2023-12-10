// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/UI/Map/exercise.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/UI/Map/tracklocation_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

class ShowMaps extends StatefulWidget {
  const ShowMaps({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowMapsState createState() => _ShowMapsState();
}

class _ShowMapsState extends State<ShowMaps> {
  List<Exercise> exercises = []; 
  List<Map<String, dynamic>> exerciseList = [];

  late DatabaseReference startExercise;
  bool showError = false;
  String pace = "N/A";
  String distance = "N/A";
  String elapsedTime = "N/A";
  String calories = "N/A";

  Future<void> fetchLatestExerciseData() async {
    try {
      final today = DateTime.now();
      String userId = "";
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        userId = user.uid;
        String databasePath =
            'Exercise/$userId/${today.year}-${today.month}-${today.day}';

        DatabaseEvent event = await FirebaseDatabase.instance
            .ref()
            .child(databasePath)
            .orderByChild('hourMinute')
            .limitToLast(1)
            .once();

        var snapshotValue = event.snapshot.value;
        if (snapshotValue != null && snapshotValue is Map) {
          var latestExercise = snapshotValue.entries.first.value;
          setState(() {
            exercises = [
              Exercise(
                hourMinute: latestExercise['hourMinute'],
                distance: latestExercise['distance'],
                duration: latestExercise['duration'],
                calories: latestExercise['calories'],
                imageUrl: latestExercise['imageUrl'],
                pace: latestExercise['pace'],
              ),
            ];
          });
        }
      }
    } catch (error) {
      debugPrint('Failed to fetch data from Firebase: $error');
    }
  }

  Future<void> fetchExerciseData() async {
    try {
      final today = DateTime.now();
      String dateToday = "${today.year}-${today.month}-${today.day}";
      String userId = FirebaseAuth.instance.currentUser!.uid;
      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance
              .ref()
              .child('Exercise')
              .child(userId)
              .child(dateToday)
              .once())
          .snapshot;

      if (dataSnapshot.value != null) {
        Map<dynamic, dynamic> values =
            dataSnapshot.value as Map<dynamic, dynamic>;

        values.forEach((key, value) {
          exerciseList.add({
            'exerciseId': key,
            'hourMinute': value['hourMinute'],
            'distance': value['distance'],
            'duration': value['duration'],
            'pace': value['pace'],
            'imageUrl': value['imageUrl'],
          });
        });

        setState(() {});
      }
    } catch (error) {
      debugPrint('Error fetching exercise data: $error');
    }
  }

  Future<void> _showImagePopup(String imageUrl) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }

  Future<void> _showDeleteConfirmationDialog(Map<String, dynamic> exerciseData, int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Exercise'),
          content: const Text('Are you sure you want to delete this exercise?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _deleteExercise(exerciseData['exerciseId'], index);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteExercise(String exerciseId, int index) async {
    try {
      final today = DateTime.now();
      String userId = FirebaseAuth.instance.currentUser!.uid;
      String dateToday = "${today.year}-${today.month}-${today.day}";

      await FirebaseDatabase.instance
          .ref()
          .child('Exercise')
          .child(userId)
          .child(dateToday)
          .child(exerciseId)
          .remove();

      // Delete exercise image from Firebase Storage
      String storagePath = 'Exercise/image/$exerciseId.jpg';
      Reference storageReference =
          FirebaseStorage.instance.ref().child(storagePath);
      await storageReference.delete();

      // Remove the exercise from the local list
      setState(() {
        exerciseList.removeAt(index);
      });
    } catch (error) {
      debugPrint('Error deleting exercise: $error');
    }
  }

  Future<void> _requestLocationPermission() async {
    final status = await Geolocator.requestPermission();

    if (status == LocationPermission.always ||
        status == LocationPermission.whileInUse) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TrackLocation()));
    } else if (status == LocationPermission.denied ||
        status == LocationPermission.deniedForever) {
      setState(() {
        showError = true;
      });
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          showError = false;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLatestExerciseData();
    fetchExerciseData();

    startExercise = FirebaseDatabase.instance.ref().child('ExerciseStatus');
    startExercise.onValue.listen((DatabaseEvent event) {
      dynamic exercise = event.snapshot.value;
      if (exercise.toString() == "true") {
        _requestLocationPermission();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200 * screenHeight / 375,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background11.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 190 * screenHeight / 375,
                left: -5 * screenWidth / 375,
                child: Container(
                  width: 387 * screenWidth / 375,
                  height: 50 * screenHeight / 375,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: 40 * screenWidth / 375,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15 * screenHeight / 375,
                    ),
                    Image.asset(
                      "assets/images/runner.jpg",
                      height: 50 * screenHeight / 375,
                      width: 100 * screenWidth / 375,
                    ),
                    const Text(
                      "Elapsed Time",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      elapsedTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5 * screenHeight / 375,
                    ),
                    SizedBox(
                      width: 50 * screenHeight / 375,
                      child: ElevatedButton(
                          onPressed: () {
                            _requestLocationPermission();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shadowColor:
                                const Color.fromARGB(255, 248, 203, 198),
                            backgroundColor:
                                const Color.fromARGB(255, 248, 203, 198),
                            foregroundColor:
                                const Color.fromARGB(255, 248, 203, 198),
                            surfaceTintColor:
                                const Color.fromARGB(255, 248, 203, 198),
                          ),
                          child: const Text(
                            "Start",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Arial'),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  width: 10 * screenWidth / 375,
                ),
                Column(
                  children: [
                    SizedBox(height: 20 * screenHeight / 375),
                    const Text(
                      "Your Last Exercise",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10 * screenHeight / 375,
                    ),
                    const Text(
                      "Distance",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: 'Arial'),
                    ),
                    Text(
                      "$distance KM/20 KM",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Arial'),
                    ),
                    SizedBox(
                      height: 10 * screenHeight / 375,
                    ),
                    const Text(
                      "Calories",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: 'Arial'),
                    ),
                    Text(
                      "$calories kcal",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Arial'),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 20 * screenHeight / 375,
            color: Colors.white,
          ),
          if (exerciseList.isNotEmpty)
            Container(
              width: 370 * screenWidth / 375,
              height: 125 * screenHeight / 375,
              color: Colors.white,
              child: ListView.builder(
                itemCount: exerciseList.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> exerciseData = exerciseList[index];
                  return GestureDetector(
                    onLongPress: () {
                      _showDeleteConfirmationDialog(exerciseData, index);
                    },
                    child: ListTile(
                      title: Text('Exercise ${index + 1}'),
                      subtitle: Text('Time: ${exerciseData['hourMinute']}\n'
                          'Distance: ${exerciseData['distance']} km\n'
                          'Duration: ${exerciseData['duration']}\n'
                          'Pace: ${exerciseData['pace']}\n'),
                      leading: GestureDetector(
                        onTap: () {
                          // Show the image pop-up
                          _showImagePopup(exerciseData['imageUrl']);
                        },
                        child: Image.network(
                          exerciseData['imageUrl'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ]),
      ),
    );
  }
}
