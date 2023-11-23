// habit_model.dart
import 'package:flutter/cupertino.dart';

class Habit {
  final String id;
  final String name;
  final String description;
  final String frequency;
  final String endHabitTime;
  final IconData habitIcon;
  final Color iconColor;
  final String timeRange;
  final String startTime;
  final DateTime startHabitTime;
  final DateTime endTime;
  bool isStarred;

  Habit({
    required this.id,
    required this.name,
    required this.description,
    required this.isStarred,  
    required this.habitIcon,
    required this.iconColor,
    required this.timeRange,
    required this.frequency,
    required this.startTime,
    required this.startHabitTime,
    required this.endTime,
    required this.endHabitTime,
  });
}
