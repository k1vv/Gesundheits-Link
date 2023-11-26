import 'package:flutter/material.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:myapp/UI/Habits/customhabits.dart';

class SetHabits extends StatefulWidget {
  const SetHabits({super.key});

  @override
  State<SetHabits> createState() => _SetHabitsState();
}

class _SetHabitsState extends State<SetHabits> {

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
                      ClipOval(
                        child: Container(
                          width: 60 * screenWidth / 375, 
                          height: 25 * screenHeight / 375, 
                          color: const Color.fromARGB(255, 255, 241, 245),
                          child: Image.asset(
                            'assets/images/customhabit.png',
                            width: 20,
                            height: 20,
                            ),
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
                      SizedBox(
                        width: 60 * screenWidth / 375, 
                        height: 40 * screenHeight / 375,
                        child: Image.asset('assets/images/bicep.png'),
                      ),
                      SizedBox(width: 30 * screenWidth / 375,), 
                      const Text(
                        'Exercise', 
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14
                        ),
                      ),
                      SizedBox(width: 125 * screenWidth / 375,),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/pluss.png',
                          width: 35 * screenWidth / 375, 
                          height: 35 * screenHeight / 375, 
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      SizedBox(
                        width: 60 * screenWidth / 375, 
                        height: 30 * screenHeight / 375,
                        child: Image.asset('assets/images/bicep.png'),
                      ),
                      SizedBox(width: 30 * screenWidth / 375,), 
                      const Text(
                        'Weightlifting', 
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14
                        ),
                      ),
                      SizedBox(width: 100 * screenWidth / 375,),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/pluss.png',
                          width: 35 * screenWidth / 375, 
                          height: 35 * screenHeight / 375, 
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      SizedBox(
                        width: 60 * screenWidth / 375, 
                        height: 30 * screenHeight / 375,
                        child: Image.asset('assets/images/bicep.png'),
                      ),
                      SizedBox(width: 30 * screenWidth / 375,), 
                      const Text(
                        'Cycling', 
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 14
                        ),
                      ),
                      SizedBox(width: 134 * screenWidth / 375,),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/pluss.png',
                          width: 35 * screenWidth / 375, 
                          height: 35 * screenHeight / 375, 
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      SizedBox(
                        width: 60 * screenWidth / 375, 
                        height: 30 * screenHeight / 375,
                        child: Image.asset('assets/images/bicep.png'),
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
                      ClipOval(
                        child: Image.asset(
                          'assets/images/pluss.png',
                          width: 35 * screenWidth / 375, 
                          height: 35 * screenHeight / 375, 
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      SizedBox(
                        width: 60 * screenWidth / 375, 
                        height: 30 * screenHeight / 375,
                        child: Image.asset('assets/images/bicep.png'),
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
                      ClipOval(
                        child: Image.asset(
                          'assets/images/pluss.png',
                          width: 35 * screenWidth / 375, 
                          height: 35 * screenHeight / 375, 
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 33 * screenWidth / 375,), 
                      SizedBox(
                        width: 60 * screenWidth / 375, 
                        height: 30 * screenHeight / 375,
                        child: Image.asset('assets/images/bicep.png'),
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
                      ClipOval(
                        child: Image.asset(
                          'assets/images/pluss.png',
                          width: 35 * screenWidth / 375, 
                          height: 35 * screenHeight / 375, 
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
