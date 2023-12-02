// ignore_for_file: constant_identifier_names, unused_field, prefer_final_fields

import 'package:health/health.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

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


class BackgroundTasks {

  static int _nofSteps = 0;
  static final types = [
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_IN_BED,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
    HealthDataType.STEPS, 
    HealthDataType.HEART_RATE, 
    HealthDataType.BLOOD_OXYGEN
   ];
  static List<HealthDataPoint> _healthDataList = [];
  static AppState _state = AppState.DATA_NOT_FETCHED;
  static HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);
  static final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

  static String currentSteps = "N/A";
  static String currentSleepRem = "N/A";
  static String currentSleepDeep = "N/A";
  static String currentHeartRate = "N/A";
  static String currentSleepInBed = "N/A";
  static String currentSleepLight = "N/A";
  static String currentCalorieBurn = "N/A";
  static String currentBloodOxygen = "N/A";
  static String currentSleepSession = "N/A";
  
  static String sleepSessionDateTo = "N/A";
  static String sleepSessionDateFrom = "N/A";

  static DateTime selectedDate = DateTime.now();
  static DateTime firstDataPointDate = DateTime.now();

  static initializeBackgroundTasks() async {
    _scheduleBackgroundTask(0, 0, 40);
    _scheduleBackgroundTask(1, 2, 0);
    _scheduleBackgroundTask(2, 3, 0);
    _scheduleBackgroundTask(3, 4, 0);
    _scheduleBackgroundTask(4, 5, 0);
    _scheduleBackgroundTask(5, 6, 0);
    _scheduleBackgroundTask(6, 7, 0);
    _scheduleBackgroundTask(7, 8, 0);
    _scheduleBackgroundTask(8, 9, 0);
    _scheduleBackgroundTask(9, 10, 0);
    _scheduleBackgroundTask(10, 11, 0);
    _scheduleBackgroundTask(11, 12, 0);
    _scheduleBackgroundTask(12, 13, 0);
    _scheduleBackgroundTask(13, 14, 0);
    _scheduleBackgroundTask(14, 15, 0);
    _scheduleBackgroundTask(15, 16, 0);
    _scheduleBackgroundTask(16, 17, 0);
    _scheduleBackgroundTask(17, 18, 0);
    _scheduleBackgroundTask(18, 19, 0);
    _scheduleBackgroundTask(19, 20, 0);
    _scheduleBackgroundTask(20, 21, 0);
    _scheduleBackgroundTask(21, 22, 0);
    _scheduleBackgroundTask(22, 22, 0);
    _scheduleBackgroundTask(23, 23, 59);
  }

  static void _scheduleBackgroundTask(int alarmId, int hour, int minute) {
    AndroidAlarmManager.periodic(
      const Duration(days: 1), // 24 hours for daily interval
      alarmId,
      _backgroundTaskCallback,
      startAt: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, hour, minute),
      exact: true,
      wakeup: true,
    );
  }

  static void _backgroundTaskCallback() async {
    fetchUserHealthData(selectedDate);
  }

  static Future<void> fetchUserHealthData(DateTime selectedDate) async {                            // Only one that works when changing the date of the data being fetched
    _state = AppState.FETCHING_DATA;
    User? user = FirebaseAuth.instance.currentUser;

    _healthDataList.clear();

    try {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        selectedDate,
        selectedDate.add(const Duration(days: 1)),
        types,
      );
      if (user != null) {
        if (types.contains(HealthDataType.STEPS)) {
          for (HealthDataPoint dataPoint in healthData) {
            if (dataPoint.type == HealthDataType.STEPS) {
              currentSteps = dataPoint.value.toString();

              // add function to save step data to firebase realtime database

            } else if (types.contains(HealthDataType.SLEEP_SESSION)) {
              currentSleepSession = dataPoint.value.toString();
              sleepSessionDateFrom = dataPoint.dateFrom.toString();
              sleepSessionDateTo = dataPoint.dateTo.toString();

              saveSleepSession(user.uid, currentSleepSession, sleepSessionDateFrom, sleepSessionDateTo);

            } else if (types.contains(HealthDataType.SLEEP_DEEP)) {
              currentSleepDeep = dataPoint.value.toString();

              //saveSleepDeep(user.uid, currentSleepDeep);

            } else if (types.contains(HealthDataType.SLEEP_LIGHT)) {
              currentSleepLight = dataPoint.value.toString();

              //saveSleepLight(user.uid, currentSleepLight);

            } else if (types.contains(HealthDataType.SLEEP_REM)) {
              currentSleepRem = dataPoint.value.toString();

              //saveSleepRem(user.uid, currentSleepRem);

            }else if (types.contains(HealthDataType.SLEEP_IN_BED)) {
              currentSleepInBed = dataPoint.value.toString();

              //saveSleepInBed(user.uid, currentSleepInBed);

            } else if (types.contains(HealthDataType.STEPS)) {
              currentSteps == dataPoint.value.toString();

              saveSteps(user.uid, int.parse(currentSteps));

            }else if (types.contains(HealthDataType.HEART_RATE)) {
              currentHeartRate = dataPoint.value.toString();

              saveHeartRate(user.uid, currentHeartRate);
            } else if (types.contains(HealthDataType.BLOOD_OXYGEN)) {
              currentBloodOxygen = dataPoint.value.toString();

              saveBloodOxygen(user.uid, currentBloodOxygen);

            }
          }
        }
        _healthDataList.addAll((healthData.length < 100) ? healthData : healthData.sublist(0, 100));
      } else {
        debugPrint("User is not logged in");
      }
    } catch (error) {
      debugPrint("Exception in getHealthDataFromTypes: $error");
    }
  }

  static Future<void> saveSteps(String userId, int stepsData) async {
    final today = DateTime.now();
    final currentHour = today.hour;
    final databaseReference = FirebaseDatabase.instance.ref();
    final databasePath = 'health/$userId/steps/${today.year}-${today.month}-${today.day}/$currentHour';

    int previousHour = currentHour - 1;
    try {
      int totalSubtractedSteps = 0;

      while (previousHour >= 0) {                                                                                                         // Iterate through all previous hours and subtract their steps
        final previousHourPath = 'health/$userId/steps/${today.year}-${today.month}-${today.day}/$previousHour';
        final previousDataEvent = await databaseReference.child(previousHourPath).once();

        DataSnapshot previousDataSnapshot = previousDataEvent.snapshot;
        if (previousDataSnapshot.value != null) {
          totalSubtractedSteps += (previousDataSnapshot.value as int);
        }

        previousHour--;
      }

      int currentStep = stepsData - totalSubtractedSteps;
      if (currentStep < 0) {
        currentStep = 0;
      }
      await databaseReference.child(databasePath).set(currentStep);

      debugPrint('Steps data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving steps data to Firebase: $error');
    }
  }

  static Future<void> saveHeartRate(String userId,String heartrate,) async {
    final today = DateTime.now();
    final currentHour = today.hour;
    final databaseReference = FirebaseDatabase.instance.ref();
    final databasePath = 'health/$userId/heart_rate/${today.year}-${today.month}-${today.day}/$currentHour';

    try {
      await databaseReference.child(databasePath).set(heartrate);

      debugPrint('Heart Rate data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Heart Rate data to Firebase: $error');
    }
  }

  static Future<void> saveBloodOxygen(String userId,String bloodOxygen,) async {
    final today = DateTime.now();
    final currentHour = today.hour;
    final databaseReference = FirebaseDatabase.instance.ref();
    final databasePath = 'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/$currentHour';

    try {
      await databaseReference.child(databasePath).set(bloodOxygen);

      debugPrint('Heart Rate data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Heart Rate data to Firebase: $error');
    }
  }

  static Future<void> saveSleepSession(String userId, String sleep, String dateFrom, String dateTo) async {
    final databaseReference = FirebaseDatabase.instance.ref();
    final today = DateTime.now();
  
    final databasePath = 'health/$userId/sleep_session/${today.year}-${today.month}-${today.day}/';
  
    try {
      await databaseReference.child('$databasePath/total').set(sleep);
      await databaseReference.child('$databasePath/dateFrom').set(dateFrom);
      await databaseReference.child('$databasePath/dateTo').set(dateTo);
  
      debugPrint('Sleep data saved to Firebase at $databasePath');
    } catch (error) {
      debugPrint('Error saving Sleep data to Firebase: $error');
    }
  }
}
