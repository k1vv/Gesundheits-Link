// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:myapp/UI/sethabits_page.dart';

class CustomHabits extends StatefulWidget {
  const CustomHabits({super.key});

  @override
  State<CustomHabits> createState() => _CustomHabitsState();
}

class _CustomHabitsState extends State<CustomHabits> {
  late TextEditingController _nameTextController = TextEditingController();
  late TextEditingController _descriptionTextController =
      TextEditingController();
  String name = '';
  String description = '';
  String options = 'Daily  >';
  Color buttonColor1 = const Color.fromARGB(255, 255, 241, 245);
  Color buttonColor2 = const Color.fromARGB(255, 226, 226, 226);
  Color buttonColor3 = const Color.fromARGB(255, 226, 226, 226);
  Color buttonColor4 = const Color.fromARGB(255, 226, 226, 226);
  FontWeight fontWeight1 = FontWeight.normal;
  FontWeight fontWeight2 = FontWeight.normal;
  FontWeight fontWeight3 = FontWeight.normal;
  FontWeight fontWeight4 = FontWeight.normal;
  Color textColor = Colors.black;
  bool isColorChanged = false;

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameTextController.dispose();
    _descriptionTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: SizedBox(
                  width: 23 * screenWidth / 375,
                  height: 23 * screenHeight / 375,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SetHabits()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        elevation: 0,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.white,
                        side: const BorderSide(color: Colors.grey)),
                    child: Image.asset(
                      'assets/images/arrowback.png',
                      width: 70 * screenWidth / 375,
                      height: 70 * screenHeight / 375,
                    ),
                  )),
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
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
              width: 45 * screenWidth / 375,
            ),
            Column(children: [
              SizedBox(
                height: 10 * screenHeight / 375,
              ),
              Container(
                width: 300 * screenWidth / 375,
                child: const Text(
                  'Name',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                  width: 300 * screenWidth / 375,
                  height: 35 * screenHeight / 375,
                  child: TextField(
                    controller: _nameTextController,
                    decoration: const InputDecoration(
                      hintText: 'Habit Name',
                    ),
                    style: const TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                    ),
                    onSubmitted: (String value) {
                      setState(() {
                        name = _nameTextController.text;
                      });
                    },
                  )),
              Container(
                width: 300 * screenWidth / 375,
                child: const Text(
                  'Description',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                  width: 300 * screenWidth / 375,
                  height: 40 * screenHeight / 375,
                  child: TextField(
                    controller: _descriptionTextController,
                    decoration: const InputDecoration(
                      hintText: 'Habit Description',
                    ),
                    style: const TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                    ),
                    onSubmitted: (String value) {
                      setState(() {
                        description = _descriptionTextController.text;
                      });
                    },
                  )),
              Row(
                children: [
                  Container(
                    width: 175 * screenWidth / 375,
                    child: const Text(
                      'Frequency',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                      width: 120 * screenWidth / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                // ignore: sized_box_for_whitespace
                                title: Container(
                                  width: double.infinity,
                                  child: const Text(
                                    "Choose an Option",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // ignore: sized_box_for_whitespace
                                    Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            options = 'Daily  >';
                                          });
                                          Navigator.pop(context, "Daily");
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent),
                                        child: const Text("Daily"),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            options = 'Weekly  >';
                                          });
                                          Navigator.pop(context, "Weekly");
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent),
                                        child: const Text("Weekly"),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            options = 'Monthly  >';
                                          });
                                          Navigator.pop(context, "Monthly");
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent),
                                        child: const Text("Monthly"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: Colors.transparent),
                        child: Text(
                          options,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Arial',
                            fontSize: 14,
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 10 * screenHeight / 375,
              ),
              Container(
                width: 295 * screenWidth / 375,
                child: const Text(
                  'Time Range',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5 * screenHeight / 375,
              ),
              SizedBox(
                width: 295 * screenWidth / 375,
                height: 15 * screenHeight / 375,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      child: ElevatedButton(
                          onPressed: () {
                            changeColor(1);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            backgroundColor: buttonColor1,
                          ),
                          child: Text(
                            'Anytime',
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: fontWeight1,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 124, 124, 124)),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      child: ElevatedButton(
                          onPressed: () {
                            changeColor(2);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            backgroundColor: buttonColor2,
                          ),
                          child: Text(
                            'Morning',
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: fontWeight2,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 124, 124, 124)),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      child: ElevatedButton(
                          onPressed: () {
                            changeColor(3);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            backgroundColor: buttonColor3,
                          ),
                          child: Text(
                            'Afternoon',
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: fontWeight3,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 124, 124, 124)),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      child: ElevatedButton(
                          onPressed: () {
                            changeColor(4);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            backgroundColor: buttonColor4,
                          ),
                          child: Text(
                            'Evening',
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: fontWeight4,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 124, 124, 124)),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50 * screenHeight / 375,), 
              SizedBox(
                width: 300 * screenWidth / 375,
                height: 20 * screenHeight / 375,
                child: ElevatedButton(
                  onPressed: () {
      
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 197, 216),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      fontFamily: 'Arial', 
                      fontSize: 20, 
                      color: Colors.white,
                    ), 
                    ),
                ),
              )          
            ]),
          ],
        ),
      ),
    );
  }

  void changeColor(int buttonNumber) {
    setState(() {
      buttonColor1 = const Color.fromARGB(255, 226, 226, 226);
      buttonColor2 = const Color.fromARGB(255, 226, 226, 226);
      buttonColor3 = const Color.fromARGB(255, 226, 226, 226);
      buttonColor4 = const Color.fromARGB(255, 226, 226, 226);

      fontWeight1 = FontWeight.normal;
      fontWeight2 = FontWeight.normal;
      fontWeight3 = FontWeight.normal;
      fontWeight4 = FontWeight.normal;

      switch (buttonNumber) {
        case 1:
          buttonColor1 = const Color.fromARGB(255, 255, 241, 245);
          fontWeight1 = FontWeight.bold;
          break;
        case 2:
          buttonColor2 = const Color.fromARGB(255, 255, 241, 245);
          fontWeight2 = FontWeight.bold;
          break;
        case 3:
          buttonColor3 = const Color.fromARGB(255, 255, 241, 245);
          fontWeight3 = FontWeight.bold;
          break;
        case 4:
          buttonColor4 = const Color.fromARGB(255, 255, 241, 245);
          fontWeight4 = FontWeight.bold;
          break;
        default:
          break;
      }
    });
  }
}
