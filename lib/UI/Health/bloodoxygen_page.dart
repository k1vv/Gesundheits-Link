import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:myapp/UI/Main/main_page.dart';

class BloodOxygenPage extends StatefulWidget {
  const BloodOxygenPage({Key? key, required this.currentBloodOxygen, required this.maxBloodOxygen}): super(key: key);

  final String currentBloodOxygen;
  final int maxBloodOxygen;


  @override
  // ignore: library_private_types_in_public_api
  _BloodOxygenPage createState() => _BloodOxygenPage();
}

class _BloodOxygenPage extends State<BloodOxygenPage> {
  String currentBloodOxygen = "N/A";
  DateTime currentStepsDate = DateTime.now();
  String flexbarString = "N/A";
  int flexBar = 0;
  double maxValue = 0;
  List<int?> bloodOxygenData = List.filled(24, null);
  int biggestHeartRate = 0;
  double selectedValue = 0;
  String startTimeText = "00:00";
  String stepsText = "N/A";
  String selectedDataRange = "Day";


  Future<void> fetchDataFromFirebase(int x) async {
    try {
      final today = DateTime.now();
      String userId = "";
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        userId = user.uid;
        String databasePath = 'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/$x';
        DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          int? value = int.tryParse(dataSnapshot.value.toString());
          if (value != null) {
            setState(() {
              bloodOxygenData[x - 1] = value;
            });
          } else {
            debugPrint('Invalid data format for heart rate value.');
          }
        } else {
          debugPrint('No data found for the specified path.');
        } 
      }
    } catch (e) {
      debugPrint('Error fetching data from Firebase: $e');
    }
  }

  void fetchData() {
    currentBloodOxygen = widget.currentBloodOxygen;
    flexBar = widget.maxBloodOxygen;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    for (int x = 1; x <= 24; x++) {
      fetchDataFromFirebase(x);
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
            y: bloodOxygenData[index]?.toDouble() ?? 0.0,
            colors: [Colors.blue],
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(5), bottom: Radius.circular(0)
            )
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
                  "$stepsText%",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ),
              const SizedBox(
                child: Text(
                  " spO2",
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
                          if (bloodOxygenData.isNotEmpty) {
                            final index = selectedValue.toInt() - 1;
                            if (index >= 0 && index < bloodOxygenData.length && bloodOxygenData[index] != null) {
                              final selectedHour = (index + 1).toString().padLeft(2, '0');
                              startTimeText = '$selectedHour:00';
                              stepsText = (bloodOxygenData[index] ?? 0).toString();
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
        ]),
      ),
    );
  }
}
