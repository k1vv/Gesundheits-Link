// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UI/Habits/habit_model.dart';
import 'package:myapp/UI/Habits/notification.dart';

class NotificationScheduler {
static Future<void> scheduleNotifications() async {

  List<Habit> habits = await _fetchHabits();
  DateTime now = DateTime.now();
  DateTime targetTime;

  for (Habit habit in habits) {
    if (now.hour < 8 && habit.timeRange == "Morning" && habit.isStarred == false) {
      targetTime = DateTime(now.year, now.month, now.day, 8, 0);
      Duration delay = targetTime.difference(now);

      LocalNotifications.showScheduleNotification(
        title: 'Morning Reminder',
        body: 'You still have unfinished habits',
        payload: 'Scheduled Notification Payload',
        delay: delay,
      );
    } else if (now.hour < 13 && habit.timeRange == "Afternoon" && habit.isStarred == false) {
      targetTime = DateTime(now.year, now.month, now.day, 13, 0);
      Duration delay = targetTime.difference(now);

      LocalNotifications.showScheduleNotification(
        title: 'Afternoon Reminder',
        body: 'You still have unfinished habits',
        payload: 'Scheduled Notification Payload',
        delay: delay,
      );
    } else if (now.hour < 19 && habit.timeRange == "Evening" && habit.isStarred == false) {
      targetTime = DateTime(now.year, now.month, now.day, 19, 0);
      Duration delay = targetTime.difference(now);

      LocalNotifications.showScheduleNotification(
        title: 'Evening Reminder',
        body: 'You still have unfinished habits',
        payload: 'Scheduled Notification Payload',
        delay: delay,
      );
    } else if (now.hour < 8 && habit.timeRange == "Anytime" && habit.isStarred == false) {
  // Set the targetTime to 2 minutes from now
  DateTime targetTime = now.add(const Duration(minutes: 2));
  Duration delay = targetTime.difference(now);

  LocalNotifications.showScheduleNotification(
    title: 'Anytime Message',
    body: 'You still have unfinished habits',
    payload: 'Scheduled Notification Payload',
    delay: const Duration(minutes: 1),
  );
  debugPrint("success");
} else if (now.hour < 13 && habit.timeRange == "Anytime" && habit.isStarred == false) {
      DateTime targetTime = now.add(const Duration(minutes: 2));
      Duration delay = targetTime.difference(now);

      LocalNotifications.showScheduleNotification(
        title: 'Anytime Message',
        body: 'You still have unfinished habits',
        payload: 'Scheduled Notification Payload',
        delay: delay,
      );
      debugPrint("success");
    } else if (now.hour < 19 && habit.timeRange == "Anytime" && habit.isStarred == false) {
      DateTime targetTime = now.add(const Duration(minutes: 2));
      Duration delay = targetTime.difference(now);

      LocalNotifications.showScheduleNotification(
        title: 'Anytime Message',
        body: 'You still have unfinished habits',
        payload: 'Scheduled Notification Payload',
        delay: delay,  
      );
      debugPrint("success");
    } else if (now.hour > 19) {
      DateTime targetTime = now.add(const Duration(minutes: 1));
      Duration delay = targetTime.difference(now);

      LocalNotifications.showScheduleNotification(
        title: 'You Have unfinished Habits',
        body: 'Drink Water \n\n Finish your habit now',
        payload: 'Scheduled Notification Payload',
        delay: delay,
      );
      debugPrint("success");
    } 
  }
}

static Future<List<Habit>> _fetchHabits() async {
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    String userId = user.uid;
    final databasePath = 'Habits/$userId/';

    try {
      DatabaseEvent event = await databaseReference.child(databasePath).once();
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        if (snapshot.value is Map<dynamic, dynamic>) {
          Map<dynamic, dynamic> habitsData = snapshot.value! as Map<dynamic, dynamic>;
          List<Habit> fetchedHabits = [];

          habitsData.forEach((key, value) {
            Habit habit = Habit(
              id: value['id'],
              name: value['name'],
              description: value['description'],
              isStarred: value['isStarred'],
              habitIcon: _parseIconData(value['habitIcon']),
              iconColor: Color(value['iconColor']),
              timeRange: value['timeRange'],
              frequency: value['frequency'],
              startTime: value['startTime'],
              startHabitTime: DateTime.parse(value['startTimeDate']),
              endTime: DateTime.parse(value['endTime']),
              endHabitTime: value['endHabitTime'],
            );
            fetchedHabits.add(habit);
          });

          return fetchedHabits; // Return the list of fetched habits
        } else {
          debugPrint("Data is not in the expected format");
        }
      } else {
        debugPrint("Snapshot value is null");
      }
    } catch (error) {
      debugPrint("Error fetching habits: $error");
    }
  }
  return [];
}

static const String defaultFontFamily = 'MaterialIcons';

static IconData _parseIconData(String iconString) {
  final regex = RegExp(r'U\+(\w+)');
  final match = regex.firstMatch(iconString);
  if (match != null) {
    final codePoint = int.parse(match.group(1)!, radix: 16);
    return IconData(codePoint, fontFamily: defaultFontFamily);
  } else {
    debugPrint('Invalid iconString format: $iconString');
    return Icons.error;
  }
}
}
