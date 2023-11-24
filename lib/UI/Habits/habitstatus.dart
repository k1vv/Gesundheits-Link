import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UI/Habits/habit_model.dart';

class HabitStatus {
  static Future<List<Habit>> fetchHabits() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;
      final databasePath = 'Habits/$userId/';

      try {
        DatabaseEvent event =
            await databaseReference.child(databasePath).once();
        DataSnapshot snapshot = event.snapshot;

        if (snapshot.value != null) {
          if (snapshot.value is Map<dynamic, dynamic>) {
            Map<dynamic, dynamic> habitsData =
                snapshot.value! as Map<dynamic, dynamic>;
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
            return fetchedHabits;
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

  static IconData _parseIconData(String iconString) {
    final regex = RegExp(r'U\+(\w+)');
    final match = regex.firstMatch(iconString);
    if (match != null) {
      final codePoint = int.parse(match.group(1)!, radix: 16);
      return IconData(codePoint, fontFamily: 'MaterialIcons');
    } else {
      debugPrint('Invalid iconString format: $iconString');
      return Icons.error;
    }
  }
}