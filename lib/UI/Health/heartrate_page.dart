// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class HeartRatePage extends StatefulWidget {

  const HeartRatePage({Key? key,}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HeartRatePageState createState() => _HeartRatePageState();
}

class _HeartRatePageState extends State<HeartRatePage> {

  List<int?> heartRateData = List.generate(24, (index) => 0);
  List<int?> heartRateWeeklyData = List.generate(7, (index) => 0);

  List<int?> heartRateMonthlyData = List.generate(
    DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
    (index) => 0,
  );

  List<BarChartGroupData> barGroups = [];

  String selectedOption = "Daily";

  String heartRateText = "N/A";
  String enteredGoal = "2500";
  String startTimeText = "00:00";
  String heartRateDataCurrent = "N/A";

  double selectedValue = 0;
  double biggestheartRate = 0;

  String heartRateLatest = "N/A";
  String latestTime = "N/A";

  bool isLoading = false;

  // Fetch Daily Heart Rate Data //

  Future<void> fetchheartRateDailyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      for (int i = 1; i <= 23; i++) {
        final databasePath = 'health/$userId/heart_rate/${today.year}-${today.month}-${today.day}/$i';

        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
        if (dataSnapshot.value != null) {
          int value = int.parse(dataSnapshot.value.toString());
          if (mounted) {
            setState(() {
              heartRateData[i] = value;
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
                 y: index < heartRateData.length
                  ? (double.parse(heartRateData[index].toString()))
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

  Future<void> getBiggestheartRate() async {
    final today = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;

    String userId = "";

    if (user != null) {
      userId = user.uid;

      double maxHeartRate = 0;

      for (int i = 1; i <= 23; i++) {
        String databasePath = 'health/$userId/heart_rate/${today.year}-${today.month}-${today.day}/$i';
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
          biggestheartRate = maxHeartRate;
        });
      }
      debugPrint('Maximum heartRate: $maxHeartRate');
    }
  }

  Future<void> getLatestheartRate() async {
    final today = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;

    String userId = "";

    if (user != null) {
      userId = user.uid;

      for (int i = 23; i >= 0; i--) {
        String databasePath = 'health/$userId/heart_rate/${today.year}-${today.month}-${today.day}/$i';
        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          double heartRate = double.parse(dataSnapshot.value.toString());
          if(heartRate > 0) {
            if(mounted) {
              setState(() {
                heartRateLatest = heartRate.toInt().toString();
                latestTime = i.toString();

                startTimeText = '${latestTime.padLeft(2, '0')}:00';
                heartRateDataCurrent = heartRateLatest;
                heartRateText = heartRateLatest;
              });
            }
            break;
          }
        }
      }

      debugPrint('Latest heartRate: $heartRateLatest');
    }
  }

  // Fetch Daily Heart Rate Data //

  // Fetch Weekly Heart Rate Data //

  Future<void> fetchheartRateWeeklyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));

      for (int i = 0; i < 7; i++) {
        int maxHeartRate = 0; 
        DateTime currentDate = startOfWeek.add(Duration(days: i));

        for (int j = 0; j <= 23; j++) {
          String databasePath = 'health/$userId/heart_rate/${currentDate.year}-${currentDate.month}-${currentDate.day}/$j';
          DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

          if (dataSnapshot.value != null) {
            int value = int.parse(dataSnapshot.value.toString());
            if (value > 0) {
              maxHeartRate = value;
              break;
            }
          }
        }
        if(mounted) {
          setState(() {
            heartRateWeeklyData[i] = maxHeartRate;
          });
        }
        debugPrint("Max Heart Rate: $maxHeartRate %$i");
      }

      findBiggestWeeklyheartRate();
      if(mounted) {
        setState(() {
          barGroups = List.generate(7, (index) {
            return BarChartGroupData(
              x: index,
              barsSpace: 4,
              barRods: [
                BarChartRodData(
                  y: index < heartRateWeeklyData.length
                      ? (heartRateWeeklyData[index]?.toDouble() ?? 0.0)
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

  Future<void> findBiggestWeeklyheartRate() async {
    int? maxHeartRate = 0;
    int index = 0;

    for (int i = 0; i < heartRateWeeklyData.length; i++) {
      int? heartRate = heartRateWeeklyData[i];

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
        biggestheartRate = double.parse(maxHeartRate.toString());
        heartRateText = biggestheartRate.toInt().toString();
      });
    }
  }

  // Fetch Weekly Heart Rate Data //

  // Fetch Monthly Heart Rate Data //

  Future<void> fetchheartRateMonthlyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;

      int totalheartRate = 0;
      DateTime startOfMonth = DateTime(today.year, today.month, 1);

      for (int i = 0; i < DateTime(today.year, today.month + 1, 0).day; i++) {
        int maxHeartRate = 0;
        DateTime currentDate = startOfMonth.add(Duration(days: i));

        for (int j = 1; j <= 23; j++) {
          String databasePath =
              'health/$userId/heart_rate/${currentDate.year}-${currentDate.month}-${currentDate.day}/$j';
          DataSnapshot dataSnapshot = (await FirebaseDatabase.instance
                  .ref()
                  .child(databasePath)
                  .once())
              .snapshot;

          if (dataSnapshot.value != null) {
            int value = int.parse(dataSnapshot.value.toString());
            if (value > 0) {
              maxHeartRate = value;
              break;
            }
          }
        }
        if (mounted) {
          setState(() {
            heartRateMonthlyData[i] = maxHeartRate;
          });
        }
        debugPrint("maxHeartRate monthly: $maxHeartRate %$i");
      }
      findBiggestMonthlyheartRate();
      if (mounted) {
        setState(() {
          heartRateDataCurrent = totalheartRate.toInt().toString();
          barGroups = List.generate(
            DateTime(today.year, today.month + 1, 0).day,
            (index) {
              return BarChartGroupData(
                x: index,
                barsSpace: 4,
                barRods: [
                  BarChartRodData(
                    y: index < heartRateMonthlyData.length
                        ? (heartRateMonthlyData[index]?.toDouble() ?? 0.0)
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

  Future<void> findBiggestMonthlyheartRate() async {
    int? maxHeartRate = 0;
    int index = 0;

    for (int i = 0; i < heartRateMonthlyData.length; i++) {
      int? heartRate = heartRateMonthlyData[i];

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
        biggestheartRate = double.parse(maxHeartRate.toString());
        heartRateText = biggestheartRate.toInt().toString();
      });
    }
  }

  // Fetch Monthly Heart Rate Data //


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

    getLatestheartRate();
    getBiggestheartRate();
    fetchheartRateDailyData();
    
    int latestIndex = heartRateData.lastIndexWhere((heartRate) => heartRate != null);

    if (latestIndex != -1) {
      startTimeText = '${(heartRateData[latestIndex] ?? 0).toString().padLeft(2, '0')}:00';
      heartRateText = (heartRateData[latestIndex] ?? 0).toString();
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
                'Heart Rate',
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
                  heartRateText,
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
                          maxY: biggestheartRate == 0 ? 5.0 : biggestheartRate * 1.1,
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
                              heartRateText = (heartRateWeeklyData[value.toInt() % 7] ?? 0).toInt().toString();
                            } else if (selectedOption == 'Daily') {
                              if (selectedValue > 24.0) {
                                selectedValue = 0.0;
                              }

                              if (heartRateData.isNotEmpty) {
                                final index = value.toInt();
                                if (index >= 0 &&
                                    index < heartRateData.length &&
                                    heartRateData[index] != null) {
                                  final selectedHour = (index).toString().padLeft(2, '0');
                                  startTimeText = '$selectedHour:00';
                                  heartRateText = (heartRateData[index] ?? 0).toString();
                                }
                              }
                            } else if (selectedOption == 'Monthly') {
                              if (heartRateMonthlyData.isNotEmpty) {
                                final index = value.toInt();
                                if (index >= 0 &&
                                    index < heartRateMonthlyData.length &&
                                    heartRateMonthlyData[index] != null) {

                                  final today = DateTime.now();
                                  final selectedDate = DateTime(today.year, today.month, index + 1);


                                  final formatter = DateFormat('EEE, MMM dd');
                                  startTimeText = formatter.format(selectedDate);
                                  heartRateText = (heartRateMonthlyData[index] ?? 0).toInt().toString();
                                }
                              }
                            }
                          });
                        }
                      },
                      min: selectedOption == 'Weekly' ? 0 : 0,
                      max: selectedOption == 'Weekly' ? 6 : (selectedOption == 'Monthly' ? heartRateMonthlyData.length.toDouble() - 1 : 24),
                      divisions: selectedOption == 'Weekly' ? 6 : (selectedOption == 'Monthly' ? heartRateMonthlyData.length - 1 : 24),
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Builder (
                        builder: (context) {
                          try {
                            final int heartRateData = int.parse(heartRateDataCurrent);
                            if (heartRateData >= 60 && heartRateData <= 120) {
                              return const Text(
                                "Your heart rate is great!",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                ),
                              );
                            } else if (heartRateData < 60) {
                              return const Text(
                                "Your heart rate is too low. Seek medical attention now.",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              );
                            } else if (heartRateData > 120) {
                              return const Text(
                                "Your heart rate is quite high. You should get some rest.",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange,
                                ),
                              );
                            }
                            return const Text(
                              "No Heart Rate Data",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            );
                          } catch (e) {
                            return const Text(
                              "No Heart Rate Data",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
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

              await getLatestheartRate();
              await getBiggestheartRate();
              await fetchheartRateDailyData();

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

            await fetchheartRateWeeklyData();

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

            await fetchheartRateMonthlyData();

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