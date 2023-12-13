// ignore_for_file: unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:myapp/UI/Habits/habit_model.dart';
import 'package:myapp/UI/Habits/habit_provider.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:myapp/UI/Habits/customhabits.dart';
import 'package:provider/provider.dart';

class SetHabits extends StatefulWidget {
  const SetHabits({super.key});

  @override
  State<SetHabits> createState() => _SetHabitsState();
}

class _SetHabitsState extends State<SetHabits> {
  IconData selectedIcon= Icons.abc;
  


  Future<void> createSaveHabitExercise() async {
    selectedIcon = Icons.sports_handball;
    MaterialColor selectedColor = Colors.blue;
    User? user = FirebaseAuth.instance.currentUser;
    String habitName = "Exercise";
    String habitDescription = "Your Daily Exercise";
    DateTime startDateTime = DateTime.now();
    DateTime endDateTime = DateTime.now();
    DateTime yesterdayDateTime = endDateTime.subtract(const Duration(days: 1));
    

    if (user != null) {
      String userId = user.uid;
      final databaseReference = FirebaseDatabase.instance.ref();
      final databasePath = 'Habits/$userId/';

      if (habitName.isNotEmpty) {
        // Generate a custom habit ID
        String customHabitId = await generateCustomHabitId(databaseReference.child(databasePath));

          Habit newHabit = Habit(
            id: customHabitId,
            name: habitName,
            description: habitDescription,
            habitIcon: selectedIcon,
            iconColor: selectedColor,
            timeRange: "Anytime",
            frequency: "Daily",
            startTime: "13-12-2023",
            startHabitTime: startDateTime,
            endTime: yesterdayDateTime,
            endHabitTime: "12-12-2023",
            isStarred: false                            
          );

        // ignore: use_build_context_synchronously
        HabitProvider habitProvider = Provider.of<HabitProvider>(context, listen: false);
        habitProvider.addHabit(newHabit);

        databaseReference.child(databasePath).child(customHabitId).set({
          "id": newHabit.id,
          "name": newHabit.name,
          "description": newHabit.description,
          "isStarred": newHabit.isStarred,
          "habitIcon": newHabit.habitIcon.toString(),
          "iconColor": newHabit.iconColor.value,
          "timeRange": newHabit.timeRange,
          "frequency": newHabit.frequency,
          "startTime": newHabit.startTime,
          "startTimeDate": newHabit.startHabitTime.toIso8601String(),
          "endTime": newHabit.endTime.toIso8601String(),
          "endHabitTime": newHabit.endHabitTime,
        });

        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage(initialIndex: 1,)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a habit name.')));
      }
    } else {
      debugPrint("Error saving habits to firebase");
    }
  }

  Future<void> createSaveHabitStrech() async {
    selectedIcon = Icons.sports_gymnastics;
    MaterialColor selectedColor = Colors.blue;
    User? user = FirebaseAuth.instance.currentUser;
    String habitName = "Strech";
    String habitDescription = "Your Daily Strech";
    DateTime startDateTime = DateTime.now();
    DateTime endDateTime = DateTime.now();
    DateTime yesterdayDateTime = endDateTime.subtract(const Duration(days: 1));
    

    if (user != null) {
      String userId = user.uid;
      final databaseReference = FirebaseDatabase.instance.ref();
      final databasePath = 'Habits/$userId/';

      if (habitName.isNotEmpty) {
        // Generate a custom habit ID
        String customHabitId = await generateCustomHabitId(databaseReference.child(databasePath));

          Habit newHabit = Habit(
            id: customHabitId,
            name: habitName,
            description: habitDescription,
            habitIcon: selectedIcon,
            iconColor: selectedColor,
            timeRange: "Anytime",
            frequency: "Daily",
            startTime: "13-12-2023",
            startHabitTime: startDateTime,
            endTime: yesterdayDateTime,
            endHabitTime: "12-12-2023",
            isStarred: false                            
          );

        // ignore: use_build_context_synchronously
        HabitProvider habitProvider = Provider.of<HabitProvider>(context, listen: false);
        habitProvider.addHabit(newHabit);

        databaseReference.child(databasePath).child(customHabitId).set({
          "id": newHabit.id,
          "name": newHabit.name,
          "description": newHabit.description,
          "isStarred": newHabit.isStarred,
          "habitIcon": newHabit.habitIcon.toString(),
          "iconColor": newHabit.iconColor.value,
          "timeRange": newHabit.timeRange,
          "frequency": newHabit.frequency,
          "startTime": newHabit.startTime,
          "startTimeDate": newHabit.startHabitTime.toIso8601String(),
          "endTime": newHabit.endTime.toIso8601String(),
          "endHabitTime": newHabit.endHabitTime,
        });

        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage(initialIndex: 1,)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a habit name.')));
      }
    } else {
      debugPrint("Error saving habits to firebase");
    }
  }

  Future<void> createSaveHabitReading() async {
    selectedIcon = Icons.book_outlined;
    MaterialColor selectedColor = Colors.blue;
    User? user = FirebaseAuth.instance.currentUser;
    String habitName = "Reading";
    String habitDescription = "Read A Book";
    DateTime startDateTime = DateTime.now();
    DateTime endDateTime = DateTime.now();
    DateTime yesterdayDateTime = endDateTime.subtract(const Duration(days: 1));
    

    if (user != null) {
      String userId = user.uid;
      final databaseReference = FirebaseDatabase.instance.ref();
      final databasePath = 'Habits/$userId/';

      if (habitName.isNotEmpty) {
        // Generate a custom habit ID
        String customHabitId = await generateCustomHabitId(databaseReference.child(databasePath));

          Habit newHabit = Habit(
            id: customHabitId,
            name: habitName,
            description: habitDescription,
            habitIcon: selectedIcon,
            iconColor: selectedColor,
            timeRange: "Anytime",
            frequency: "Daily",
            startTime: "13-12-2023",
            startHabitTime: startDateTime,
            endTime: yesterdayDateTime,
            endHabitTime: "12-12-2023",
            isStarred: false                            
          );

        // ignore: use_build_context_synchronously
        HabitProvider habitProvider = Provider.of<HabitProvider>(context, listen: false);
        habitProvider.addHabit(newHabit);

        databaseReference.child(databasePath).child(customHabitId).set({
          "id": newHabit.id,
          "name": newHabit.name,
          "description": newHabit.description,
          "isStarred": newHabit.isStarred,
          "habitIcon": newHabit.habitIcon.toString(),
          "iconColor": newHabit.iconColor.value,
          "timeRange": newHabit.timeRange,
          "frequency": newHabit.frequency,
          "startTime": newHabit.startTime,
          "startTimeDate": newHabit.startHabitTime.toIso8601String(),
          "endTime": newHabit.endTime.toIso8601String(),
          "endHabitTime": newHabit.endHabitTime,
        });

        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage(initialIndex: 1,)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a habit name.')));
      }
    } else {
      debugPrint("Error saving habits to firebase");
    }
  }

  Future<void> createSaveHabitDrinkWater() async {
    selectedIcon = Icons.water_drop_outlined;
    MaterialColor selectedColor = Colors.blue;
    User? user = FirebaseAuth.instance.currentUser;
    String habitName = "Drink Water";
    String habitDescription = "8 Glass of water dailys";
    DateTime startDateTime = DateTime.now();
    DateTime endDateTime = DateTime.now();
    DateTime yesterdayDateTime = endDateTime.subtract(const Duration(days: 1));
    

    if (user != null) {
      String userId = user.uid;
      final databaseReference = FirebaseDatabase.instance.ref();
      final databasePath = 'Habits/$userId/';

      if (habitName.isNotEmpty) {
        // Generate a custom habit ID
        String customHabitId = await generateCustomHabitId(databaseReference.child(databasePath));

          Habit newHabit = Habit(
            id: customHabitId,
            name: habitName,
            description: habitDescription,
            habitIcon: selectedIcon,
            iconColor: selectedColor,
            timeRange: "Anytime",
            frequency: "Daily",
            startTime: "13-12-2023",
            startHabitTime: startDateTime,
            endTime: yesterdayDateTime,
            endHabitTime: "12-12-2023",
            isStarred: false                            
          );

        // ignore: use_build_context_synchronously
        HabitProvider habitProvider = Provider.of<HabitProvider>(context, listen: false);
        habitProvider.addHabit(newHabit);

        databaseReference.child(databasePath).child(customHabitId).set({
          "id": newHabit.id,
          "name": newHabit.name,
          "description": newHabit.description,
          "isStarred": newHabit.isStarred,
          "habitIcon": newHabit.habitIcon.toString(),
          "iconColor": newHabit.iconColor.value,
          "timeRange": newHabit.timeRange,
          "frequency": newHabit.frequency,
          "startTime": newHabit.startTime,
          "startTimeDate": newHabit.startHabitTime.toIso8601String(),
          "endTime": newHabit.endTime.toIso8601String(),
          "endHabitTime": newHabit.endHabitTime,
        });

        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage(initialIndex: 1,)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a habit name.')));
      }
    } else {
      debugPrint("Error saving habits to firebase");
    }
  }

  Future<void> createSaveHabitRunning() async {
    selectedIcon = Icons.directions_run;
    MaterialColor selectedColor = Colors.blue;
    User? user = FirebaseAuth.instance.currentUser;
    String habitName = "Running";
    String habitDescription = "Time to start running";
    DateTime startDateTime = DateTime.now();
    DateTime endDateTime = DateTime.now();
    DateTime yesterdayDateTime = endDateTime.subtract(const Duration(days: 1));
    

    if (user != null) {
      String userId = user.uid;
      final databaseReference = FirebaseDatabase.instance.ref();
      final databasePath = 'Habits/$userId/';

      if (habitName.isNotEmpty) {
        // Generate a custom habit ID
        String customHabitId = await generateCustomHabitId(databaseReference.child(databasePath));

          Habit newHabit = Habit(
            id: customHabitId,
            name: habitName,
            description: habitDescription,
            habitIcon: selectedIcon,
            iconColor: selectedColor,
            timeRange: "Anytime",
            frequency: "Daily",
            startTime: "13-12-2023",
            startHabitTime: startDateTime,
            endTime: yesterdayDateTime,
            endHabitTime: "12-12-2023",
            isStarred: false                            
          );

        // ignore: use_build_context_synchronously
        HabitProvider habitProvider = Provider.of<HabitProvider>(context, listen: false);
        habitProvider.addHabit(newHabit);

        databaseReference.child(databasePath).child(customHabitId).set({
          "id": newHabit.id,
          "name": newHabit.name,
          "description": newHabit.description,
          "isStarred": newHabit.isStarred,
          "habitIcon": newHabit.habitIcon.toString(),
          "iconColor": newHabit.iconColor.value,
          "timeRange": newHabit.timeRange,
          "frequency": newHabit.frequency,
          "startTime": newHabit.startTime,
          "startTimeDate": newHabit.startHabitTime.toIso8601String(),
          "endTime": newHabit.endTime.toIso8601String(),
          "endHabitTime": newHabit.endHabitTime,
        });

        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage(initialIndex: 1,)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a habit name.')));
      }
    } else {
      debugPrint("Error saving habits to firebase");
    }
  }

  Future<void> createSaveHabitWalk() async {
    selectedIcon = Icons.directions_walk;
    MaterialColor selectedColor = Colors.blue;
    User? user = FirebaseAuth.instance.currentUser;
    String habitName = "Walk";
    String habitDescription = "Time to go out for a walk";
    DateTime startDateTime = DateTime.now();
    DateTime endDateTime = DateTime.now();
    DateTime yesterdayDateTime = endDateTime.subtract(const Duration(days: 1));
    

    if (user != null) {
      String userId = user.uid;
      final databaseReference = FirebaseDatabase.instance.ref();
      final databasePath = 'Habits/$userId/';

      if (habitName.isNotEmpty) {
        // Generate a custom habit ID
        String customHabitId = await generateCustomHabitId(databaseReference.child(databasePath));

          Habit newHabit = Habit(
            id: customHabitId,
            name: habitName,
            description: habitDescription,
            habitIcon: selectedIcon,
            iconColor: selectedColor,
            timeRange: "Anytime",
            frequency: "Daily",
            startTime: "13-12-2023",
            startHabitTime: startDateTime,
            endTime: yesterdayDateTime,
            endHabitTime: "12-12-2023",
            isStarred: false                            
          );

        // ignore: use_build_context_synchronously
        HabitProvider habitProvider = Provider.of<HabitProvider>(context, listen: false);
        habitProvider.addHabit(newHabit);

        databaseReference.child(databasePath).child(customHabitId).set({
          "id": newHabit.id,
          "name": newHabit.name,
          "description": newHabit.description,
          "isStarred": newHabit.isStarred,
          "habitIcon": newHabit.habitIcon.toString(),
          "iconColor": newHabit.iconColor.value,
          "timeRange": newHabit.timeRange,
          "frequency": newHabit.frequency,
          "startTime": newHabit.startTime,
          "startTimeDate": newHabit.startHabitTime.toIso8601String(),
          "endTime": newHabit.endTime.toIso8601String(),
          "endHabitTime": newHabit.endHabitTime,
        });

        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage(initialIndex: 1,)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a habit name.')));
      }
    } else {
      debugPrint("Error saving habits to firebase");
    }
  }

  Future<String> generateCustomHabitId(DatabaseReference reference) async {
    String baseId = 'HB';
    int counter = 1;
    String customHabitId = '$baseId${counter.toString().padLeft(3, '0')}';

    while (await checkIfIdExists(reference, customHabitId)) {
      counter++;
      customHabitId = '$baseId${counter.toString().padLeft(3, '0')}';
    }
    return customHabitId;
  }

  Future<bool> checkIfIdExists(DatabaseReference reference, String habitId) async {
    DatabaseEvent event = await reference.child(habitId).once();
    DataSnapshot snapshot = event.snapshot;
    return snapshot.value != null;
  }
  
  _openIconPicker() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
      context,
      iconPackModes: [IconPack.cupertino, IconPack.lineAwesomeIcons, IconPack.fontAwesomeIcons, IconPack.material],
    );

    if (icon != null) {
      setState(() {
        selectedIcon = icon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 241, 245),
        title: Row(
              children: [
                Expanded(
                  child: SizedBox(
                      width: 23 * screenWidth / 375,
                      height: 23 * screenHeight / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(
                            builder: (context) => const MainPage(initialIndex: 1,)
                            )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            elevation: 0,
                            backgroundColor: const Color.fromARGB(255, 255, 241, 245),
                            foregroundColor: const Color.fromARGB(255, 255, 241, 245),
                            surfaceTintColor: const Color.fromARGB(255, 255, 241, 245),
                            shadowColor: const Color.fromARGB(255, 255, 241, 245),
                            side: const BorderSide(color: Colors.grey)),
                        child: Image.asset(
                          'assets/images/arrowback.png',
                          width: 70 * screenWidth / 375,
                          height: 70 * screenHeight / 375,
                        ),
                      )
                      ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Set Your Habits',
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Placeholder',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.transparent),
                  ),
                )
              ],
            ),
            automaticallyImplyLeading: false,
            surfaceTintColor: const Color.fromARGB(255, 255, 241, 245),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10 * screenHeight / 375,
            ),
            SizedBox(
              width: 125,
              height: 125,
              child: Image.asset(
                'assets/images/fallingstar.png',
                width: 125 * screenWidth / 375,
                height: 125 * screenHeight / 375,
              ),
            ),
            const Text(
              'Custom Your Own Habit',
              style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5 * screenHeight / 375,
            ),
            const Text(
              'Star Your Favorite Habit',
              style: TextStyle(
                  fontFamily: 'Arial', fontSize: 12, color: Colors.grey),
            ),
            SizedBox(
              height: 20 * screenHeight / 375,
            ),
            Container(
              width: screenWidth,
              height: 292 * screenHeight / 375,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20 * screenHeight / 375,
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Habits',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          child: Text(
                        'Placeholder',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.transparent),
                      )),
                      Expanded(
                          child: Text(
                        'Placeholder',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.transparent),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      Container(
                        width: 60 * screenWidth / 375,
                        height: 60 * screenWidth / 375, // Make the height equal to the width
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 255, 241, 245),
                        ),
                        child: const Icon(
                          Icons.account_circle_rounded, // Replace with the desired icon from the Icons class
                          size: 34.0, // Adjust the size according to your needs
                          color: Colors.black, // Adjust the color according to your needs
                        ),
                      ),
                      SizedBox(width: 30 * screenWidth / 375,), 
                      const Text(
                        'Custom Your Own', 
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14
                        ),
                      ),
                      SizedBox(width: 61 * screenWidth / 375,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const CustomHabits()));
                        },
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/pluss.png',
                            width: 35 * screenWidth / 375, 
                            height: 35 * screenHeight / 375, 
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      Container(
                        width: 60 * screenWidth / 375,
                        height: 60 * screenWidth / 375, // Make the height equal to the width
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 255, 241, 245),
                        ),
                        child: const Icon(
                          Icons.fitness_center, // Replace with the desired icon from the Icons class
                          size: 34.0, // Adjust the size according to your needs
                          color: Colors.black, // Adjust the color according to your needs
                        ),
                      ),
                      SizedBox(width: 30 * screenWidth / 375,), 
                      const Text(
                        'Exercise', 
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14
                        ),
                      ),
                      SizedBox(width: 123 * screenWidth / 375,),
                      GestureDetector(
                        onTap: () {
                          createSaveHabitExercise();
                        },
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/pluss.png',
                            width: 35 * screenWidth / 375, 
                            height: 35 * screenHeight / 375, 
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      Container(
                        width: 60 * screenWidth / 375,
                        height: 60 * screenWidth / 375, // Make the height equal to the width
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 255, 241, 245),
                        ),
                        child: const Icon(
                          Icons.book_outlined, // Replace with the desired icon from the Icons class
                          size: 34.0, // Adjust the size according to your needs
                          color: Colors.black, // Adjust the color according to your needs
                        ),
                      ),
                      SizedBox(width: 30 * screenWidth / 375,), 
                      const Text(
                        'Reading', 
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14
                        ),
                      ),
                      SizedBox(width: 127 * screenWidth / 375,),
                      GestureDetector(
                        onTap: () {
                          createSaveHabitReading();
                        },
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/pluss.png',
                            width: 35 * screenWidth / 375, 
                            height: 35 * screenHeight / 375, 
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      Container(
                        width: 60 * screenWidth / 375,
                        height: 60 * screenWidth / 375, // Make the height equal to the width
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 255, 241, 245),
                        ),
                        child: const Icon(
                          Icons.water_drop_outlined, // Replace with the desired icon from the Icons class
                          size: 34.0, // Adjust the size according to your needs
                          color: Colors.black, // Adjust the color according to your needs
                        ),
                      ),
                      SizedBox(width: 30 * screenWidth / 375,), 
                      const Text(
                        'Drink Water', 
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14
                        ),
                      ),
                      SizedBox(width: 105 * screenWidth / 375,),
                      GestureDetector(
                        onTap: () {
                          createSaveHabitDrinkWater();
                        },
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/pluss.png',
                            width: 35 * screenWidth / 375, 
                            height: 35 * screenHeight / 375, 
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      Container(
                        width: 60 * screenWidth / 375,
                        height: 60 * screenWidth / 375, // Make the height equal to the width
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 255, 241, 245),
                        ),
                        child: const Icon(
                          Icons.sports_gymnastics_outlined, // Replace with the desired icon from the Icons class
                          size: 34.0, // Adjust the size according to your needs
                          color: Colors.black, // Adjust the color according to your needs
                        ),
                      ),
                      SizedBox(width: 30 * screenWidth / 375,), 
                      const Text(
                        'Strech', 
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14
                        ),
                      ),
                      SizedBox(width: 140 * screenWidth / 375,),
                      GestureDetector(
                        onTap: () {
                          createSaveHabitStrech();
                        },
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/pluss.png',
                            width: 35 * screenWidth / 375, 
                            height: 35 * screenHeight / 375, 
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      Container(
                        width: 60 * screenWidth / 375,
                        height: 60 * screenWidth / 375, // Make the height equal to the width
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 255, 241, 245),
                        ),
                        child: const Icon(
                          Icons.directions_run_outlined, // Replace with the desired icon from the Icons class
                          size: 34.0, // Adjust the size according to your needs
                          color: Colors.black, // Adjust the color according to your needs
                        ),
                      ),
                      SizedBox(width: 30 * screenWidth / 375,), 
                      const Text(
                        'Running', 
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14
                        ),
                      ),
                      SizedBox(width: 128 * screenWidth / 375,),
                      GestureDetector(
                        onTap: () {
                          createSaveHabitRunning();
                        },
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/pluss.png',
                            width: 35 * screenWidth / 375, 
                            height: 35 * screenHeight / 375, 
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      Container(
                        width: 60 * screenWidth / 375,
                        height: 60 * screenWidth / 375, // Make the height equal to the width
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 255, 241, 245),
                        ),
                        child: const Icon(
                          Icons.directions_walk, // Replace with the desired icon from the Icons class
                          size: 34.0, // Adjust the size according to your needs
                          color: Colors.black, // Adjust the color according to your needs
                        ),
                      ),
                      SizedBox(width: 30 * screenWidth / 375,), 
                      const Text(
                        'Walk', 
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14
                        ),
                      ),
                      SizedBox(width: 152 * screenWidth / 375,),
                      GestureDetector(
                        onTap: () {
                          createSaveHabitWalk();
                        },
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/pluss.png',
                            width: 35 * screenWidth / 375, 
                            height: 35 * screenHeight / 375, 
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
