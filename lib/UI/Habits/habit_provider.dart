import 'package:flutter/material.dart';
import 'package:myapp/UI/Habits/habit_model.dart';

class HabitProvider extends ChangeNotifier {
  List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  void addHabit(Habit habit) {
    _habits.add(habit);
    notifyListeners();
  }

  void setHabits(List<Habit> newHabits) {
    _habits = newHabits;
    notifyListeners();
  }
  
    void removeHabit(int index) {
    _habits.removeAt(index);
    notifyListeners();
  }

  // Add more methods for removing or updating habits as needed
}
