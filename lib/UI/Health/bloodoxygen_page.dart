// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class BloodOxygenPage extends StatefulWidget {

  const BloodOxygenPage({Key? key,}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BloodOxygenPageState createState() => _BloodOxygenPageState();
}

class _BloodOxygenPageState extends State<BloodOxygenPage> {

  List<double?> bloodOxygenData = List.generate(24, (index) => 0);
  List<double?> bloodOxygenWeeklyData = List.generate(7, (index) => 0);

  List<double?> bloodOxygenMonthlyData = List.generate(
    DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
    (index) => 0,
  );

  List<BarChartGroupData> barGroups = [];

  String selectedOption = "Daily";

  String bloodOxygenText = "N/A";
  String enteredGoal = "2500";
  String startTimeText = "00:00";
  String bloodOxygenDataCurrent = "N/A";

  double selectedValue = 0;
  double biggestBloodOxygen = 0;

  String bloodOxygenLatest = "N/A";
  String latestTime = "N/A";

  bool isLoading = false;

  // Fetch Daily Blood Oxygen Data //

  Future<void> fetchBloodOxygenDailyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      for (int i = 1; i <= 23; i++) {
        final databasePath = 'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/$i';

        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
        if (dataSnapshot.value != null) {
          double value = double.parse(dataSnapshot.value.toString());
          if (mounted) {
            setState(() {
              bloodOxygenData[i] = value;
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
                 y: index < bloodOxygenData.length
                  ? (double.parse(bloodOxygenData[index].toString()))
                  : 0.0,
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

  Future<void> getBiggestBloodOxygen() async {
    final today = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;

    String userId = "";

    if (user != null) {
      userId = user.uid;

      double maxHeartRate = 0;

      for (int i = 1; i <= 23; i++) {
        String databasePath = 'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/$i';
        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          double heartRate = double.parse(dataSnapshot.value.toString());

          if (heartRate > maxHeartRate) {
            maxHeartRate = heartRate;
          }
        }
      }
      
      if(mounted) {
        setState(() {
          biggestBloodOxygen = maxHeartRate;
        });
      }
      debugPrint('Maximum heartRate: $maxHeartRate');
    }
  }

  Future<void> getLatestBloodOxygen() async {
    final today = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;

    String userId = "";

    if (user != null) {
      userId = user.uid;

      for (int i = 23; i >= 0; i--) {
        String databasePath = 'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/$i';
        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          double heartRate = double.parse(dataSnapshot.value.toString());
          if(heartRate > 0) {
            if(mounted) {
              setState(() {
                bloodOxygenLatest = heartRate.toString();
                latestTime = i.toString();

                startTimeText = '${latestTime.padLeft(2, '0')}:00';
                bloodOxygenText = "$bloodOxygenLatest%";
              });
            }
            break;
          }
        }
      }

      debugPrint('Latest heartRate: $bloodOxygenLatest');
    }
  }

  // Fetch Daily Blood Oxygen Data //

  // Fetch Weekly Blood Oxygen Data //

  Future<void> fetchBloodOxygenWeeklyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      double totalheartRate = 0;
      DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));

      for (int i = 0; i < 7; i++) {
        double maxHeartRate = 0; 
        DateTime currentDate = startOfWeek.add(Duration(days: i));

        for (int j = 0; j <= 23; j++) {
          String databasePath = 'health/$userId/blood_oxygen/${currentDate.year}-${currentDate.month}-${currentDate.day}/$j';
          DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

          if (dataSnapshot.value != null) {
            double value = double.parse(dataSnapshot.value.toString());
            if (value > 0) {
              maxHeartRate = value;
              break;
            }
          }
        }
        if(mounted) {
          setState(() {
            bloodOxygenWeeklyData[i] = maxHeartRate;
          });
        }
        debugPrint("Max Heart Rate: $maxHeartRate %$i");
      }

      findBiggestWeeklyBloodOxygen();
      if(mounted) {
        setState(() {
          bloodOxygenDataCurrent = totalheartRate.toInt().toString();
          barGroups = List.generate(7, (index) {
            return BarChartGroupData(
              x: index,
              barsSpace: 4,
              barRods: [
                BarChartRodData(
                  y: index < bloodOxygenWeeklyData.length
                      ? (bloodOxygenWeeklyData[index]?.toDouble() ?? 0.0)
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

  Future<void> findBiggestWeeklyBloodOxygen() async {
    double? maxHeartRate = 0;
    int index = 0;

    for (int i = 0; i < bloodOxygenWeeklyData.length; i++) {
      double? heartRate = bloodOxygenWeeklyData[i];

      if (heartRate! > maxHeartRate!) {
        maxHeartRate = heartRate;
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
        biggestBloodOxygen = double.parse(maxHeartRate.toString());
        bloodOxygenText = biggestBloodOxygen.toInt().toString();
      });
    }
  }

  // Fetch Weekly Blood Oxygen Data //

  // Fetch Monthly Blood Oxygen Data //

  Future<void> fetchBloodOxygenMonthlyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      double totalheartRate = 0;
      DateTime startOfMonth = DateTime(today.year, today.month, 1);

      for (int i = 0; i < DateTime(today.year, today.month + 1, 0).day; i++) {
        double maxHeartRate = 0;
        DateTime currentDate = startOfMonth.add(Duration(days: i));

        for (int j = 1; j <= 23; j++) {
          String databasePath =
              'health/$userId/blood_oxygen/${currentDate.year}-${currentDate.month}-${currentDate.day}/$j';
          DataSnapshot dataSnapshot = (await FirebaseDatabase.instance
                  .ref()
                  .child(databasePath)
                  .once())
              .snapshot;

          if (dataSnapshot.value != null) {
            double value = double.parse(dataSnapshot.value.toString());
            if (value > 0) {
              maxHeartRate = value;
              break;
            }
          }
        }
        if (mounted) {
          setState(() {
            bloodOxygenMonthlyData[i] = maxHeartRate;
          });
        }
        debugPrint("maxHeartRate monthly: $maxHeartRate %$i");
      }
      findBiggestMonthlyBloodOxygen();
      if (mounted) {
        setState(() {
          bloodOxygenDataCurrent = totalheartRate.toInt().toString();
          barGroups = List.generate(
            DateTime(today.year, today.month + 1, 0).day,
            (index) {
              return BarChartGroupData(
                x: index,
                barsSpace: 4,
                barRods: [
                  BarChartRodData(
                    y: index < bloodOxygenMonthlyData.length
                        ? (bloodOxygenMonthlyData[index]?.toDouble() ?? 0.0)
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

  Future<void> findBiggestMonthlyBloodOxygen() async {
    double? maxHeartRate = 0;
    int index = 0;

    for (int i = 0; i < bloodOxygenMonthlyData.length; i++) {
      double? heartRate = bloodOxygenMonthlyData[i];

      if (heartRate! > maxHeartRate!) {
        maxHeartRate = heartRate;
        index = i;
      }
    }

    if (mounted) {

        final today = DateTime.now();
        final selectedDate = DateTime(today.year, today.month, index + 1);

        final formatter = DateFormat('EEE, MMM dd');
        startTimeText = formatter.format(selectedDate);

      setState(() {
        biggestBloodOxygen = double.parse(maxHeartRate.toString());
        bloodOxygenText = biggestBloodOxygen.toInt().toString();
      });
    }
  }

  // Fetch Monthly Blood Oxygen Data //

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

    getLatestBloodOxygen();
    getBiggestBloodOxygen();
    fetchBloodOxygenDailyData();
    
    int latestIndex = bloodOxygenData.lastIndexWhere((heartRate) => heartRate != null);

    if (latestIndex != -1) {
      startTimeText = '${(bloodOxygenData[latestIndex] ?? 0).toString().padLeft(2, '0')}:00';
      bloodOxygenText = "${bloodOxygenData[latestIndex] ?? 0}%";
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
                'Blood Oxygen',
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
                  bloodOxygenText,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ),
              const SizedBox(
                child: Text(
                  " bpm",
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
                          maxY: biggestBloodOxygen == 0 ? 5.0 : biggestBloodOxygen * 1.1,
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
                  width: 350 * screenWidth / 375,
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
                      value: selectedValue,
                      onChanged: (value) {
                        if(mounted) {
                          setState(() {
                            selectedValue = value;

                            if (selectedOption == 'Weekly') {

                              if (selectedValue > 6.0) {
                                selectedValue = 0.0;
                              }

                              final today = DateTime.now();
                              final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
                              final selectedDate = startOfWeek.add(Duration(days: value.toInt()));

                              final formatter = DateFormat('EEE, MMM dd');
                              startTimeText = formatter.format(selectedDate);
                              bloodOxygenText = "${(bloodOxygenWeeklyData[value.toInt() % 7] ?? 0).toInt()}%";
                            } else if (selectedOption == 'Daily') {
                              if (selectedValue > 24.0) {
                                selectedValue = 0.0;
                              }

                              if (bloodOxygenData.isNotEmpty) {
                                final index = value.toInt();
                                if (index >= 0 &&
                                    index < bloodOxygenData.length &&
                                    bloodOxygenData[index] != null) {
                                  final selectedHour = (index).toString().padLeft(2, '0');
                                  startTimeText = '$selectedHour:00';
                                  bloodOxygenText = "${bloodOxygenData[index] ?? 0}%";
                                }
                              }
                            } else if (selectedOption == 'Monthly') {
                              if (bloodOxygenMonthlyData.isNotEmpty) {
                                final index = value.toInt();
                                if (index >= 0 &&
                                    index < bloodOxygenMonthlyData.length &&
                                    bloodOxygenMonthlyData[index] != null) {

                                  final today = DateTime.now();
                                  final selectedDate = DateTime(today.year, today.month, index + 1);


                                  final formatter = DateFormat('EEE, MMM dd');
                                  startTimeText = formatter.format(selectedDate);
                                  bloodOxygenText = "${(bloodOxygenMonthlyData[index] ?? 0).toInt()}%";
                                }
                              }
                            }
                          });
                        }
                      },
                      min: selectedOption == 'Weekly' ? 0 : 0,
                      max: selectedOption == 'Weekly' ? 6 : (selectedOption == 'Monthly' ? bloodOxygenMonthlyData.length.toDouble() - 1 : 24),
                      divisions: selectedOption == 'Weekly' ? 6 : (selectedOption == 'Monthly' ? bloodOxygenMonthlyData.length - 1 : 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10 * screenHeight / 375),
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   width: 350 * screenWidth / 375,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.white,
          //   ),
          //   child: Column(
          //     children: [
          //       Container(
          //         width: 350 * screenWidth / 375,
          //         decoration: BoxDecoration(
          //           border: Border.all(width: 1, color: Colors.black),
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //         padding: const EdgeInsets.only(
          //           left: 10, 
          //           right: 10,
          //         ),
          //         alignment: Alignment.center,
          //         child: Column(
          //           children: [
          //             SizedBox(height: 5 * screenHeight / 375,),
          //             Builder (
          //               builder: (context) {
          //                 try {
          //                   final int bloodOxygenData = int.parse(bloodOxygenLatest);
          //                   if (bloodOxygenData >= 95 && bloodOxygenData <= 100) {
          //                     return const Text(
          //                       "Your current blood oxygen is great!",
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                         fontSize: 18,
          //                         color: Colors.green,
          //                       ),
          //                     );
          //                   } else if (bloodOxygenData < 95) {
          //                     return const Text(
          //                       "Your current blood oxygen is too low. Seek medical attention now.",
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                         fontSize: 18,
          //                         color: Colors.red,
          //                       ),
          //                     );
          //                   } else if (bloodOxygenData > 100) {
          //                     return const Text(
          //                       "Your current blood oxygen is quite high. You should get some rest.",
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                         fontSize: 18,
          //                         color: Colors.orange,
          //                       ),
          //                     );
          //                   }
          //                   return const Text(
          //                     "No Heart Rate Data",
          //                     style: TextStyle(
          //                       fontSize: 18,
          //                       color: Colors.grey,
          //                     ),
          //                   );
          //                 } catch (e) {
          //                   return const Text(
          //                     "No Heart Rate Data",
          //                     style: TextStyle(
          //                       fontSize: 18,
          //                       color: Colors.grey,
          //                     ),
          //                   );
          //                 }
          //               },
          //             ),  
          //             SizedBox(height: 5 * screenHeight / 375,),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
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

              await getLatestBloodOxygen();
              await getBiggestBloodOxygen();
              await fetchBloodOxygenDailyData();

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

            await fetchBloodOxygenWeeklyData();

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

            await fetchBloodOxygenMonthlyData();

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