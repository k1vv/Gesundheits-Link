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

  int flexBar = 0;
  double maxValue = 0;
  int biggestSleep = 0;
  String stepsText = "N/A";
  
  int biggestHeartRate = 0;
  double selectedValue = 0;
  List<int> sleepDataList = [];
  String flexbarString = "N/A";
  String startTimeText = "N/A";
  String currentHeartRate = "N/A";
  String selectedDataRange = "Day";
  List<BarChartGroupData> barGroups = [];
  DateTime currentStepsDate = DateTime.now();
  List<int?> sleepData = List.filled(7, null);
  String dateFrom = "N/A";
  String dateTo = "N/A";
  Map<String, dynamic> dataMap = {};
  String dateKey = '';
  List<String> dateTolist = [];
  List<String> dateFromlist = [];
  
  Future<void> fetchSleepData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      userId = user.uid;
      DateTime startOfPeriod = today.subtract(const Duration(days: 6));
      DateTime endOfPeriod = today;
      String startOfPeriodStr =
          '${startOfPeriod.year}-${startOfPeriod.month}-${startOfPeriod.day}';
      String endOfPeriodStr =
          '${endOfPeriod.year}-${endOfPeriod.month}-${endOfPeriod.day}';
      String databasePath = 'health/$userId/sleep_session/';
      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance
              .ref()
              .child(databasePath)
              .orderByKey()
              .startAt(startOfPeriodStr)
              .endAt(endOfPeriodStr)
              .once())
          .snapshot;

      if (dataSnapshot.value is Map) {
        Map<String, dynamic> dataMap =
            Map<String, dynamic>.from(dataSnapshot.value as Map<dynamic, dynamic>);
        sleepDataList = List.generate(7, (index) {
          String dateKey =
              '${startOfPeriod.year}-${startOfPeriod.month}-${startOfPeriod.day + index}';
          int sleepDataForDay = dataMap[dateKey] != null
              ? int.parse(dataMap[dateKey]['total'].toString())
              : 0;
          dateFrom = dataMap[dateKey] != null &&
                  dataMap[dateKey] is Map &&
                  dataMap[dateKey]['dateFrom'] != null
              ? formatTime(dataMap[dateKey]['dateFrom'])
              : 'N/A';
          dateTo = dataMap[dateKey] != null &&
                  dataMap[dateKey] is Map &&
                  dataMap[dateKey]['dateTo'] != null
              ? formatTime(dataMap[dateKey]['dateTo'])
              : 'N/A';

          debugPrint('Date From: $dateFrom');    
          debugPrint('Date To: $dateTo');

          dateTolist.add(dateTo);
          dateFromlist.add(dateFrom);

          debugPrint('Sleep data for day $dateKey: $sleepDataForDay minutes');
          if (sleepDataForDay > biggestSleep) {
            biggestSleep = sleepDataForDay;
          }
          return sleepDataForDay;
        });

        // Print dateFrom and dateTo here to see their values


        setState(() {
          barGroups = List.generate(7, (index) {
            int dayIndex = index + 1;
            int sleepDataForDay = sleepDataList[index];
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
          stepsText = formatDuration(x);
          startTimeText = DateFormat('EEEEEE').format(today);
        });
      debugPrint(stepsText);
      debugPrint(startTimeText);
      }
    }
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
    fetchSleepData();
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
                  stepsText,
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
                            rightTitles: SideTitles(showTitles: false),
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
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                          if (sleepDataList.isNotEmpty && selectedValue.isFinite) {
                            final index = selectedValue.toInt() - 1;
                            // ignore: unnecessary_null_comparison
                            if (index >= 0 && index < sleepDataList.length && sleepDataList[index] != null) {
                              startTimeText = getDayOfWeek(index + 1);
                              stepsText = formatDuration(sleepDataList[index]);

                              // Check if the index is within bounds before accessing the list elements
                              if (index < dateFromlist.length && index < dateTolist.length) {
                                dateFrom = dateFromlist[index];
                                dateTo = dateTolist[index];
                              }
                            }
                          }
                        });
                      },
                      min: 0,
                      max: 7,
                      divisions: 7,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10 * screenHeight / 375),
            Container(
              color: Colors.grey,
              width: 200 * screenWidth / 375,
              height: 100 * screenHeight / 375,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Date From: $dateFrom"),
                  Text("Date To: $dateTo"),
                ],
              ),
            )
        ]),
      ),
    );
  }
}
