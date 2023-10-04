import 'package:flutter/material.dart';
import 'package:myapp/UI/sethabits_page.dart';

class Habits extends StatelessWidget {
  const Habits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 20 * screenHeight / 375),
            SizedBox(
              width: 310 * screenWidth / 375,
              height: 60 * screenWidth / 375,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black,
                  surfaceTintColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  elevation: 8,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30 * screenWidth / 375,
                      height: 30 * screenHeight / 375,
                      child: Image.asset(
                        'assets/images/pluss.png',
                      ),
                    ),
                    SizedBox(width: 10 * screenWidth / 375),
                    const SizedBox(
                      child: Text('<<Habits>>', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
