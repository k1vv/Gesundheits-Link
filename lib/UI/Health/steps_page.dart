import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StepsPage extends StatefulWidget {
  const StepsPage(
      {Key? key,
      required this.currentStep,
      required this.currentStepDate,
      required this.maxStep})
      : super(key: key);

  final String currentStep;
  final DateTime currentStepDate;
  final int maxStep;

  @override
  // ignore: library_private_types_in_public_api
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  double barProgress = 0;
  int biggestStepValue = 0;
  String currentSteps = "N/A";
  DateTime currentStepsDate = DateTime.now();
  String enteredGoal = "10000";
  int flexBar = 0;
  String flexbarString = "N/A";
  double maxValue = 0;
  String selectedDataRange = "Day";
  double selectedValue = 0;
  String startTimeText = "00:00";
  List<int?> stepData = List.filled(24, null);
  String stepsText = "N/A";
  int y = DateTime.now().hour;

  @override
  void initState() {
    super.initState();
    fetchSumData();
    Future<void> fetchDataAndGoal() async {
      await fetchGoalFromFirebase();
      fetchData();
      if (stepData.isNotEmpty && stepData[0] != null) {
        startTimeText = '${(stepData[0] ?? 0).toString().padLeft(2, '0')}:00';
        stepsText = (stepData[0] ?? 0).toString();
      }
    }
   fetchDataAndGoal();
  }

  void fetchData() {
    flexbarString = widget.currentStep;
    if (isNumeric(flexbarString)) {
      currentSteps = widget.currentStep;
      currentStepsDate = widget.currentStepDate;
      flexBar = widget.maxStep;

      int goal = int.parse(enteredGoal);
      fetchCurrentData(y);

      if (goal != 0) {
        barProgress = (double.parse(flexbarString) / goal) * 100 / 100;
      } else {
        debugPrint("Error: enteredGoal is zero");
      }

      for (int x = 1; x <= 24; x++) {
        fetchDataFromFirebase(x);
      }
    } else {
      debugPrint("Error: flexbarString is not a valid numeric string");
    }
  }
  
  bool isNumeric(String s) {
    // ignore: unnecessary_null_comparison
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
  
  Future<void> fetchCurrentData(int y) async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      userId = user.uid;
      String databasePath = 'health/$userId/steps/${today.year}-${today.month}-${today.day}/$y';
      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
      if (dataSnapshot.value != null) {
        setState(() {
          y = dataSnapshot.value as int;
          flexbarString = y.toString();
        });
      debugPrint(flexbarString);
      }
    }
  }

  Future<void> fetchSumData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
  
    if (user != null) {
      userId = user.uid;
      String databasePath = 'health/$userId/steps/${today.year}-${today.month}-${today.day}/';
      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
      if (dataSnapshot.value is Map) {
        Map<String, dynamic> dataMap = Map<String, dynamic>.from(dataSnapshot.value as Map<dynamic, dynamic>);
        int totalSteps = 0;
        dataMap.forEach((timestamp, steps) {
          if (steps is num) {
            totalSteps += steps.toInt();
          }
        });
        debugPrint('Total steps for today: $totalSteps');
      }
    }
  }

  Future<void> fetchDataFromFirebase(int x) async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
      String databasePath = 'health/$userId';
      
      // Update the databasePath based on the selected data range.
      if (selectedDataRange == "Day") {
        databasePath += '/steps/${today.year}-${today.month}-${today.day}/$x';
      } else if (selectedDataRange == "Week") {
        DateTime currentDate = today;
        DateTime monday = currentDate.subtract(Duration(days: currentDate.weekday - 1)); // Get the previous Monday

        Map<String, int> dailyStepSum = {}; // A map to store the daily step sum

        for (int i = 0; i < 7; i++) {
          DateTime nextDay = monday.add(Duration(days: i));
          String formattedDate = "${nextDay.year}-${nextDay.month}-${nextDay.day}";
          String databasePath = 'health/$userId/steps/$formattedDate';

          DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

          int sum = 0;
          if (dataSnapshot.value != null) {
              // Loop through the hours and calculate the sum
            for (int hour = 0; hour < 24; hour++) {
              Object? value = dataSnapshot.child(hour.toString()).value;
              if (value != null) {
                sum += (value as int);
              }
            }
          }
          dailyStepSum[formattedDate] = sum;
          debugPrint("this is $sum");
        }
        // Now, dailyStepSum contains the daily step sum for each day of the week (Monday to Sunday)
        // You can use this map as needed.
      } else if (selectedDataRange == "Month") {
        // Logic to fetch data for the current month.
        // You may need to calculate the start and end dates for the month.
        // Update databasePath accordingly.
      }

      DataSnapshot dataSnapshot =
          (await FirebaseDatabase.instance.ref().child(databasePath).once())
              .snapshot;
      if (dataSnapshot.value != null) {
        int? value = int.tryParse(dataSnapshot.value.toString());
        setState(() {
          stepData[x - 1] = value;
        });
      }
    }
  }

  Future<void> saveGoalToFirebase(String goal) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      String databasePath = 'health/$userId/health_goal/step_goal';

      // Save the goal to Firebase
      await FirebaseDatabase.instance.ref().child(databasePath).set(goal);
    }
  }

  Future<void> fetchGoalFromFirebase() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      String databasePath = 'health/$userId/health_goal/step_goal';

      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

      if (dataSnapshot.value != null) {
        setState(() {
          enteredGoal = dataSnapshot.value.toString();
        });
      } else {
        // Set enteredGoal to 10000 if there is no goal in the database
        setState(() {
          enteredGoal = '10000';
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
                barProgress = (double.parse(flexbarString) / int.parse(enteredGoal) * 100) / 100;
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
              top: Radius.circular(5),
              bottom: Radius.circular(0),
            ),
          ),
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
                'Steps',
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
          SizedBox(height: 10 * screenHeight / 375,),

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
                      fontWeight: FontWeight.bold, 
                      fontSize: 21
                    ),
                  ),
                ),
                const SizedBox(
                  child: Text(
                    " steps",
                  ),
                )
              ],
            )
          ),
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
                              getTextStyles: (context, value) => const TextStyle(
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
                      trackHeight: 250 * screenHeight / 375, // Adjust the height of the slider
                      thumbShape: SliderComponentShape.noThumb, // Adjust the size of the thumb
                    ),
                    child: Slider(
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                          if (stepData.isNotEmpty) {
                            final index = selectedValue.toInt() - 1;
                            if (index >= 0 && index < stepData.length && stepData[index] != null) {
                              final selectedHour = (index + 1).toString().padLeft(2, '0');
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
                  child: Text("Todays Total Steps"),
                ),
                SizedBox(height: 5 * screenHeight / 375,), 
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: LinearPercentIndicator(
                    lineHeight: 30,
                    percent: barProgress, 
                    progressColor: Colors.pink,
                    backgroundColor: Colors.pink.shade100,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 5 * screenWidth / 375),
                    const Text("0", style: TextStyle(color: Colors.grey),),
                    SizedBox(width: 182 * screenWidth / 375,),
                    SizedBox(
                      width: 134 * screenWidth / 375,
                      height: 15 * screenHeight / 375,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: const Color.fromARGB(33, 158, 158, 158), 
                          backgroundColor: const Color.fromARGB(33, 158, 158, 158),  
                          foregroundColor: const Color.fromARGB(33, 158, 158, 158), 
                          surfaceTintColor: const Color.fromARGB(33, 158, 158, 158)
                        ),
                        onPressed: () {
                          _showGoalDialog(context);
                        },  
                        child: Text(
                          "Target: $enteredGoal",
                          style: const TextStyle(
                            color: Colors.grey
                          ),
                        )
                      ),
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