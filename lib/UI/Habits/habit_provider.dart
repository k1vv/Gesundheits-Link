// habit_provider.dart
import 'package:flutter/material.dart';
import 'habit_model.dart';

class HabitProvider extends ChangeNotifier {
  List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  void addHabit(Habit habit) {
    _habits.add(habit);
    notifyListeners();
  }

  // Add more methods for removing or updating habits as needed
}
