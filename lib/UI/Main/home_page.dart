// ignore_for_file: constant_identifier_names, unused_field, prefer_final_fields

import 'dart:async';
import 'package:intl/intl.dart';
import 'package:health/health.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UI/Health/divider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/Widgets/healthcontainer.dart';
import 'package:myapp/UI/Health/heartrate_page.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum AppState {
  DATA_NOT_FETCHED, 
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTHORIZED,
  AUTH_NOT_GRANTED,
  DATA_ADDED,
  DATA_DELETED,
  DATA_NOT_ADDED,
  DATA_NOT_DELETED,
  STEPS_READY,
}

class _HomePageState extends State<HomePage> {

  int _nofSteps = 0;
  static final  types = [
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_SESSION,
    HealthDataType.STEPS, 
    HealthDataType.HEART_RATE, 
    HealthDataType.BLOOD_OXYGEN
   ];
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;
  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);
  final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

  String currentSteps = "N/A";
  String currentSleepRem = "N/A";
  String currentSleepDeep = "N/A";
  String currentHeartRate = "N/A";
  String currentSleepInBed = "N/A";
  String currentSleepLight = "N/A";
  String currentCalorieBurn = "N/A";
  String currentBloodOxygen = "N/A";
  String currentSleepSession = "N/A";

  DateTime selectedDate = DateTime.now();
  DateTime firstDataPointDate = DateTime.now();

  int? maxStep;
  int? maxHeartRate;
  int? maxBloodOxygen;

  String profilePictureUrl = '';
  String currentBloodPressure = "N/A";
  String currentSleep = "N/A";
  String currentBMR = "N/A";
  String currentBMI = "N/A";
  String bloodOxygenSource = "";
  String heartRateSource = "";
  List<int?> stepData = List.filled(24, null);

  String _profilePictureUrl = "";

  // UI Usage Variable //

  String sleepTotalRightNow = "N/A";
  String stepsTotalRightNow = "N/A";
  String heartRateRightNow = "N/A";
  String bloodOxygenRightNow = "N/A";
  String caloriesburnRightNow = "N/A";

  // UI Usage Variable //

  // Health Connect Permission //

  Future authorize() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();


    bool? hasPermissions = await health.hasPermissions(types, permissions: permissions);

    hasPermissions = false;
    bool authorized = false;
    if (!hasPermissions) {
      try {
        authorized =
            await health.requestAuthorization(types, permissions: permissions);
      } catch (error) {
        debugPrint("Exception in authorize: $error");
      }
    }
    if(mounted) {
      setState(() => _state = (authorized) ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED);
    }
  }

  // Health Connect Permission //

  // Data fetch from health connect //

  Future<void> fetchDataFromHealthConnect(DateTime selectedDate, HealthDataType dataType) async {
    setState(() => _state = AppState.FETCHING_DATA);
    User? user = FirebaseAuth.instance.currentUser;
    _healthDataList.clear();
  
    try {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        selectedDate,
        selectedDate.add(const Duration(days: 1)),
        [dataType],
      );
  
      if (healthData.isNotEmpty) {
        processHealthData(user, healthData, dataType);
      }
    } catch (error) {
      debugPrint("Exception in getHealthDataFromTypes: $error");
    }
  }
  
  void processHealthData(User? user, List<HealthDataPoint> healthData, HealthDataType dataType) {
    for (HealthDataPoint dataPoint in healthData) {
      switch (dataType) {
        case HealthDataType.STEPS:
          processStepsData(user, dataPoint);
          break;
        case HealthDataType.HEART_RATE:
          processHeartRateData(user, dataPoint);
          break;
        case HealthDataType.BLOOD_OXYGEN:
          processBloodOxygenData(user, dataPoint);
          break;
        case HealthDataType.SLEEP_SESSION:
          processSleepData(user, dataPoint);
          break;
        case HealthDataType.SLEEP_DEEP:
          processSleepDeepData(user, dataPoint);
          break;
        case HealthDataType.SLEEP_LIGHT:
          processSleepLightData(user, dataPoint);
          break;
        case HealthDataType.SLEEP_REM:
          processSleepRemData(user, dataPoint);
          break;
        case HealthDataType.SLEEP_AWAKE:
          processSleepAwakeData(user, dataPoint);
          break;
      }
    }
  }
  
  void processStepsData(User? user, HealthDataPoint dataPoint) {
    if (dataPoint.type == HealthDataType.STEPS) {
      currentSteps = dataPoint.value.toString();
      int? stepNow = int.tryParse(currentSteps);
  
      if (user != null) {
        saveSteps(user.uid, stepNow!);
        saveCalories(user.uid, stepNow);
      }
    }
  }
  
  void processHeartRateData(User? user, HealthDataPoint dataPoint) {
    if (dataPoint.type == HealthDataType.HEART_RATE) {
      currentHeartRate = dataPoint.value.toString();
      heartRateSource = dataPoint.sourceName.toString();
  
      if (user != null) {
        saveHeartRate(user.uid, currentHeartRate);
      }
    }
  }
  
  void processBloodOxygenData(User? user, HealthDataPoint dataPoint) {
    if (dataPoint.type == HealthDataType.BLOOD_OXYGEN) {
      currentBloodOxygen = dataPoint.value.toString();
      bloodOxygenSource = dataPoint.sourceName.toString();
  
      if (user != null) {
        saveBloodOxygen(user.uid, currentBloodOxygen);
      }
    }
  }
  
  void processSleepData(User? user, HealthDataPoint dataPoint) {
    if (dataPoint.type == HealthDataType.SLEEP_SESSION) {
      String currentSleep = dataPoint.value.toString();
      String sleepSessionDateFrom = dataPoint.dateFrom.toString();
      String sleepSessionDateTo = dataPoint.dateTo.toString();
  
      saveSleepData(user!.uid, currentSleep, sleepSessionDateFrom, sleepSessionDateTo);
    }
  }
  
  void processSleepDeepData(User? user, HealthDataPoint dataPoint) {
    if (dataPoint.type == HealthDataType.SLEEP_DEEP) {
      double sleepDeepData = double.parse(dataPoint.value.toString());
      saveSleepDeepData(user!.uid, sleepDeepData.toString());
    }
  }
  
  void processSleepLightData(User? user, HealthDataPoint dataPoint) {
    if (dataPoint.type == HealthDataType.SLEEP_LIGHT) {
      double sleepLightData = double.parse(dataPoint.value.toString());
      saveSleepLightData(user!.uid, sleepLightData.toString());
    }
  }
  
  void processSleepRemData(User? user, HealthDataPoint dataPoint) {
    if (dataPoint.type == HealthDataType.SLEEP_REM) {
      double sleepRemData = double.parse(dataPoint.value.toString());
      saveSleepRemData(user!.uid, sleepRemData.toString());
    }
  }
  
  void processSleepAwakeData(User? user, HealthDataPoint dataPoint) {
    if (dataPoint.type == HealthDataType.SLEEP_AWAKE) {
      double sleepAwakeData = double.parse(dataPoint.value.toString());
      saveSleepAwakeData(user!.uid, sleepAwakeData.toString());
    }
  }
  // Data fetch from health connect //

  Future<void> saveCalories(String userId, int userStep) async {
    final today = DateTime.now();
    final currentHour = today.hour;
    final databaseReference = FirebaseDatabase.instance.ref();
    final databasePath = 'health/$userId/calories/${today.year}-${today.month}-${today.day}/$currentHour';

    double activeCalories = userStep * 0.04;
    int roundedActiveCalories = activeCalories.round();

    await databaseReference.child(databasePath).set(roundedActiveCalories);
  }

  // Data save to Firebase Realtime Database //

  Future<void> saveSteps(String userId, int stepsData) async {
    final today = DateTime.now();
    final currentHour = today.hour;
    final databaseReference = FirebaseDatabase.instance.ref();
    final databasePath = 'health/$userId/steps/${today.year}-${today.month}-${today.day}/';

    try {
      int totalSubtractedSteps = 0;

      // Iterate through previous hours and subtract their steps
      for (int previousHour = currentHour - 1; previousHour >= 0; previousHour--) {
        final previousHourPath = '$databasePath$previousHour';
        final previousDataEvent = await databaseReference.child(previousHourPath).once();

        DataSnapshot previousDataSnapshot = previousDataEvent.snapshot;
        if (previousDataSnapshot.value != null) {
          totalSubtractedSteps += (previousDataSnapshot.value as int);
        }
      }

      int currentStep = stepsData - totalSubtractedSteps;
      if (currentStep < 0) {
        currentStep = 0;
      }

      await databaseReference.child(databasePath).update({
        '$currentHour': currentStep,
      });

      debugPrint('Steps data saved to Firebase at $databasePath$currentHour');
    } catch (error) {
      debugPrint('Error saving steps data to Firebase: $error');
    }
  }

  Future<void> saveHeartRate(String userId,String heartrate,) async {
    final today = DateTime.now();
    final currentHour = today.hour;
    final databaseReference = FirebaseDatabase.instance.ref();
    final databasePath = 'health/$userId/heart_rate/${today.year}-${today.month}-${today.day}/$currentHour';
    final databasePaths = 'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/deviceFrom';

    try {
      await databaseReference.child(databasePath).set(heartrate);
      await databaseReference.child(databasePaths).set(heartRateSource);

      debugPrint('Heart Rate data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Heart Rate data to Firebase: $error');
    }
  }

  Future<void> saveBloodOxygen(String userId,String bloodOxygen,) async {
    final today = DateTime.now();
    final currentHour = today.hour;
    final databaseReference = FirebaseDatabase.instance.ref();
    final databasePath = 'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/$currentHour';
    final databasePaths = 'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/deviceFrom';

    try {
      await databaseReference.child(databasePath).set(bloodOxygen);
      await databaseReference.child(databasePaths).set(bloodOxygenSource);

      debugPrint('Blood Oxygen data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Blood Oxygen data to Firebase: $error');
    }
  }

  Future<void> saveSleepData(String userId, String sleep, String dateFrom, String dateTo) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();
  
    final databasePath =
        'health/$userId/sleep_session/${today.year}-${today.month}-${today.day}/';
  
    try {
      int sleepData = int.parse(sleep);
  
      // Save sleep data, dateFrom, and dateTo to Firebase
      await databaseReference.child('$databasePath/total').set(sleepData);
      await databaseReference.child('$databasePath/dateFrom').set(dateFrom);
      await databaseReference.child('$databasePath/dateTo').set(dateTo);
  
      debugPrint('Sleep data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Sleep data to Firebase: $error');
    }
  }

  Future<void> saveSleepDeepData(String userId, String sleepdeep) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();

    final databasePath =
        'health/$userId/sleep_session/${today.year}-${today.month}-${today.day}/';

    try {
      double sleepDeepData = double.parse(sleepdeep);

      // Save sleep data, dateFrom, and dateTo to Firebase
      await databaseReference.child(databasePath).update({'sleepDeep': sleepDeepData});

      debugPrint('Sleep deep data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Sleep deep data to Firebase: $error');
    }
  }

  Future<void> saveSleepLightData(String userId, String sleepLight) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();

    final databasePath =
        'health/$userId/sleep_session/${today.year}-${today.month}-${today.day}/';

    try {
      double sleepLightData = double.parse(sleepLight);

      // Save sleep data, dateFrom, and dateTo to Firebase
      await databaseReference.child(databasePath).update({'sleepLight': sleepLightData});

      debugPrint('Sleep light data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Sleep light data to Firebase: $error');
    }
  }

  Future<void> saveSleepRemData(String userId, String sleepRem) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();

    final databasePath =
        'health/$userId/sleep_session/${today.year}-${today.month}-${today.day}/';

    try {
      double sleepRemData = double.parse(sleepRem);

      // Save sleep data, dateFrom, and dateTo to Firebase
      await databaseReference.child(databasePath).update({'sleepRem': sleepRemData});

      debugPrint('Sleep Rem data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Sleep Rem data to Firebase: $error');
    }
  }

  Future<void> saveSleepAwakeData(String userId, String sleepAwake) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();

    final databasePath =
        'health/$userId/sleep_session/${today.year}-${today.month}-${today.day}/';

    try {
      double sleepAwakeData = double.parse(sleepAwake);

      // Save sleep data, dateFrom, and dateTo to Firebase
      await databaseReference.child(databasePath).update({'sleepAwake': sleepAwakeData});

      debugPrint('Sleep Awake data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Sleep Awake data to Firebase: $error');
    }
  }

  // Data save to Firebase Realtime Database //

  // Data fetch from firebase //

  Future<void> fetchDataForDate(DateTime date, String dataType) async {
    final today = date;
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user?.uid ?? "";

    double total = 0;

    if (user != null) {
      final List<Future<void>> futures = [];

      for (int i = (dataType == 'heart_rate' || dataType == 'blood_oxygen') ? 24 : 0;
          (dataType == 'heart_rate' || dataType == 'blood_oxygen') ? i > 0 : i <= 23;
          (dataType == 'heart_rate' || dataType == 'blood_oxygen') ? i-- : i++) {
        String databasePath = 'health/$userId/$dataType/${today.year}-${today.month}-${today.day}/$i';

        futures.add(FirebaseDatabase.instance.ref().child(databasePath).once().then((DatabaseEvent databaseEvent) {
          DataSnapshot dataSnapshot = databaseEvent.snapshot;

          if (dataSnapshot.value != null) {
            if (dataType == 'steps' || dataType == 'calories') {
              total += int.parse(dataSnapshot.value.toString());
            } else if (dataType == 'heart_rate') {
              int heartRate = int.parse(dataSnapshot.value.toString());
              if (heartRate > 0) {
                if (mounted) {
                  setState(() {
                    heartRateRightNow = heartRate.toString();
                  });
                }
                debugPrint("Heart Rate Today: $heartRate");
                return;
              }
            } else if (dataType == 'blood_oxygen') {
              double bloodOxygen = double.parse(dataSnapshot.value.toString());
              if (bloodOxygen > 0) {
                if (mounted) {
                  setState(() {
                    bloodOxygenRightNow = bloodOxygen.toString();
                    bloodOxygenRightNow = '$bloodOxygenRightNow%';
                  });
                }
                debugPrint("Blood Oxygen Today: $bloodOxygen");
                return;
              }
            } else if (dataType == 'sleep_session') {
              Map<String, dynamic> sleepData = (dataSnapshot.value as Map<dynamic, dynamic>).cast<String, dynamic>();
              if (sleepData['total'] != null) {
                int sleepSession = int.parse(sleepData['total'].toString());
                if (mounted) {
                  setState(() {
                    sleepTotalRightNow = sleepSession.toString();
                  });
                }
                debugPrint('Fetched Sleep data: $sleepSession');
                return;
              } else {
                debugPrint('Sleep data total is null or has an unexpected type.');
              }
            }
          }
        }));
      }

      await Future.wait(futures);

      if (dataType == 'steps') {
        if (mounted) {
          setState(() {
            stepsTotalRightNow = total.toString();
          });
        }
        debugPrint("Steps Total for Today: $total");
      } else if (dataType == 'calories') {
        if (mounted) {
          setState(() {
            caloriesburnRightNow = total.toString();
          });
        }
        debugPrint("Calories Total for Today: $total");
      }
    }
  }
  
  // Data Fetch from firebase

  Future<void> _fetchProfilePictureUrl() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final DatabaseReference database = FirebaseDatabase.instance.ref();
    User? user = auth.currentUser;

    if (user != null) {
      try {
        DatabaseEvent event = await database.child('users').child(user.uid).once();
        DataSnapshot snapshot = event.snapshot;
        if (snapshot.value != null && snapshot.value is Map<dynamic, dynamic>) {
          Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
          if(mounted) {
            setState(() {
              _profilePictureUrl = values['profilePictureUrl'] ?? "";
            });
          }
          
        }
      } catch (error) {
        debugPrint("Error fetching profile picture: $error");
      }
    }
  }

  void _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      if(mounted) {
        setState(() {
          selectedDate = pickedDate;
        });
      }
      
      
    }
  }

  @override
  void initState() {
   super.initState();

   setState(() {
      selectedDate = DateTime.now();
      selectedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
   });

    // fetchDataFromHealthConnect(selectedDate, HealthDataType.STEPS);
    // fetchDataFromHealthConnect(selectedDate, HealthDataType.HEART_RATE);
    // fetchDataFromHealthConnect(selectedDate, HealthDataType.BLOOD_OXYGEN);
    // fetchDataFromHealthConnect(selectedDate, HealthDataType.SLEEP_SESSION);
    // fetchDataFromHealthConnect(selectedDate, HealthDataType.SLEEP_DEEP);
    // fetchDataFromHealthConnect(selectedDate, HealthDataType.SLEEP_LIGHT);
    // fetchDataFromHealthConnect(selectedDate, HealthDataType.SLEEP_REM);
    // fetchDataFromHealthConnect(selectedDate, HealthDataType.SLEEP_AWAKE);

    fetchDataForDate(selectedDate, 'steps');
    fetchDataForDate(selectedDate, 'calories');
    fetchDataForDate(selectedDate, 'heart_rate');
    fetchDataForDate(selectedDate, 'blood_oxygen');
    fetchDataForDate(selectedDate, 'sleep_session');
    
   _fetchProfilePictureUrl();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;  

    final int currentDayNum = selectedDate.day;
    final String currentDayDay = DateFormat('EEEE').format(selectedDate);
    final String currentYear = DateTime.now().year.toString();
    final String currentMonth = DateFormat('MMMM').format(selectedDate);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 40,
                left: 30,
                right: 10,
                bottom: 5,
              ),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(73, 248, 203, 198),
                      border: Border.all(
                        color: const Color.fromARGB(73, 248, 203, 198),
                        width: 1.0,
                      ),
                    ),
                    child: ClipOval(
                      child: _profilePictureUrl.isNotEmpty
                          ? Image.network(
                              _profilePictureUrl,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.black,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 215 * screenWidth / 375,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        elevation: 0,
                        heroTag: 'btn1',
                        backgroundColor:
                            const Color.fromARGB(255, 255, 241, 245),
                        onPressed: () {
                          _showDatePicker();
                        },
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.calendar_month_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10 * screenHeight / 375,),
            SizedBox(
              width: 290 * screenWidth / 375,
              child: Text(
                "$currentDayNum, $currentDayDay's Information",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: 286 * screenWidth / 375,
              child: Text(
                '$currentMonth, $currentYear',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 15 * screenHeight / 375,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        HealthButtonSmall(
                          screenWidth: screenWidth, 
                          screenHeight: screenHeight, 
                          gap: 17.9,
                          buttonText: 'Calories', 
                          imageAsset: 'assets/images/flame.png', 
                          caloriesValue: caloriesburnRightNow, 
                          destinationPageRoute: 'calories_page',
                        ),
                        
                        SizedBox(height: 5 * screenHeight / 375),

                        HealthButtonSmall(
                          screenWidth: screenWidth, 
                          screenHeight: screenHeight, 
                          gap: 23.5,
                          buttonText: 'Steps', 
                          imageAsset: 'assets/images/icon-Z93.png', 
                          caloriesValue: stepsTotalRightNow, 
                          destinationPageRoute: 'steps_page',
                        ),
                      ],
                    ),
                    SizedBox(width: 10 * screenWidth / 375),
                    SizedBox(
                      width: 145 * screenWidth / 375,
                      height: 129 * screenHeight / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HeartRatePage()
                            )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(50, 158, 158, 158),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(height: 10 * screenHeight / 375),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10 * screenHeight / 375),
                                Row(
                                  children: [
                                    const Text(
                                      'Heart',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 48 * screenWidth / 375),
                                    Image(
                                      image: const AssetImage(
                                          'assets/images/heartrate.png'),
                                      width: 20 * screenWidth / 375,
                                      height: 10 * screenHeight / 375,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 82 * screenHeight / 375),
                                Text(
                                  heartRateRightNow,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  'bpm',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 5 * screenHeight / 375),
                    Row(
                      children: [
                        SizedBox(
                          width: 38 * screenWidth / 375,
                        ),
                        HealthButtonSmall(
                          screenWidth: screenWidth, 
                          screenHeight: screenHeight,
                          gap: 4.8, 
                          buttonText: 'Blood Oxygen', 
                          imageAsset: 'assets/images/pressure.png', 
                          caloriesValue: bloodOxygenRightNow, 
                          destinationPageRoute: 'bloodoxygen_page',
                        ),

                        SizedBox(width: 10 * screenWidth / 375),

                        HealthButtonSmall(
                          screenWidth: screenWidth, 
                          screenHeight: screenHeight,
                          gap: 5, 
                          buttonText: 'Sleep Tracker', 
                          imageAsset: 'assets/images/star.png', 
                          caloriesValue: sleepTotalRightNow, 
                          destinationPageRoute: 'sleeptracker_page',
                        ),
                      ],
                    ),
                    SizedBox(height: 5 * screenHeight / 375),
                    SizedBox(
                      width: 300 * screenWidth / 375,
                      height: 62 * screenHeight / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,MaterialPageRoute(
                              builder: (context) =>
                                const DividePage()
                            )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(50, 158, 158, 158),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 0, height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 20),
                                const Row(
                                  children: [
                                    Text(
                                      'Weight Management',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/star.png'),
                                      width: 20,
                                      height: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 42),
                                Text(
                                  sleepTotalRightNow,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  'Sleep Session',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10 * screenHeight / 375),
                  ],
                )
              ],
            ),
          ],
        ),
      ).animate().fadeIn(duration: 600.ms)// begin=1
    );
  }
}
