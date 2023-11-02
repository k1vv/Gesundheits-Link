import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HeartRatePage extends StatefulWidget {
  const HeartRatePage({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _HeartRatePage createState() => _HeartRatePage();
}

class _HeartRatePage extends State<HeartRatePage> {
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
        title: const Text(
          'Steps',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
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
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ),
              const SizedBox(
                child: Text(
                  " steps",
                ),
              )
            ],
          )),
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
                  height: 200,
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
          Slider(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearPercentIndicator(
                    lineHeight: 25,
                    percent: 0.7,
                    progressColor: Colors.pink,
                    backgroundColor: Colors.pink.shade100,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
