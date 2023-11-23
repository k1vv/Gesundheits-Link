import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/UI/Habits/habit_model.dart';
import 'package:myapp/UI/Habits/sethabits_page.dart';
import 'package:myapp/UI/Habits/habit_provider.dart';
import 'package:firebase_database/firebase_database.dart';



class Habits extends StatefulWidget { 
  const Habits({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HabitsState createState() => _HabitsState();
}

class _HabitsState extends State<Habits> {

  late int selectedHabitIndex;
  late DatabaseReference _databaseReference;

  Future<void> _updateIsStarredInDatabase(String habitId, bool isStarred) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;
      final databaseReference = FirebaseDatabase.instance.ref();
      final databasePath = 'Habits/$userId/';

      // Update the isStarred property in the Firebase Realtime Database
      await databaseReference.child(databasePath).child(habitId).update({
        'isStarred': isStarred,
      }).catchError((error) {
        // Handle error if the update fails
        debugPrint("Error updating isStarred in Firebase: $error");
      });
    }
  }

  void _fetchHabits() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      final databasePath = 'Habits/$userId/';

      try {
        DatabaseEvent event = await _databaseReference.child(databasePath).once();
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

            // ignore: use_build_context_synchronously
            HabitProvider habitProvider = Provider.of<HabitProvider>(context, listen: false);
            habitProvider.setHabits(fetchedHabits);
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
  }

  IconData _parseIconData(String iconString) {
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

  void _showDeleteConfirmationDialog(Habit habit, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Habit'),
          content: const Text('Are you sure you want to delete this habit?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteHabit(habit, index);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteHabit(Habit habit, int index) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;
      final databaseReference = FirebaseDatabase.instance.ref();
      final databasePath = 'Habits/$userId/';

      // Get the habit ID to delete
      String habitId = habit.id;

      // Remove the habit from the Firebase Realtime Database
      databaseReference.child(databasePath).child(habitId).remove().then((_) {
        // If the deletion from the database is successful, remove it from the local state
        HabitProvider habitProvider = Provider.of<HabitProvider>(context, listen: false);
        habitProvider.removeHabit(index);
      }).catchError((error) {
        // Handle error if the deletion fails
        debugPrint("Error deleting habit from Firebase: $error");
      });
    }
  }

  @override
  void initState() {
    super.initState(); 
    selectedHabitIndex = -1; 
    _databaseReference = FirebaseDatabase.instance.ref();
    _fetchHabits();
  }

@override
Widget build(BuildContext context) {
  var habitProvider = Provider.of<HabitProvider>(context);
  var habits = habitProvider.habits;
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 255, 241, 245),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 35 * screenHeight / 375,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 25 * screenWidth / 375,
                  height: 25 * screenHeight / 375,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 197, 216),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SetHabits()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      elevation: 4,
                      backgroundColor: const Color.fromARGB(255, 255, 130, 149),
                      shadowColor: const Color(0xffff6079),
                      foregroundColor: Colors.grey,
                      surfaceTintColor: Colors.transparent,
                    ),
                    child: Image.asset(
                      'assets/images/plus.png',
                      width: 55 * screenWidth / 375,
                      height: 55 * screenHeight / 375,
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  'Habits',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Expanded(
                child: Text(
                  'placeholder',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.transparent),
                ),
              ),
            ],
          ),
          // Use a ListView.builder to dynamically build the habit list
          habits.isNotEmpty
              ? Container(
                  padding: EdgeInsets.only(
                    left: 15 * screenWidth / 375,
                    right: 15 * screenWidth / 375,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      var habit = habits[index];
                      bool isSelected = selectedHabitIndex == index;
                      return Column(
                        children: [
                          SizedBox(
                            width: 310 * screenWidth / 375,
                            height: isSelected ? 80 * screenHeight / 375 : 30 * screenHeight / 375,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedHabitIndex = isSelected ? -1 : index;
                                });
                              },
                              onLongPress: () {
                                _showDeleteConfirmationDialog(habit, index);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: Colors.white,
                                shadowColor: Colors.black,
                                surfaceTintColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                elevation: 2,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30 * screenWidth / 375,
                                        height: 30 * screenHeight / 375,
                                        child: Icon(
                                          habit.habitIcon,
                                          color: habit.iconColor,
                                        ),
                                      ),
                                      SizedBox(width: 10 * screenWidth / 375),
                                      SizedBox(
                                        width: 175 * screenWidth / 375,
                                        child: Text(
                                          habit.name,
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Icon(
                                          Icons.check,
                                          color: habits[index].isStarred
                                              ? const Color.fromARGB(255, 255, 96, 121) 
                                              : Colors.white,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          setState(() {
                                            habits[index].isStarred = !habits[index].isStarred;
                                          });
                                          await _updateIsStarredInDatabase(habits[index].id, habits[index].isStarred);
                                        },
                                        child: Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            SizedBox(
                                              child: Icon(
                                                Icons.star,
                                                color: habits[index].isStarred
                                                    ? const Color.fromARGB(255, 255, 96, 121)
                                                    : Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Icon(
                                                Icons.star_border,
                                                color: habits[index].isStarred
                                                    ? const Color.fromARGB(255, 255, 96, 121)
                                                    : Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  isSelected
                                  ? Expanded(
                                      child: Column(
                                      children: [
                                        const Divider(),
                                        SizedBox(
                                          child: Text(
                                            habit.description,
                                            style: const TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  : Container(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5 * screenHeight / 375)
                        ],
                      );
                    },
                  ),
                )
              : Column(
                  children: [
                    SizedBox(height: 100 * screenHeight / 375,),
                    const Text(
                      "No Habits Yet.", 
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(200, 158, 158, 158)
                      ),
                    ), 
                    const Text(
                      "Add a Habits Using the + Button.", 
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(200, 158, 158, 158)
                      ),
                    ), 
                  ],
                ),
        ],
      ),
    ),
  );
}
}
