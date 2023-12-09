import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CaloriesPage extends StatefulWidget {

  const CaloriesPage({Key? key,}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CaloriesPageState createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {


  List<double?> caloriesData = List.generate(24, (index) => 0.0);
  List<double?> caloriesWeeklyData = List.generate(7, (index) => 0.0);

  List<double?> caloriesMonthlyData = List.generate(
    DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
    (index) => 0.0,
  );

  List<BarChartGroupData> barGroups = [];

  String selectedOption = "Daily";

  String caloriesText = "N/A";
  String enteredGoal = "2500";
  String startTimeText = "00:00";
  String totalCaloriesBurn = "N/A";

  double barProgress = 0;
  double selectedValue = 0;
  double biggestCalories = 0;

  String caloriesLatest = "N/A";
  String latestTime = "N/A";

  bool isLoading = false;
  
  Future<void> fetchTotalCaloriesData() async {
    final today = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;

    String userId = "";
    double caloriesTotal = 0;
  
    if (user != null) {
      userId = user.uid;
      for (int i = 1; i <= 23 ; i++) {
        String databasePath = 'health/$userId/calories/${today.year}-${today.month}-${today.day}/$i';
        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if(dataSnapshot.value != null) {
          double calories = double.parse(dataSnapshot.value.toString());
          caloriesTotal += calories;
        }     
      }
      if(mounted) {
        setState(() {
          totalCaloriesBurn = caloriesTotal.toString();
        });
      }   
      debugPrint("Total Calories Burn: $caloriesTotal");  
    }
  }

  Future<void> fetchCaloriesDailyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      for (int i = 1; i <= 23; i++) {
        final databasePath = 'health/$userId/calories/${today.year}-${today.month}-${today.day}/$i';

        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
        if (dataSnapshot.value != null) {
          double? value = double.parse(dataSnapshot.value.toString());
          if (mounted) {
            setState(() {
              caloriesData[i] = value;
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
                 y: index < caloriesData.length ? (caloriesData[index]?.toDouble() ?? 0.0) : 0.0,
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

  Future<void> getBiggestCalories() async {
    final today = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;

    String userId = "";

    if (user != null) {
      userId = user.uid;

      double maxCalories = 0;

      for (int i = 1; i <= 23; i++) {
        String databasePath = 'health/$userId/calories/${today.year}-${today.month}-${today.day}/$i';
        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          double calories = double.parse(dataSnapshot.value.toString());

          if (calories > maxCalories) {
            maxCalories = calories;
          }
        }
      }
      
      if(mounted) {
        setState(() {
          biggestCalories = maxCalories;
        });
      }
      debugPrint('Maximum calories: $maxCalories');
    }
  }

  Future<void> getLatestcalories() async {
    final today = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;

    String userId = "";

    if (user != null) {
      userId = user.uid;

      for (int i = 23; i >= 0; i--) {
        String databasePath = 'health/$userId/calories/${today.year}-${today.month}-${today.day}/$i';
        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          double calories = double.parse(dataSnapshot.value.toString());
          if(calories > 0) {
            if(mounted) {
              setState(() {
                caloriesLatest = calories.toString();
                latestTime = i.toString();

                startTimeText = '${latestTime.padLeft(2, '0')}:00';
                caloriesText = caloriesLatest;
              });
            }
            // Break the loop after finding the first non-zero calories
            break;
          }
        }
      }

      debugPrint('Latest calories: $caloriesLatest');
    }
  }

  // Fetch Daily Calories Data //

  // Fetch Weekly Calories Data //

  Future<void> fetchCaloriesWeeklyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      double totalCalories = 0;
      DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));

      for (int i = 0; i < 7; i++) {
        double maxCalories = 0; 
        DateTime currentDate = startOfWeek.add(Duration(days: i));

        String databasePath = 'health/$userId/calories/${currentDate.year}-${currentDate.month}-${currentDate.day}/';

        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          Map<Object?, Object?>? data = dataSnapshot.value as Map<Object?, Object?>?;
          int sum = data?.values.whereType<int>().fold<int>(0, (int acc, int value) => acc + value) ?? 0;

          totalCalories += sum.toDouble();
          maxCalories = sum.toDouble();
        }
        if(mounted) {
          setState(() {
            caloriesWeeklyData[i] = maxCalories;
          });
        }
        debugPrint("maxCalories: $maxCalories %$i");
      }

      findBiggestWeeklyCalories();
      if(mounted) {
        setState(() {
          totalCaloriesBurn = totalCalories.toString();
          barGroups = List.generate(7, (index) {
            return BarChartGroupData(
              x: index,
              barsSpace: 4,
              barRods: [
                BarChartRodData(
                  y: index < caloriesWeeklyData.length
                      ? (caloriesWeeklyData[index]?.toDouble() ?? 0.0)
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

  Future<void> findBiggestWeeklyCalories() async {
    double? maxCalories = 0;
    int index = 0;

    for (int i = 0; i < caloriesWeeklyData.length; i++) {
      double? calories = caloriesWeeklyData[i];

      if (calories! > maxCalories!) {
        maxCalories = calories;
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
        biggestCalories = double.parse(maxCalories.toString());
        caloriesText = biggestCalories.toString();
      });
    }
  }

  // Fetch Weekly Calories Data //

  // Fetch Monthly Calories Data //

  Future<void> fetchCaloriesMonthlyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      double totalCalories = 0;
      DateTime startOfMonth = DateTime(today.year, today.month, 1);

      for (int i = 0; i < DateTime(today.year, today.month + 1, 0).day; i++) {
        double maxCalories = 0;
        DateTime currentDate = startOfMonth.add(Duration(days: i));

        String databasePath = 'health/$userId/calories/${currentDate.year}-${currentDate.month}-${currentDate.day}/';

        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          Map<Object?, Object?>? data = dataSnapshot.value as Map<Object?, Object?>?;
          int sum = data?.values.whereType<int>().fold<int>(0, (int acc, int value) => acc + value) ?? 0;

          totalCalories += sum.toDouble();
          maxCalories = sum.toDouble();
        }
        if (mounted) {
          setState(() {
            caloriesMonthlyData[i] = maxCalories;
          });
        }
        debugPrint("maxCalories monthly: $maxCalories %$i");
      }
      findBiggestMonthlyCalories();
      if (mounted) {
        setState(() {
          totalCaloriesBurn = totalCalories.toString();
          barGroups = List.generate(
            DateTime(today.year, today.month + 1, 0).day,
            (index) {
              return BarChartGroupData(
                x: index,
                barsSpace: 4,
                barRods: [
                  BarChartRodData(
                    y: index < caloriesMonthlyData.length
                        ? (caloriesMonthlyData[index]?.toDouble() ?? 0.0)
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

  Future<void> findBiggestMonthlyCalories() async {
    double? maxCalories = 0;
    int index = 0;

    for (int i = 0; i < caloriesMonthlyData.length; i++) {
      double? calories = caloriesMonthlyData[i];

      if (calories! > maxCalories!) {
        maxCalories = calories;
        index = i;
      }
    }

    if (mounted) {

        final today = DateTime.now();
        final selectedDate = DateTime(today.year, today.month, index + 1);

        final formatter = DateFormat('EEE, MMM dd');
        startTimeText = formatter.format(selectedDate);

      setState(() {
        biggestCalories = double.parse(maxCalories.toString());
        caloriesText = biggestCalories.toString();
      });
    }
  }


  // Fetch Monthly Calories Data //

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

      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
      if (dataSnapshot.value != null) {
        if(mounted) {
          setState(() {
            enteredGoal = dataSnapshot.value.toString();
          });
        }
      } else {
        if(mounted){
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
                barProgress = (double.parse(totalCaloriesBurn) / int.parse(enteredGoal) * 100) / 100;

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

  Future<void> getTodaysData () async {

    await getLatestcalories();
    await getBiggestCalories();
    await fetchGoalFromFirebase();
    await fetchCaloriesDailyData();
    await fetchTotalCaloriesData();

    if(mounted) {
      setState(() {
        barProgress = (double.parse(totalCaloriesBurn) / int.parse(enteredGoal) * 100) / 100;
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
    
    int latestIndex = caloriesData.lastIndexWhere((calories) => calories != null);

    if (latestIndex != -1) {
      startTimeText = '${(caloriesData[latestIndex] ?? 0).toString().padLeft(2, '0')}:00';
      caloriesText = (caloriesData[latestIndex] ?? 0).toString();
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
                  caloriesText,
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
                          maxY: biggestCalories == 0 ? 5.0 : biggestCalories * 1.2,
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
                        selectedOption == 'Weekly' ? 6.0 : (selectedOption == 'Monthly' ? caloriesMonthlyData.length.toDouble() - 1.0 : 24.0),
                      ),
                      onChanged: (value) {
                        try{
                          if(mounted) {
                            setState(() {
                              selectedValue = value;

                              if (selectedOption == 'Weekly') {
                                final today = DateTime.now();
                                final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
                                final selectedDate = startOfWeek.add(Duration(days: value.toInt()));

                                final formatter = DateFormat('EEE, MMM dd');
                                startTimeText = formatter.format(selectedDate);
                                caloriesText = (caloriesWeeklyData[value.toInt() % 7] ?? 0).toString();
                              } else if (selectedOption == 'Daily') {
                                if (caloriesData.isNotEmpty) {
                                  final index = value.toInt();
                                  if (index >= 0 &&
                                      index < caloriesData.length &&
                                      caloriesData[index] != null) {
                                    final selectedHour = (index).toString().padLeft(2, '0');
                                    startTimeText = '$selectedHour:00';
                                    caloriesText = (caloriesData[index] ?? 0).toString();
                                  }
                                }
                              } else if (selectedOption == 'Monthly') {
                                if (caloriesMonthlyData.isNotEmpty) {
                                  final index = value.toInt();
                                  if (index >= 0 &&
                                      index < caloriesMonthlyData.length &&
                                      caloriesMonthlyData[index] != null) {

                                    final today = DateTime.now();
                                    final selectedDate = DateTime(today.year, today.month, index + 1);


                                    final formatter = DateFormat('EEE, MMM dd');
                                    startTimeText = formatter.format(selectedDate);
                                    caloriesText = (caloriesMonthlyData[index] ?? 0).toString();
                                  }
                                }
                              }
                            });
                          }
                        } catch (error) {
                          debugPrint("Error Occured: $error");
                        }
                      },
                      min: selectedOption == 'Weekly' ? 0 : 0,
                      max: selectedOption == 'Weekly' ? 6 : (selectedOption == 'Monthly' ? caloriesMonthlyData.length.toDouble() - 1 : 24),
                      divisions: selectedOption == 'Weekly' ? 6 : (selectedOption == 'Monthly' ? caloriesMonthlyData.length - 1 : 24),
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
                    totalCaloriesBurn,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ),
                SizedBox(
                  child: Text(
                    selectedOption == 'Daily'
                        ? "Today's Total Active Calories Burn"
                        : selectedOption == 'Weekly'
                            ? "This Week's Total Active Calories Burn"
                            : "This Month's Total Active Calories Burn",
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
                            width: 164 * screenWidth / 375,
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

              await getLatestcalories();
              await getBiggestCalories();
              await fetchCaloriesDailyData();
              await fetchTotalCaloriesData();

            if(mounted) {
              setState(() {
                isLoading = false;     
              });
            }
            // ignore: use_build_context_synchronously
            showLoadingDialog(context);

          } else if (selectedOption == "Weekly") {
            if(mounted) {
              setState(() {
                isLoading = true;     
              });
            }
            showLoadingDialog(context);

            await fetchCaloriesWeeklyData();

            if(mounted) {
              setState(() {
                isLoading = false;     
              });
            }
            // ignore: use_build_context_synchronously
            showLoadingDialog(context);
          }

          else if (selectedOption == "Monthly") {
            if(mounted) {
              setState(() {
                isLoading = true;     
              });
            }
            showLoadingDialog(context);

            await fetchCaloriesMonthlyData();

            if(mounted) {
              setState(() {
                isLoading = false;     
              });
            }
            // ignore: use_build_context_synchronously
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