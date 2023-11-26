import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CaloriesPage extends StatefulWidget {
  final String currentStep;
  final int maxStep;
  final DateTime currentStepDate;

  const CaloriesPage(
      {Key? key,
      required this.currentStep,
      required this.currentStepDate,
      required this.maxStep})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CaloriesPageState createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {
  String currentSteps = "N/A";
  DateTime currentStepsDate = DateTime.now();
  String flexbarString = "N/A";
  int flexBar = 0;
  double maxValue = 0;
  List<int?> stepData = List.filled(24, null);
  int biggestStepValue = 0;
  double selectedValue = 0;
  String startTimeText = "00:00";
  String stepsText = "N/A";
  double barProgress = 0;
  String enteredGoal = "2500";

  Future<void> fetchDataFromFirebase(int x) async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
      final databasePath =
          'health/$userId/steps/${today.year}-${today.month}-${today.day}/$x';
      DataSnapshot dataSnapshot =
          (await FirebaseDatabase.instance.ref().child(databasePath).once())
              .snapshot;
      if (dataSnapshot.value != null) {
        int? value = int.tryParse(dataSnapshot.value.toString());
        if (value != null) {
          // Multiply the value by 0.04 before storing it in stepData
          value = (value * 0.04).ceil().toInt();
          if (mounted) {
            setState(() {
              stepData[x - 1] = value;
            });
          }
        }
      }
    }
  }

  Future<void> saveGoalToFirebase(String goal) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      String databasePath = 'health/$userId/health_goal/calorie_goal';

      // Save the goal to Firebase
      await FirebaseDatabase.instance.ref().child(databasePath).set(goal);
    }
  }

  Future<void> fetchGoalFromFirebase() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      String databasePath = 'health/$userId/health_goal/calorie_goal';

      DataSnapshot dataSnapshot =
          (await FirebaseDatabase.instance.ref().child(databasePath).once())
              .snapshot;

      if (dataSnapshot.value != null) {
        setState(() {
          enteredGoal = dataSnapshot.value.toString();
        });
      } else {
        setState(() {
          enteredGoal = '2500';
        });
      }
    }
  }

  Future<void> _showGoalDialog(BuildContext context) async {
    TextEditingController goalController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Set Your Goal'),
          content: TextField(
            controller: goalController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter your steps goal',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                enteredGoal = goalController.text;

                await saveGoalToFirebase(enteredGoal);
                barProgress = (double.parse(flexbarString) /
                        int.parse(enteredGoal) *
                        100) /
                    100;

                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
              child: const Text('Set Goal'),
            ),
          ],
        );
      },
    );
  }

  void fetchData() {
    fetchGoalFromFirebase();
    flexbarString = widget.currentStep;
    try {
      int x = int.parse(flexbarString);
      flexbarString = ((x.toDouble() * 0.04).ceil()).toString();
      barProgress = (double.parse(flexbarString) / double.parse(enteredGoal) * 100) / 100;
    } catch (e) {
      debugPrint('Error parsing flexbarString: $e');
    }
    currentSteps = widget.currentStep;
    currentStepsDate = widget.currentStepDate;
    flexBar = widget.maxStep;
    flexBar = (flexBar.toDouble() * 0.04).ceil().toInt();
    for (int x = 1; x <= 24; x++) {
      fetchDataFromFirebase(x);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    if (stepData.isNotEmpty && stepData[0] != null) {
      startTimeText = '${(stepData[0] ?? 0).toString().padLeft(2, '0')}:00';
      stepsText = (stepData[0] ?? 0).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<BarChartGroupData> barGroups = List.generate(24, (index) {
      return BarChartGroupData(
        x: index + 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: stepData[index]?.toDouble() ?? 0.0,
              colors: [const Color.fromARGB(255, 255, 96, 120)],
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(5), bottom: Radius.circular(0))),
        ],
      );
    });

    return Scaffold(
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
                              builder: (context) => const MainPage()));
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
                'Calories',
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 15 * screenHeight / 375,
          ),
          SizedBox(
            child: Text(
              startTimeText,
            ),
          ),
          SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Text(
                  stepsText,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ),
              const SizedBox(
                child: Text(
                  " kcal",
                ),
              )
            ],
          )),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 150 * screenHeight / 375,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10 * screenWidth / 375,
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      width: 364 * screenWidth / 375,
                      height: 200 * screenHeight / 375,
                      child: BarChart(
                        BarChartData(
                          titlesData: FlTitlesData(
                            leftTitles: SideTitles(showTitles: false),
                            bottomTitles: SideTitles(showTitles: false),
                            topTitles: SideTitles(showTitles: false),
                            rightTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (context, value) =>
                                  const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(71, 0, 0, 0),
                              ),
                              margin: 10,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawHorizontalLine: true,
                            drawVerticalLine: false,
                          ),
                          borderData: FlBorderData(
                              show: true,
                              border: const Border(
                                  bottom: BorderSide(color: Colors.grey),
                                  left: BorderSide(color: Colors.grey))),
                          minY: 0,
                          maxY: flexBar == 0 ? 5.0 : flexBar * 1.2,
                          barGroups: barGroups,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0 * screenWidth / 375,
                child: SizedBox(
                  width: 360 * screenWidth / 375,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.transparent,
                      inactiveTrackColor: Colors.transparent,
                      thumbColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      trackHeight: 250 *
                          screenHeight /
                          375, // Adjust the height of the slider
                      thumbShape: SliderComponentShape
                          .noThumb, // Adjust the size of the thumb
                    ),
                    child: Slider(
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                          if (stepData.isNotEmpty) {
                            final index = selectedValue.toInt() - 1;
                            if (index >= 0 &&
                                index < stepData.length &&
                                stepData[index] != null) {
                              final selectedHour =
                                  (index + 1).toString().padLeft(2, '0');
                              startTimeText = '$selectedHour:00';
                              stepsText = (stepData[index] ?? 0).toString();
                            }
                          }
                        });
                      },
                      min: 0,
                      max: 24,
                      divisions: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10 * screenHeight / 375),
          Container(
            padding: const EdgeInsets.all(10),
            width: 350 * screenWidth / 375,
            height: 70 * screenHeight / 375,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  child: Text(
                    flexbarString,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ),
                const SizedBox(
                  child: Text("Todays Total Calories"),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearPercentIndicator(
                    lineHeight: 25,
                    percent: barProgress,
                    progressColor: Colors.pink,
                    backgroundColor: Colors.pink.shade100,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 5 * screenWidth / 375),
                    const Text(
                      "0",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 182 * screenWidth / 375,
                    ),
                    SizedBox(
                      width: 134 * screenWidth / 375,
                      height: 15 * screenHeight / 375,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor:
                                  const Color.fromARGB(33, 158, 158, 158),
                              backgroundColor:
                                  const Color.fromARGB(33, 158, 158, 158),
                              foregroundColor:
                                  const Color.fromARGB(33, 158, 158, 158),
                              surfaceTintColor:
                                  const Color.fromARGB(33, 158, 158, 158)),
                          onPressed: () {
                            _showGoalDialog(context);
                          },
                          child: Text(
                            "Target: $enteredGoal",
                            style: const TextStyle(color: Colors.grey),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
