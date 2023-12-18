// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StepsPage extends StatefulWidget {

  const StepsPage({Key? key,}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {

  List<double?> stepsData = List.generate(24, (index) => 0.0);
  List<double?> stepsWeeklyData = List.generate(7, (index) => 0.0);

  List<double?> stepsMonthlyData = List.generate(
    DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
    (index) => 0.0,
  );

  List<BarChartGroupData> barGroups = [];

  String selectedOption = "Daily";

  String stepsText = "N/A";
  String enteredGoal = "2500";
  String startTimeText = "00:00";
  String totalstepsBurn = "N/A";

  double barProgress = 0;
  double selectedValue = 0;
  double biggeststeps = 0;

  String stepsLatest = "N/A";
  String latestTime = "N/A";

  bool isLoading = false;

  // Fetch Daily steps Data //
  
  Future<void> fetchTotalstepsData() async {
    final today = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;

    String userId = "";
    double stepsTotal = 0;
  
    if (user != null) {
      userId = user.uid;
      for (int i = 1; i <= 23 ; i++) {
        String databasePath = 'health/$userId/steps/${today.year}-${today.month}-${today.day}/$i';
        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if(dataSnapshot.value != null) {
          double steps = double.parse(dataSnapshot.value.toString());
          stepsTotal += steps;
        }     
      }
      if(mounted) {
        setState(() {
          totalstepsBurn = stepsTotal.toInt().toString();
        });
      }   
      debugPrint("Total steps Burn: $stepsTotal");  
    }
  }

  Future<void> fetchstepsDailyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      for (int i = 1; i <= 23; i++) {
        final databasePath = 'health/$userId/steps/${today.year}-${today.month}-${today.day}/$i';

        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
        if (dataSnapshot.value != null) {
          double? value = double.parse(dataSnapshot.value.toString());
          if (mounted) {
            setState(() {
              stepsData[i] = value;
            });
          }       
        }
      }
      if(mounted) {
        setState(() {
          barGroups = List.generate(24, (index) {
           return BarChartGroupData(
             x: index,
             barsSpace: 4,
             barRods: [
               BarChartRodData(
                 y: index < stepsData.length ? (stepsData[index]?.toDouble() ?? 0.0) : 0.0,
                 colors: [const Color.fromARGB(255, 255, 96, 120)],
                 borderRadius: const BorderRadius.vertical(
                   top: Radius.circular(5), bottom: Radius.circular(0)
                 )
               ),
             ],
           );
          });
        });
      }
    }
  }

  Future<void> getBiggeststeps() async {
    final today = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;

    String userId = "";

    if (user != null) {
      userId = user.uid;

      double maxsteps = 0;

      for (int i = 1; i <= 23; i++) {
        String databasePath = 'health/$userId/steps/${today.year}-${today.month}-${today.day}/$i';
        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          double steps = double.parse(dataSnapshot.value.toString());

          if (steps > maxsteps) {
            maxsteps = steps;
          }
        }
      }
      
      if(mounted) {
        setState(() {
          biggeststeps = maxsteps;
        });
      }
      debugPrint('Maximum steps: $maxsteps');
    }
  }

  Future<void> getLateststeps() async {
    final today = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;

    String userId = "";

    if (user != null) {
      userId = user.uid;

      for (int i = 23; i >= 0; i--) {
        String databasePath = 'health/$userId/steps/${today.year}-${today.month}-${today.day}/$i';
        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          double steps = double.parse(dataSnapshot.value.toString());
          if(steps > 0) {
            if(mounted) {
              setState(() {
                stepsLatest = steps.toInt().toString();
                latestTime = i.toString();

                startTimeText = '${latestTime.padLeft(2, '0')}:00';
                stepsText = stepsLatest;
              });
            }
            break;
          }
        }
      }

      debugPrint('Latest steps: $stepsLatest');
    }
  }

  // Fetch Daily steps Data //

  // Fetch Weekly steps Data //

  Future<void> fetchstepsWeeklyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      double totalsteps = 0;
      DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));

      for (int i = 0; i < 7; i++) {
        double maxsteps = 0; 
        DateTime currentDate = startOfWeek.add(Duration(days: i));

        String databasePath = 'health/$userId/steps/${currentDate.year}-${currentDate.month}-${currentDate.day}/';

        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          if(dataSnapshot.value is List<Object?>) {
            List<Object?> data = dataSnapshot.value as List<Object?>;
            int sum = data.whereType<int>().fold<int>(0, (int acc, int value) => acc + value);
    
            totalsteps += sum.toDouble();
            maxsteps = sum.toDouble();

          } else if(dataSnapshot.value is Map<Object?, Object?>?) {
            Map<Object?, Object?>? data = dataSnapshot.value as Map<Object?, Object?>?;
            int sum = data?.values.whereType<int>().fold<int>(0, (int acc, int value) => acc + value) ?? 0;

            totalsteps += sum.toDouble();
            maxsteps = sum.toDouble();
          }
        }
        if(mounted) {
          setState(() {
            stepsWeeklyData[i] = maxsteps;
          });
        }
        debugPrint("maxsteps: $maxsteps %$i");
      }

      findBiggestWeeklysteps();
      if(mounted) {
        setState(() {
          totalstepsBurn = totalsteps.toInt().toString();
          barGroups = List.generate(7, (index) {
            return BarChartGroupData(
              x: index,
              barsSpace: 4,
              barRods: [
                BarChartRodData(
                  y: index < stepsWeeklyData.length
                      ? (stepsWeeklyData[index]?.toDouble() ?? 0.0)
                      : 0.0,
                  colors: [const Color.fromARGB(255, 255, 96, 120)],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(5),
                    bottom: Radius.circular(0),
                  ),
                ),
              ],
            );
          });
        });
      }
    }
  }

  Future<void> findBiggestWeeklysteps() async {
    double? maxsteps = 0;
    int index = 0;

    for (int i = 0; i < stepsWeeklyData.length; i++) {
      double? steps = stepsWeeklyData[i];

      if (steps! > maxsteps!) {
        maxsteps = steps;
        index = i;
      }
    }

    if (mounted) {

        final today = DateTime.now();
        final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
        final selectedDate = startOfWeek.add(Duration(days: index));

        final formatter = DateFormat('EEE, MMM dd');
        startTimeText = formatter.format(selectedDate);

      setState(() {
        biggeststeps = double.parse(maxsteps.toString());
        stepsText = biggeststeps.toInt().toString();
      });
    }
  }

  // Fetch Weekly steps Data //

  // Fetch Monthly steps Data //

  Future<void> fetchstepsMonthlyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      double totalsteps = 0;
      DateTime startOfMonth = DateTime(today.year, today.month, 1);

      for (int i = 0; i < DateTime(today.year, today.month + 1, 0).day; i++) {
        double maxsteps = 0;
        DateTime currentDate = startOfMonth.add(Duration(days: i));

        String databasePath = 'health/$userId/steps/${currentDate.year}-${currentDate.month}-${currentDate.day}/';

        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          Map<Object?, Object?>? data = dataSnapshot.value as Map<Object?, Object?>?;
          int sum = data?.values.whereType<int>().fold<int>(0, (int acc, int value) => acc + value) ?? 0;

          totalsteps += sum.toDouble();
          maxsteps = sum.toDouble();
        }
        if (mounted) {
          setState(() {
            stepsMonthlyData[i] = maxsteps;
          });
        }
        debugPrint("maxsteps monthly: $maxsteps %$i");
      }
      findBiggestMonthlysteps();
      if (mounted) {
        setState(() {
          totalstepsBurn = totalsteps.toInt().toString();
          barGroups = List.generate(
            DateTime(today.year, today.month + 1, 0).day,
            (index) {
              return BarChartGroupData(
                x: index,
                barsSpace: 4,
                barRods: [
                  BarChartRodData(
                    y: index < stepsMonthlyData.length
                        ? (stepsMonthlyData[index]?.toDouble() ?? 0.0)
                        : 0.0,
                    colors: [const Color.fromARGB(255, 255, 96, 120)],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(5),
                      bottom: Radius.circular(0),
                    ),
                  ),
                ],
              );
            },
          );
        });
      }
    }
  }

  Future<void> findBiggestMonthlysteps() async {
    double? maxsteps = 0;
    int index = 0;

    for (int i = 0; i < stepsMonthlyData.length; i++) {
      double? steps = stepsMonthlyData[i];

      if (steps! > maxsteps!) {
        maxsteps = steps;
        index = i;
      }
    }

    if (mounted) {

        final today = DateTime.now();
        final selectedDate = DateTime(today.year, today.month, index + 1);

        final formatter = DateFormat('EEE, MMM dd');
        startTimeText = formatter.format(selectedDate);

      setState(() {
        biggeststeps = double.parse(maxsteps.toString());
        stepsText = biggeststeps.toInt().toString();
      });
    }
  }

  // Fetch Monthly steps Data //

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
      String databasePath = 'health/$userId/health_goal/step_goal';

      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
      if (dataSnapshot.value != null) {
        if(mounted) {
        setState(() {
          enteredGoal = dataSnapshot.value.toString();
        });
        }
      } else {
        if(mounted) {
          setState(() {
            enteredGoal = '2500';
          });
        }
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
                barProgress = (double.parse(totalstepsBurn) / int.parse(enteredGoal) * 100) / 100;

                Navigator.of(context).pop();
              },
              child: const Text('Set Goal'),
            ),
          ],
        );
      },
    );
  }

  Future<void> getTodaysData () async {

    await getLateststeps();
    await getBiggeststeps();
    await fetchGoalFromFirebase();
    await fetchstepsDailyData();
    await fetchTotalstepsData();

    if(mounted) {
      setState(() {
        barProgress = (double.parse(totalstepsBurn) / int.parse(enteredGoal) * 100) / 100;
      });
    }
  }

  void showLoadingDialog(BuildContext context) {
    if (isLoading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            // ignore: sized_box_for_whitespace
            content: Container(
              width: 100,
              height: 100,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();

    getTodaysData();
    
    int latestIndex = stepsData.lastIndexWhere((steps) => steps != null);

    if (latestIndex != -1) {
      startTimeText = '${(stepsData[latestIndex] ?? 0).toString().padLeft(2, '0')}:00';
      stepsText = (stepsData[latestIndex] ?? 0).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
          SizedBox(height: 15 * screenWidth / 375,),
          Row(
            children: [
              SizedBox(width: 75 * screenWidth / 375,),

              buildOption("Daily"),
              SizedBox(width: 3 * screenWidth / 375,),
              buildOption("Weekly"),
              SizedBox(width: 3 * screenWidth / 375,),
              buildOption("Monthly"),

              SizedBox(width: 75 * screenWidth / 375,),
            ],
          ),
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
                  " steps",
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
                          maxY: biggeststeps == 0 ? 5.0 : biggeststeps * 1.2,
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
                      trackHeight: 250 * screenHeight / 375,
                      thumbShape: SliderComponentShape.noThumb,
                    ),
                    child: Slider(
                      value: selectedValue.clamp(
                        selectedOption == 'Weekly' ? 0.0 : 0.0,
                        selectedOption == 'Weekly' ? 6.0 : (selectedOption == 'Monthly' ? stepsMonthlyData.length.toDouble() - 1.0 : 24.0),
                      ),
                      onChanged: (value) {
                        if(mounted) {
                          setState(() {
                            selectedValue = value;

                            if (selectedOption == 'Weekly') {
                              final today = DateTime.now();
                              final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
                              final selectedDate = startOfWeek.add(Duration(days: value.toInt()));

                              final formatter = DateFormat('EEE, MMM dd');
                              startTimeText = formatter.format(selectedDate);
                              stepsText = (stepsWeeklyData[value.toInt() % 7] ?? 0).toInt().toString();
                            } else if (selectedOption == 'Daily') {
                              if (stepsData.isNotEmpty) {
                                final index = value.toInt();
                                if (index >= 0 &&
                                    index < stepsData.length &&
                                    stepsData[index] != null) {
                                  final selectedHour = (index).toString().padLeft(2, '0');
                                  startTimeText = '$selectedHour:00';
                                  stepsText = (stepsData[index] ?? 0).toInt().toString();
                                }
                              }
                            } else if (selectedOption == 'Monthly') {
                              if (stepsMonthlyData.isNotEmpty) {
                                final index = value.toInt();
                                if (index >= 0 &&
                                    index < stepsMonthlyData.length &&
                                    stepsMonthlyData[index] != null) {

                                  final today = DateTime.now();
                                  final selectedDate = DateTime(today.year, today.month, index + 1);


                                  final formatter = DateFormat('EEE, MMM dd');
                                  startTimeText = formatter.format(selectedDate);
                                  stepsText = (stepsMonthlyData[index] ?? 0).toInt().toString();
                                }
                              }
                            }
                          });
                        }
                      },
                      min: selectedOption == 'Weekly' ? 0 : 0,
                      max: selectedOption == 'Weekly' ? 6 : (selectedOption == 'Monthly' ? stepsMonthlyData.length.toDouble() - 1 : 24),
                      divisions: selectedOption == 'Weekly' ? 6 : (selectedOption == 'Monthly' ? stepsMonthlyData.length - 1 : 24),
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  child: Text(
                    totalstepsBurn,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ),
                SizedBox(
                  child: Text(
                    selectedOption == 'Daily'
                        ? "Today's Total ActiveSteps "
                        : selectedOption == 'Weekly'
                            ? "This Week's Total Steps "
                            : "This Month's Total Steps ",
                  ),
                ),
                SizedBox(height: 10 * screenHeight / 375,),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 241, 241), 
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Today's Progress",
                        style: TextStyle(
                          fontFamily: 'Arial', 
                          fontWeight: FontWeight.bold, 
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 145, 146, 146), 
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                      SizedBox(height: 10 * screenHeight / 375,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearPercentIndicator(
                          lineHeight: 25,
                          percent: barProgress,
                          progressColor: Colors.pink,
                          backgroundColor: Colors.pink.shade100,
                        ),
                      ),
                      SizedBox(height: 2 * screenHeight / 375,),
                      Row(
                        children: [
                          SizedBox(width: 5 * screenWidth / 375),
                          const Text(
                            "0",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 145 * screenWidth / 375,
                          ),
                          SizedBox(
                            width: 145 * screenWidth / 375,
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
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
  Widget buildOption(String option) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          if(mounted) {
            setState(() {
              selectedOption = option;
            });
          }
          if(selectedOption == "Daily") {
            if(mounted) {
              setState(() {
                isLoading = true;     
              });
            }
            showLoadingDialog(context);

              await getLateststeps();
              await getBiggeststeps();
              await fetchstepsDailyData();
              await fetchTotalstepsData();

            if(mounted) {
              setState(() {
                isLoading = false;     
              });
            }
            showLoadingDialog(context);

          } else if (selectedOption == "Weekly") {
            if(mounted) {
              setState(() {
                isLoading = true;     
              });
            }
            showLoadingDialog(context);

            await fetchstepsWeeklyData();

            if(mounted) {
              setState(() {
                isLoading = false;     
              });
            }
            showLoadingDialog(context);
          }

          else if (selectedOption == "Monthly") {
            if(mounted) {
              setState(() {
                isLoading = true;     
              });
            }
            showLoadingDialog(context);

            await fetchstepsMonthlyData();

            if(mounted) {
              setState(() {
                isLoading = false;     
              });
            }
            showLoadingDialog(context);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          decoration: BoxDecoration(
            color: option == selectedOption ? const Color.fromARGB(255, 255, 96, 120) : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              option,
              style: TextStyle(
                color: option == selectedOption ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold, 
                fontSize: 16
              ),
            ),
          ),
        ),
      ),
    );
  } 
}