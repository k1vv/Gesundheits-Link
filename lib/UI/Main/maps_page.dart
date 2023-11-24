import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/UI/Map/tracklocation_page.dart';

class ShowMaps extends StatefulWidget {
  const ShowMaps({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowMapsState createState() => _ShowMapsState();
}

class _ShowMapsState extends State<ShowMaps> {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  bool showError = false;
  String pace = "N/A";
  String distance = "N/A";
  String elapsedTime = "N/A";

Future<void> fetchExerciseData() async {
  final today = DateTime.now();
  try {
    User? user = _auth.currentUser;

    if (user != null) {
      String userId = user.uid;
      String databasePath = 'Exercise/$userId/${today.year}-${today.month}-${today.day}';

      DatabaseReference exerciseRef = _databaseReference.child(databasePath);

      DatabaseEvent event = await exerciseRef.once();

      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> exercises =
            (event.snapshot.value as Map<dynamic, dynamic>);

        // Initialize variables to store the latest exercise data
        String latestExerciseId = "";
        double latestPace = 0.0;
        double latestDistance = 0.0;
        int latestElapsedTime = 0;

        exercises.forEach((key, value) {
          // Extract timestamp from the exercise key (assuming it's a valid DateTime string)
          DateTime exerciseTimestamp = DateTime.parse(key);

          // Check if the exercise is from today
          if (exerciseTimestamp.isBefore(today.add(const Duration(days: 1)))) {
            // Check if this exercise has a later timestamp than the current latest
            if (exerciseTimestamp.isAfter(DateTime.parse(latestExerciseId))) {
              latestExerciseId = key;
              latestPace = value['pace'];
              latestDistance = value['distance'];
              latestElapsedTime = value['duration'];
            }
          }
        });

        // Update state with the latest exercise data
        setState(() {
          pace = latestPace.toString();
          distance = latestDistance.toString();
          elapsedTime = latestElapsedTime.toString();
        });
      } else {
        debugPrint('No exercise data for today.');
      }
    } else {
      debugPrint('User not authenticated.');
    }
  } catch (error) {
    debugPrint('Error fetching exercise data: $error');
  }
}

  Future<void> _requestLocationPermission() async {
    final status = await Geolocator.requestPermission();

    if (status == LocationPermission.always ||
        status == LocationPermission.whileInUse) {
      // ignore: use_build_context_synchronously
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
    fetchExerciseData();
  }
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 500,
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
          top: 500 * fem,
          child: Container(
            width: 375 * screenWidth / 375,
            height: 400 * screenHeight / 375,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                SizedBox(width: 40 * screenWidth / 375,),
                Column(
                  children: [
                    SizedBox(height: 15 * screenHeight / 375,),
                    Image.asset(
                      "assets/images/runner.jpg", 
                      height: 50 * screenHeight / 375,
                      width:  100 * screenWidth / 375,
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
                    SizedBox(height: 5 * screenHeight / 375,),
                    SizedBox(
                      width: 50 * screenHeight / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          _requestLocationPermission();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: const Color.fromARGB(255, 248,203,198),
                          backgroundColor: const Color.fromARGB(255, 248,203,198), 
                          foregroundColor: const Color.fromARGB(255, 248,203,198),  
                          surfaceTintColor: const Color.fromARGB(255, 248,203,198), 
                        ), 
                        child: const Text(
                          "Start", 
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arial'
                          ),
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(width: 10 * screenWidth / 375,),
                Column(
                  children: [
                    SizedBox(height: 20 * screenHeight / 375),
                    const Text(
                      "Your Last Exercise", 
                      style: TextStyle(
                        fontFamily: 'Arial', 
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 10 * screenHeight / 375,), 
                    const Text(
                      "Distance",
                       style: TextStyle(
                        color: Colors.grey, 
                        fontSize: 12, 
                        fontFamily: 'Arial'
                      ),
                    ),
                    Text(
                      "$distance KM/20 KM",
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16, 
                        fontFamily: 'Arial'
                      ),
                    ),
                    SizedBox(height: 10 * screenHeight / 375,), 
                    const Text(
                      "Calories",
                       style: TextStyle(
                        color: Colors.grey, 
                        fontSize: 12, 
                        fontFamily: 'Arial'
                      ),
                    ),
                    Text(
                      "2400 kcal",
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16, 
                        fontFamily: 'Arial'
                      ),
                    )
                  ],
                )
              ],
            )
          ),
        ),
        Positioned(
          left: 110 * fem,
          top: 475 * fem,
          child: AnimatedOpacity(
            opacity: showError ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 50,
              width: 180,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Please grant permission to use Location services in the settings',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
