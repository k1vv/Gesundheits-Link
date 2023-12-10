// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:myapp/UI/Main/main_page.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({Key? key,}): super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SleepPage createState() => _SleepPage();
}

class _SleepPage extends State<SleepPage> {

  double selectedValue = 0;                                                                                           ///////////////////////////////////////////////////////////////

  String dateKey = ''; 

  String dateFrom = "N/A";
  String dateTo = "N/A";

  String sleepsText = "N/A";                                // Sleep Value when user slide the graph //
  String startTimeText = "N/A";                             // The date when user slid the graph //

  String selectedOption = "Weekly";
  
  int sleepLight = 0;
  int sleepDeep = 0;
  int sleepRem = 0;
  int sleepAwake = 0;
  int biggestSleep = 0;                                                                                                                  // Variable Declaration //
  int biggestHeartRate = 0;
  
  List<String> dateTolist = [];
  List<String> dateFromlist = [];

  List<int> sleepWeeklyDataList = [];  
  List<int> sleepRemWeeklyDataList = []; 
  List<int> sleepDeepWeeklyDataList = [];                   // List where the data fetch from firebase is stored //
  List<int> sleepLightWeeklyDataList = [];                      
  List<int> sleepAwakeWeeklyDataList = [];          

  List<BarChartGroupData> barGroups = [];

                                                                           ///////////////////////////////////////////////////////////////
  
  // Fetch Data Weekly //

  Future<void> fetchSleepWeeklyData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      userId = user.uid;
      DateTime startOfPeriod = today.subtract(const Duration(days: 6));
      String databasePath = 'health/$userId/sleep_session/';
      
      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

      if (dataSnapshot.value != null) {
        Map<String, dynamic> dataMap = Map<String, dynamic>.from(dataSnapshot.value as Map<dynamic, dynamic>);
        sleepWeeklyDataList = List.generate(7, (index) {

          String dateKey = '${startOfPeriod.year}-${startOfPeriod.month}-${startOfPeriod.day + index}';

          int sleepDataForDay = dataMap[dateKey] != null ? int.parse(dataMap[dateKey]['total'].toString()) : 0;
          dateFrom = dataMap[dateKey] != null && dataMap[dateKey] is Map && dataMap[dateKey]['dateFrom'] != null ? formatTime(dataMap[dateKey]['dateFrom']) : 'N/A';
          dateTo = dataMap[dateKey] != null && dataMap[dateKey] is Map && dataMap[dateKey]['dateTo'] != null ? formatTime(dataMap[dateKey]['dateTo']) : 'N/A';

          sleepDeep = dataMap[dateKey] != null ? int.tryParse(dataMap[dateKey]['sleepDeep']?.toString() ?? '0') ?? 0 : 0;
          sleepLight = dataMap[dateKey] != null ? int.tryParse(dataMap[dateKey]['sleepLight']?.toString() ?? '0') ?? 0 : 0;
          sleepRem = dataMap[dateKey] != null ? int.tryParse(dataMap[dateKey]['sleepRem']?.toString() ?? '0') ?? 0 : 0;
          sleepAwake = dataMap[dateKey] != null ? int.tryParse(dataMap[dateKey]['sleepAwake']?.toString() ?? '0') ?? 0 : 0;

          debugPrint('Date From: $dateFrom');    
          debugPrint('Date To: $dateTo');

          sleepDeepWeeklyDataList.add(sleepDeep);
          sleepLightWeeklyDataList.add(sleepLight);
          sleepRemWeeklyDataList.add(sleepRem);
          sleepAwakeWeeklyDataList.add(sleepAwake);

          dateTolist.add(dateTo);
          dateFromlist.add(dateFrom);

          debugPrint('Sleep data for day $dateKey: $sleepDataForDay minutes');
          if (sleepDataForDay > biggestSleep) {
            biggestSleep = sleepDataForDay;
          }
          return sleepDataForDay;
        });
        if (mounted) {
          setState(() {
            barGroups = List.generate(7, (index) {
              int dayIndex = index + 1;
              int sleepDataForDay = sleepWeeklyDataList[index];
              return BarChartGroupData(
                x: dayIndex,
                barsSpace: 4,
                barRods: [
                  BarChartRodData(
                    y: sleepDataForDay.toDouble(),
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
      } else {
        debugPrint("Error Encountered");
      }
    }
  }

  Future<void> fetchCurrentData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      userId = user.uid;
      String databasePath = 'health/$userId/sleep_session/${today.year}-${today.month}-${today.day}/total';
      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
      if (dataSnapshot.value != null) {
        setState(() {
          int x = (dataSnapshot.value as int?) ?? 0;
          sleepsText = formatDuration(x);
          startTimeText = DateFormat('EEEEEE').format(today);
        });
      debugPrint(sleepsText);
      debugPrint(startTimeText);
      }
    }
  }

  // Fetch Data Weekly //

  int calculateSleepDebt(int actualSleepDuration, int requiredSleepDuration) {

    int sleepDebt = requiredSleepDuration - actualSleepDuration;
    return sleepDebt > 0 ? sleepDebt : 0;
  }

  String getDayOfWeek(int index) {
    final today = DateTime.now();
    final selectedDay = today.subtract(Duration(days: (today.day + 1) - index));

    return DateFormat('EEEEEE').format(selectedDay);
  }

  String formatDuration(int totalMinutes) {
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;
    return '$hours H $minutes min';
  }

  String formatTime(String? timestamp) {
    if (timestamp != null) {
      DateTime dateTime = DateTime.parse(timestamp);
      return DateFormat('hh:mm a').format(dateTime);
    }
    return 'N/A';
  }

  @override
  void initState() {
    super.initState();
    fetchSleepWeeklyData();
    fetchCurrentData();
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
                'Sleep Session',
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
                  sleepsText,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
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
                                reservedSize: 40, // Adjust the reserved size according to your need
                                getTitles: (value) {
                                  int hourValue = value.toInt() ~/ 60;
                                  return '$hourValue Hour';
                                },

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
                          maxY: biggestSleep > 0 ? biggestSleep.toDouble() * 1.1 : 10.0,
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
                  width: 330 * screenWidth / 375,
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
                        if (mounted) {
                          setState(() {
                            selectedValue = value;
                            if (selectedOption == 'Weekly') {
                              final today = DateTime.now();
                              final startOfPeriod = today.subtract(const Duration(days: 6));
                              final selectedDate = startOfPeriod.add(Duration(days: value.toInt()));

                              final formatter = DateFormat('EEE, MMM dd');
                              startTimeText = formatter.format(selectedDate);

                              final index = selectedValue.toInt();
                              if (index >= 0 && index < sleepWeeklyDataList.length && sleepWeeklyDataList[index] != null) {
                                sleepsText = formatDuration(sleepWeeklyDataList[index]);

                                if (index < dateFromlist.length && index < dateTolist.length) {
                                  dateFrom = dateFromlist[index];
                                  dateTo = dateTolist[index];

                                  sleepDeep = sleepDeepWeeklyDataList[index];
                                  sleepLight = sleepLightWeeklyDataList[index];
                                  sleepRem = sleepRemWeeklyDataList[index];
                                  sleepAwake = sleepAwakeWeeklyDataList[index];
                                }
                              }
                            }
                          });
                        }
                      },
                      min: 0,
                      max: selectedOption == 'Weekly' ? 6 : 29,
                      divisions: selectedOption == 'Weekly' ? 6 : 29,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10 * screenHeight / 375),
            Material(
              color: const Color.fromARGB(255, 255,192,203),
              borderRadius: BorderRadius.circular(15),
              elevation: 10,
              child: Container(
                width: 325 * screenWidth / 375,
                height: 125 * screenHeight / 375,
                padding: EdgeInsets.only(
                  left: 25 * screenWidth / 375,
                  right: 25 * screenWidth / 375,
                  top: 10 * screenHeight / 375,
                  bottom: 10 * screenHeight / 375,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Your Sleep Data :", 
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Arial', 
                          fontWeight: FontWeight.bold, 
                          fontSize: 18
                        ),
                      )
                    ),
                    SizedBox(height: 5 * screenHeight / 375,),
                    Row(
                      children: [
                        const Text(
                          "Date From :", 
                          style: TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        ),
                        const Spacer(),
                        Text(
                          dateFrom, 
                          style: const TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2 * screenHeight / 375,),
                    Row(
                      children: [
                        const Text(
                          "Date To :", 
                          style: TextStyle(
                              fontFamily: 'Arial', 
                              fontSize: 16
                          ),
                        ),
                        const Spacer(),
                        Text(
                          dateTo, 
                          style: const TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2 * screenHeight / 375,), 
                    Row(
                      children: [
                        const Text(
                          "Sleep Deep : ", 
                          style: TextStyle(
                              fontFamily: 'Arial', 
                              fontSize: 16
                          ),),
                        const Spacer(),
                        Text(
                          "$sleepDeep minutes", 
                          style: const TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2 * screenHeight / 375,),
                    Row(
                      children: [
                        const Text(
                          "Sleep Light : ",
                          style: TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ), 
                        ),
                        const Spacer(),
                        Text(
                          "$sleepLight minutes", 
                          style: const TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2 * screenHeight / 375,),
                    Row(
                      children: [
                        const Text(
                          "Sleep Rem : ",
                          style: TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "$sleepRem minutes", 
                          style: const TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2 * screenHeight / 375,),
                    Row(
                      children: [
                        const Text(
                          "Sleep Awake : ",
                          style: TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "$sleepAwake minutes", 
                          style: const TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2 * screenHeight / 375,),
                    Row(
                      children: [
                        const Text(
                          "Sleep Debt: ",
                          style: TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${calculateSleepDebt(sleepDeep + sleepLight + sleepRem + sleepAwake, 360)} minutes", 
                          style: const TextStyle(
                            fontFamily: 'Arial', 
                            fontSize: 16
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
        ]),
      ),
    );
  }
}