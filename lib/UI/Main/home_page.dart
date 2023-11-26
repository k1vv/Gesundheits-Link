// ignore_for_file: constant_identifier_names
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:health/health.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UI/Health/steps_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/UI/Health/calories_page.dart';
import 'package:myapp/UI/Health/heartrate_page.dart';
import 'package:myapp/UI/Health/bloodoxygen_page.dart';
import 'package:myapp/UI/Main/utils.dart';
import 'package:myapp/UI/Health/sleeptracking_page.dart';
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
  String currentBMR = "N/A";
  String currentBMI = "N/A";
  List<int?> stepData = List.filled(24, null);
  int? maxStep;
  int? maxHeartRate;
  int? maxBloodOxygen;
  String _profilePictureUrl = "";

  // ignore: prefer_final_fields
  List<HealthDataPoint> _healthDataList = [];
  // ignore: unused_field
  AppState _state = AppState.DATA_NOT_FETCHED;
  // ignore: unused_field
  int _nofSteps = 0;

  static const types = dataTypesAndroid;

  final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

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
    setState(() => _state =
        (authorized) ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED);
  }

  Future<void> biggestStep() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    List<int> stepDataList = List.filled(24, 0);

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
            stepDataList[x] = value;
          }
        }
      }
      int? newMaxStep = stepDataList.reduce((a, b) => a > b ? a : b);
      if (mounted) {
        setState(() {
          maxStep = newMaxStep;
        });
      }
    }
  }

  Future<void> biggestHeartRate() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    List<int> heartRateDataList = List.filled(24, 0); // Initialize with 24 zeros.

    if (user != null) {
      userId = user.uid;

      for (int x = 0; x < 24; x++) {
        final databasePath =
            'health/$userId/heart_rate/${today.year}-${today.month}-${today.day}/$x';
        DataSnapshot dataSnapshot =
            (await FirebaseDatabase.instance.ref().child(databasePath).once())
                .snapshot;
        if (dataSnapshot.value != null) {
          int? value = int.tryParse(dataSnapshot.value.toString());
          if (value != null) {
            heartRateDataList[x] = value; // Store the step data in the list.
          }
        }
      }
      int? newMaxHeartRate = heartRateDataList.reduce((a, b) => a > b ? a : b);
      if (mounted) {
        setState(() {
          maxHeartRate = newMaxHeartRate;
        });
      }
    }
  }

  Future<void> biggestBloodOxygen() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    List<int> bloodOxygenDataList = List.filled(24, 0); // Initialize with 24 zeros.

    if (user != null) {
      userId = user.uid;

      for (int x = 0; x < 24; x++) {
        final databasePath =
            'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/$x';
        DataSnapshot dataSnapshot =
            (await FirebaseDatabase.instance.ref().child(databasePath).once())
                .snapshot;
        if (dataSnapshot.value != null) {
          int? value = int.tryParse(dataSnapshot.value.toString());
          if (value != null) {
            bloodOxygenDataList[x] = value; // Store the step data in the list.
          }
        }
      }
      int? newMaxBloodOxygen = bloodOxygenDataList.reduce((a, b) => a > b ? a : b);
      if (mounted) {
        setState(() {
          maxBloodOxygen = newMaxBloodOxygen;
        });
      }
    }
  }

  Future<void> fetchStepData(DateTime selectedDate) async {                            // Only one that works when changing the date of the data being fetched
    setState(() => _state = AppState.FETCHING_DATA);
    User? user = FirebaseAuth.instance.currentUser;

    _healthDataList.clear();

    try {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        selectedDate,
        selectedDate.add(const Duration(days: 1)),types,
      );

      if (types.contains(HealthDataType.STEPS)) {
        for (HealthDataPoint dataPoint in healthData) {
          if (dataPoint.type == HealthDataType.STEPS) {
            currentSteps = dataPoint.value.toString();
            int? stepnow = int.tryParse(currentSteps);
            firstDataPointDate = dataPoint.dateTo;
            double y = 0.04;
            double? x = double.tryParse(currentSteps);
            if (x != null) {
              double curStep = x * y;
              currentCalorieBurn = curStep.ceil().toString();
              if (user != null) {
                saveCaloriesData(user.uid, currentCalorieBurn);
              }
            }
            if (user != null) {
              saveStepsData(user.uid, stepnow!, firstDataPointDate);
            }
            break;
          }
        }
      }
      _healthDataList.addAll(
          (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
    } catch (error) {
      debugPrint("Exception in getHealthDataFromTypes: $error");
    }
    await biggestStep();
  }

  Future<void> fetchHeartRateData() async {
    setState(() => _state = AppState.FETCHING_DATA);
    User? user = FirebaseAuth.instance.currentUser;

    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day);
    _healthDataList.clear();

    try {
      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(yesterday, now, types);

      if (types.contains(HealthDataType.HEART_RATE)) {
        for (HealthDataPoint dataPoint in healthData) {
          if (dataPoint.type == HealthDataType.HEART_RATE) {
            currentHeartRate = dataPoint.value.toString();

            if (user != null) {
              saveHeartRateData(user.uid, currentHeartRate);
            }
          }
        }
      }
    } catch (error) {
      debugPrint("Exception in getHealthDataFromTypes: $error");
    }
    await biggestHeartRate();
  }

  Future<void> fetchSleepDeepData() async {
    setState(() => _state = AppState.FETCHING_DATA);
    User? user = FirebaseAuth.instance.currentUser;

    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day);
    _healthDataList.clear();

    try {
      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(yesterday, now, types);

      if (types.contains(HealthDataType.SLEEP_SESSION)) {
        for (HealthDataPoint dataPoint in healthData) {
          if (dataPoint.type == HealthDataType.SLEEP_SESSION) {
            currentSleep = dataPoint.value.toString();
            String dateFrom = dataPoint.dateFrom.toString();
            String dateTo = dataPoint.dateTo.toString();

            if (user != null) {
              saveSleepData(user.uid, currentSleep, dateFrom, dateTo);
            }
          }
        }
      }
    } catch (error) {
      debugPrint("Exception in getHealthDataFromTypes: $error");
    }
  }

  Future<void> fetchBloodOxygenData() async {
    setState(() => _state = AppState.FETCHING_DATA);
    User? user = FirebaseAuth.instance.currentUser;

    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day);
    _healthDataList.clear();

    try {
      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(yesterday, now, types);

      if (types.contains(HealthDataType.BLOOD_OXYGEN)) {
        for (HealthDataPoint dataPoint in healthData) {
          if (dataPoint.type == HealthDataType.BLOOD_OXYGEN) {
            currentBloodOxygen = dataPoint.value.toString();
            if (user != null) {
              saveBloodOxygenData(user.uid, currentBloodOxygen);
            }
          }
        }
      }
    } catch (error) {
      debugPrint("Exception in getHealthDataFromTypes: $error");
    }
    await biggestBloodOxygen();
  }

  Future<void> saveStepsData(String userId, int stepsData, DateTime dateTime) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();

    final currentHour = today.hour;
    final databasePath =
        'health/$userId/steps/${today.year}-${today.month}-${today.day}/$currentHour';

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
      debugPrint('Steps data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving steps data to Firebase: $error');
    }
  }

  Future<void> saveCaloriesData(String userId, String calorieburn) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();

    final currentHour = today.hour;
    final databasePath =
        'health/$userId/calories/${today.year}-${today.month}-${today.day}/$currentHour';

    int previousHour = currentHour - 1;

    try {
      // Initialize the total subtracted steps to 0
      double caloriesBurn = double.parse(calorieburn);
      double totalSubtractedCalories = 0;

      // Iterate through all previous hours and subtract their steps
      while (previousHour >= 0) {
        final previousHourPath =
            'health/$userId/calories/${today.year}-${today.month}-${today.day}/$previousHour';
        final previousDataEvent =
            await databaseReference.child(previousHourPath).once();

        DataSnapshot previousDataSnapshot = previousDataEvent.snapshot;
        if (previousDataSnapshot.value != null) {
          // Check the type of the value and convert it to a double if it's an int.
          if (previousDataSnapshot.value is int) {
            totalSubtractedCalories +=
                (previousDataSnapshot.value as int).toDouble();
          } else {
            totalSubtractedCalories += (previousDataSnapshot.value as double);
          }
        }

        // Move to the previous hour
        previousHour--;
      }

      // Calculate the current steps by subtracting the total subtracted steps
      double currentcalories = caloriesBurn - totalSubtractedCalories;

      if (currentcalories < 0) {
        currentcalories = 0;
      }

      // Format the double value to have 2 decimal places
      String formattedCalories = currentcalories.toStringAsFixed(2);
      double roundedCalories = double.parse(formattedCalories);

      // Save the current steps data to Firebase
      await databaseReference.child(databasePath).set(roundedCalories);
      debugPrint('Calories data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Calories data to Firebase: $error');
    }
  }

  Future<void> saveHeartRateData(String userId,String heartrate,) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();

    final currentHour = today.hour;
    final databasePath =
        'health/$userId/heart_rate/${today.year}-${today.month}-${today.day}/$currentHour';

    try {
      int heartRate = int.parse(currentHeartRate);

      await databaseReference.child(databasePath).set(heartRate);
      debugPrint('Heart Rate data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Heart Rate data to Firebase: $error');
    }
  }

  Future<void> saveBloodOxygenData(String userId, String bloodoxygen,) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();

    final currentHour = today.hour;
    final databasePath =
        'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/$currentHour';

    try {
      double heartRate = double.parse(currentBloodOxygen);

      await databaseReference.child(databasePath).set(heartRate);
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

  Future<void> fetchUserData() async {
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
      await fetchStepData(selectedDate);
    }
  }

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
          setState(() {
            _profilePictureUrl = values['profilePictureUrl'] ?? "";
          });
        }
      } catch (error) {
        debugPrint("Error fetching profile picture: $error");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedDate = DateTime.now();
      selectedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      fetchStepData(selectedDate);
    });
    
    fetchHeartRateData();
    fetchSleepDeepData();
    fetchBloodOxygenData();
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                    width: 150 * screenWidth / 375,
                  ),
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
                        onPressed: () {
                          authorize();
                        },
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
                        SizedBox(
                          width: 145 * screenWidth / 375,
                          height: 62 * screenHeight / 375,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CaloriesPage(
                                    currentStep: currentSteps,
                                    currentStepDate: firstDataPointDate,
                                    maxStep: maxStep ??
                                        0, // Use a default value or handle null case
                                  ),
                                ),
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
                                          'Calories',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 35 * screenWidth / 375),
                                        Image(
                                          image: const AssetImage(
                                              'assets/images/flame.png'),
                                          width: 20 * screenWidth / 375,
                                          height: 10 * screenHeight / 375,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15 * screenHeight / 375),
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
                        SizedBox(height: 5 * screenHeight / 375),
                        SizedBox(
                          width: 145 * screenWidth / 375,
                          height: 62 * screenHeight / 375,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StepsPage(
                                            currentStep: currentSteps,
                                            currentStepDate: firstDataPointDate,
                                            maxStep: maxStep ?? 0,
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
                                SizedBox(height: 10 * screenHeight / 375),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10 * screenHeight / 375),
                                    Row(
                                      children: [
                                        const Text(
                                          'Steps',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 35 * screenWidth / 375),
                                        Image(
                                          image: const AssetImage(
                                              'assets/images/icon-Z93.png'),
                                          width: 20 * screenWidth / 375,
                                          height: 10 * screenHeight / 375,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15 * screenHeight / 375),
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
                    SizedBox(width: 10 * screenWidth / 375),
                    SizedBox(
                      width: 145 * screenWidth / 375,
                      height: 129 * screenHeight / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HeartRatePage(
                                currentHeartRate: currentHeartRate, 
                                maxHeartRate: maxHeartRate ?? 0)
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
                    SizedBox(height: 5 * screenHeight / 375),
                    Row(
                      children: [
                        SizedBox(
                          width: 38 * screenWidth / 375,
                        ),
                        SizedBox(
                          width: 145 * screenWidth / 375,
                          height: 62 * screenHeight / 375,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,MaterialPageRoute(
                                  builder: (context) =>
                                    BloodOxygenPage(currentBloodOxygen: currentBloodOxygen, maxBloodOxygen: maxBloodOxygen ?? 0,)
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10 * screenHeight / 375),
                                    Row(
                                      children: [
                                        const Text(
                                          'Blood Oxygen',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 1 * screenWidth / 375),
                                        Image(
                                          image: const AssetImage(
                                              'assets/images/pressure.png'),
                                          width: 20 * screenWidth / 375,
                                          height: 10 * screenHeight / 375,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16 * screenHeight / 375),
                                    Text(
                                      "$currentBloodOxygen%",
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
                        SizedBox(width: 10 * screenWidth / 375),
                        SizedBox(
                          width: 145 * screenWidth / 375,
                          height: 62 * screenHeight / 375,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,MaterialPageRoute(
                                  builder: (context) =>
                                    SleepPage()
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
                    ),
                    SizedBox(height: 5 * screenHeight / 375),
                    SizedBox(
                      width: 300 * screenWidth / 375,
                      height: 62 * screenHeight / 375,
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10 * screenHeight / 375),
                                Row(
                                  children: [
                                    const Text(
                                      'Body Measurements',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 1 * screenWidth / 375),
                                    Image(
                                      image: const AssetImage(
                                          'assets/images/pressure.png'),
                                      width: 20 * screenWidth / 375,
                                      height: 10 * screenHeight / 375,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16 * screenHeight / 375),
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
                    SizedBox(height: 7 * screenHeight / 375),
                    Row(
                      children: [
                        SizedBox(width: 38 * screenWidth / 375),
                        SizedBox(
                          width: 145 * screenWidth / 375,
                          height: 62 * screenHeight / 375,
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10 * screenHeight / 375),
                                    const Row(
                                      children: [
                                        Text(
                                          'BMR Calculator',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16 * screenHeight / 375),
                                    Text(
                                      currentBMR,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Text(
                                      'Basal Metabolic Rate',
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
                        SizedBox(width: 10 * screenWidth / 375),
                        SizedBox(
                          width: 145 * screenWidth / 375,
                          height: 62 * screenHeight / 375,
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10 * screenHeight / 375),
                                    Row(
                                      children: [
                                        const Text(
                                          'BMI Calculator',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 1 * screenWidth / 375),
                                        Image(
                                          image: const AssetImage(
                                              'assets/images/pressure.png'),
                                          width: 20 * screenWidth / 375,
                                          height: 10 * screenHeight / 375,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 14 * screenHeight / 375),
                                    Text(
                                      currentBMI,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Text(
                                      'Body Mass Index',
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
                    SizedBox(height: 20 * screenHeight / 375)
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
