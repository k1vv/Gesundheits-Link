import 'package:flutter/material.dart';
import 'package:myapp/UI/Habits/sethabits_page.dart';
import 'package:provider/provider.dart';
import 'package:myapp/UI/Habits/habit_provider.dart';

class Habits extends StatefulWidget {
  const Habits({Key? key}) : super(key: key);

  @override
  _HabitsState createState() => _HabitsState();
}

class _HabitsState extends State<Habits> {

  late int selectedHabitIndex; // Keep track of the selected habit index

  @override
  void initState() {
    super.initState();
    selectedHabitIndex = -1; // Set to -1 initially, indicating no habit is selected
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
            Container(
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
                        height: 60 * screenWidth / 375,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle habit button press
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
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30 * screenWidth / 375,
                                height: 30 * screenHeight / 375,
                                child: Image.asset("assets/images/customhabit.png"),
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
                                  color: habits[index].isStarred ? const Color.fromARGB(255, 255,96,121) : Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    habits[index].isStarred = !habits[index].isStarred;
                                  });
                                },
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    SizedBox(
                                      child: Icon(
                                        Icons.star,
                                        color: habits[index].isStarred ? const Color.fromARGB(255, 255,96,121) : Colors.white,
                                      ),                                    
                                    ),
                                    SizedBox(
                                      child: Icon(
                                        Icons.star_border,
                                        color: habits[index].isStarred ? const Color.fromARGB(255, 255,96,121) : Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5 * screenHeight / 375)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
