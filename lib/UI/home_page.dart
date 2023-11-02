// ignore_for_file: constant_identifier_names
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:health/health.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UI/steps_page.dart';
import 'package:myapp/UI/heartrate_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  DateTime selectedDate = DateTime.now();
  DateTime firstDataPointDate = DateTime.now();
  String profilePictureUrl = '';
  String currentSteps = "N/A";
  String currentHeartRate = "N/A";
  String currentBloodOxygen = "N/A";
  String currentBloodPressure = "N/A";
  String currentSleep = "N/A";
  String currentCalorieBurn = "N/A";
  List<int?> stepData = List.filled(24, null);
  int? maxStep;

  // ignore: prefer_final_fields
  List<HealthDataPoint> _healthDataList = [];
  // ignore: unused_field
  AppState _state = AppState.DATA_NOT_FETCHED;
  // ignore: unused_field, prefer_final_fields
  int _nofSteps = 0;

  static final types = [
    HealthDataType.HEART_RATE,
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_REM, 
    HealthDataType.SLEEP_SESSION,
  ];

  final permissions = types.map((e) => HealthDataAccess.READ).toList();

  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  Future authorize() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();

    bool? hasPermissions =
        await health.hasPermissions(types, permissions: permissions);

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

    setState(() => _state = 
        (authorized) ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED);
  }

  Future<void> saveStepsDataToFirebase(
      String userId, int stepsData, DateTime dateTime) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();

    final currentHour = today.hour;
    final databasePath ='health/$userId/steps/${today.year}-${today.month}-${today.day}/$currentHour';

    int previousHour = currentHour - 1;

    try {
      // Initialize the total subtracted steps to 0
      int totalSubtractedSteps = 0;

      // Iterate through all previous hours and subtract their steps
      while (previousHour >= 0) {
        final previousHourPath =
            'health/$userId/steps/${today.year}-${today.month}-${today.day}/$previousHour';
        final previousDataEvent =
            await databaseReference.child(previousHourPath).once();

        DataSnapshot previousDataSnapshot = previousDataEvent.snapshot;
        if (previousDataSnapshot.value != null) {
          totalSubtractedSteps += (previousDataSnapshot.value as int);
        }

        // Move to the previous hour
        previousHour--;
      }

      // Calculate the current steps by subtracting the total subtracted steps
      int currentStep = stepsData - totalSubtractedSteps;

      if (currentStep < 0) {
        currentStep = 0;
      }

      // Save the current steps data to Firebase
      await databaseReference.child(databasePath).set(currentStep);
      print('Steps data saved to Firebase at $databasePath');
    } catch (error) {
      print('Error saving steps data to Firebase: $error');
    }
  }

  Future<void> biggestStep() async {
  final today = DateTime.now();
  String userId = "";
  User? user = FirebaseAuth.instance.currentUser;
  List<int> stepDataList = List.filled(24, 0); // Initialize with 24 zeros.

  if (user != null) {
    userId = user.uid;

    for (int x = 0; x < 24; x++) {
      final databasePath =
          'health/$userId/steps/${today.year}-${today.month}-${today.day}/$x';
      DataSnapshot dataSnapshot =
          (await FirebaseDatabase.instance.ref().child(databasePath).once())
              .snapshot;

      if (dataSnapshot.value != null) {
        int? value = int.tryParse(dataSnapshot.value.toString());
        if (value != null) {
          stepDataList[x] = value; // Store the step data in the list.
        }
      }
    }

    int? newMaxStep = stepDataList.reduce((a, b) => a > b ? a : b);

    setState(() {
      maxStep = newMaxStep;
    });
  }
}

  Future<void> fetchStepData() async {
  setState(() => _state = AppState.FETCHING_DATA);
  User? user = FirebaseAuth.instance.currentUser;

  final now = DateTime.now();
  final yesterday = DateTime(now.year, now.month, now.day);

  _healthDataList.clear();

  try {
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(yesterday, now, types);

    // Fetch and process steps data
    if (types.contains(HealthDataType.STEPS)) {
      for (HealthDataPoint dataPoint in healthData) {
        if (dataPoint.type == HealthDataType.STEPS) {
          currentSteps = dataPoint.value.toString();
          int? stepnow = int.tryParse(currentSteps);
          firstDataPointDate = dataPoint.dateTo;

          if (user != null) {
            saveStepsDataToFirebase(user.uid, stepnow!, firstDataPointDate);
          }
          break;
        }
      }
    }
    _healthDataList.addAll((healthData.length < 100) ? healthData : healthData.sublist(0, 100));
  } catch (error) {
    debugPrint("Exception in getHealthDataFromTypes: $error");
  }
  // Call biggestStep and update maxStep
  await biggestStep();
}
  
  Future<void> fetchCaloriesData() async {
  
  double y = 0.04;
  double? x = double.tryParse(currentSteps);
  double curStep = x! * y;

  currentSteps = curStep.toString();

}

  Future<void> fetchHeartRateData() async {
  setState (() => _state = AppState.FETCHING_DATA); 
  User? user = FirebaseAuth.instance.currentUser;

  final now = DateTime.now();
  final yesterday = DateTime(now.year, now.month, now.day);
  _healthDataList.clear();

  try{
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(yesterday, now, types); 

    if(types.contains(HealthDataType.HEART_RATE)) {
      for(HealthDataPoint dataPoint in healthData) {
        if(dataPoint.type == HealthDataType.HEART_RATE) {
          currentHeartRate = dataPoint.value.toString();
        }
      }
    }
  } catch (error) {
    debugPrint("Exception in getHealthDataFromTypes: $error");
  }
}

  Future<void> fetchSleepDeepData() async {
  setState (() => _state = AppState.FETCHING_DATA); 
  User? user = FirebaseAuth.instance.currentUser;

  final now = DateTime.now();
  final yesterday = DateTime(now.year, now.month, now.day);
  _healthDataList.clear();

  try{
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(yesterday, now, types); 

    if(types.contains(HealthDataType.SLEEP_SESSION)) {
      for(HealthDataPoint dataPoint in healthData) {
        if(dataPoint.type == HealthDataType.SLEEP_SESSION) {
          currentSleep = dataPoint.value.toString();
        }
      }
    }
  } catch (error) {
    debugPrint("Exception in getHealthDataFromTypes: $error");
  }
}

  Future<void> fetchBloodOxygenData() async {
  setState (() => _state = AppState.FETCHING_DATA); 
  User? user = FirebaseAuth.instance.currentUser;

  final now = DateTime.now();
  final yesterday = DateTime(now.year, now.month, now.day);
  _healthDataList.clear();

  try{
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(yesterday, now, types); 

    if(types.contains(HealthDataType.BLOOD_OXYGEN)) {
      for(HealthDataPoint dataPoint in healthData) {
        if(dataPoint.type == HealthDataType.BLOOD_OXYGEN) {
          currentBloodOxygen = dataPoint.value.toString();
        }
      }
    }
  } catch (error) {
    debugPrint("Exception in getHealthDataFromTypes: $error");
  }
}

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('users').child(user.uid);
      DatabaseEvent event = await userRef.once();
      dynamic data = event.snapshot.value;

      if (!mounted) return;

      if (data != null && data is Map) {
        setState(() {
          profilePictureUrl = data['profilePictureUrl'] ?? '';
        });
      } else {
        setState(() {});
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
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    authorize();
    fetchStepData();
    fetchCaloriesData();
    fetchHeartRateData();
    fetchSleepDeepData();
    fetchBloodOxygenData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final int currentDayNum = selectedDate.day;
    final String currentDayDay = DateFormat('EEEE').format(selectedDate);
    final String currentYear = DateTime.now().year.toString();
    final String currentMonth = DateFormat('MMMM').format(selectedDate);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        // Wrap the content with SingleChildScrollView
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
                  const Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        elevation: 0,
                        heroTag: 'btn1',
                        backgroundColor:
                            const Color.fromARGB(255, 255, 241, 245),
                        onPressed: _showDatePicker,
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
                      FloatingActionButton(
                        elevation: 0,
                        heroTag: 'btn2',
                        backgroundColor:
                            const Color.fromARGB(255, 255, 241, 245),
                        onPressed: () {},
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 290,
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
              width: 286,
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
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 145,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: () {},
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
                                          'Calories',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 35),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/flame.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 40),
                                    Text(
                                      currentCalorieBurn,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Text(
                                      'kcal',
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
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 145,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute( builder: (context) => StepsPage(
                                currentStep: currentSteps,
                                currentStepDate: firstDataPointDate,
                                maxStep: maxStep!,
                              )));
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
                                          'Steps',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 48),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/icon-Z93.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 40),
                                    Text(
                                      currentSteps,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Text(
                                      'Steps',
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
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 145,
                      height: 310,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute( builder: (context) => HeartRatePage()));
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
                                      'Heart',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 48),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/heartrate.png'),
                                      width: 20,
                                      height: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 200),
                                Text(
                                  currentHeartRate,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40 * screenWidth / 375,
                        ),
                        SizedBox(
                          width: 146,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              authorize();
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 20),
                                    const Row(
                                      children: [
                                        Text(
                                          'Blood Oxygen',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/pressure.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 40),
                                    Text(
                                      currentBloodOxygen,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Text(
                                      'SpO2',
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
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 145,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: () {

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
                                          'Sleep Tracker',
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
                                      currentSleep,
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
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
