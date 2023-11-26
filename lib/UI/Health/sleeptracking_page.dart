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
  String startTimeText = "00:00";
  String currentHeartRate = "N/A";
  String selectedDataRange = "Day";
  List<BarChartGroupData> barGroups = [];
  DateTime currentStepsDate = DateTime.now();
  List<int?> sleepData = List.filled(7, null);
  
  Future<void> fetchSleepData() async {
    final today = DateTime.now();
    String userId = "";
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      userId = user.uid;
      DateTime startOfPeriod = today.subtract(const Duration(days: 6));
      DateTime endOfPeriod = today;
      String startOfPeriodStr = '${startOfPeriod.year}-${startOfPeriod.month}-${startOfPeriod.day}';
      String endOfPeriodStr = '${endOfPeriod.year}-${endOfPeriod.month}-${endOfPeriod.day}';
      String databasePath = 'health/$userId/sleep_session/';
      DataSnapshot dataSnapshot = (await FirebaseDatabase.instance
              .ref()
              .child(databasePath)
              .orderByKey()
              .startAt(startOfPeriodStr)
              .endAt(endOfPeriodStr)
              .once()).snapshot;

      if (dataSnapshot.value is Map) {
        Map<String, dynamic> dataMap = Map<String, dynamic>.from(dataSnapshot.value as Map<dynamic, dynamic>);
        sleepDataList = List.generate(7, (index) {
          String dateKey = '${startOfPeriod.year}-${startOfPeriod.month}-${startOfPeriod.day + index}';
          int sleepDataForDay = dataMap[dateKey] != null ? dataMap[dateKey]['total'] : 0;

          debugPrint('Sleep data for day $dateKey: $sleepDataForDay minutes');
          if (sleepDataForDay > biggestSleep) {
            biggestSleep = sleepDataForDay;
          }
          return sleepDataForDay;
        });
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

  String getDayOfWeek(int index) {
    final today = DateTime.now();
    final selectedDay = today.subtract(Duration(days: today.weekday - index));

    return DateFormat('EEEEEE').format(selectedDay);
  }

  String formatDuration(int totalMinutes) {
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;
    return '$hours H $minutes min';
  }

  @override
  void initState() {
    super.initState();
    fetchSleepData();
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

          SizedBox(
              width: 315 * screenWidth / 375,
              height: 20 * screenHeight / 375,
              child: Row(
                children: [
                  SizedBox(
                    width: 105 * screenWidth / 375,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Day")),
                  ),
                  SizedBox(
                    width: 105 * screenWidth / 375,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Week")),
                  ),
                  SizedBox(
                    width: 105 * screenWidth / 375,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Month")),
                  )
                ],
              )),
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
                            rightTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (context, value) => const TextStyle(
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
              if (index >= 0 &&
                  index < sleepDataList.length &&
                  sleepDataList[index] != null) {
                startTimeText = getDayOfWeek(index + 1);
                stepsText = formatDuration(sleepDataList[index] ?? 0);

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
        ]),
      ),
    );
  }
}
