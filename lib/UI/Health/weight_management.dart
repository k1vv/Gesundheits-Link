import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:myapp/UI/Main/main_page.dart';

class WeightManagementPage extends StatefulWidget {
  const WeightManagementPage({super.key});

  @override
  State<WeightManagementPage> createState() => _WeightManagementPageState();
}

class _WeightManagementPageState extends State<WeightManagementPage> {
    
    double progressValue = 0.0;
    double currentWeight = 59.8;

    String currentBMI = "N/A";
    String statusText = "HEALTHY";
    String caloriesDeficitSurplus = "254";
    String totalCaloriesBurn = "20";
    String totalCaloriesConsumed = "49";

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
                          builder: (context) => const MainPage()
                        )
                      );
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
                'Weight Management',
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
        padding: EdgeInsets.only(
          top: 10,
          left: 38 * screenWidth / 375, 
          right: 30 * screenWidth / 375, 
        ),
        child: Column(
          children: [
            SizedBox(height: 5 * screenHeight / 375),
            
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 300 * screenWidth / 375,
                height: 125 * screenHeight / 375,
                padding: EdgeInsets.only(
                  top: 5 * screenHeight / 375, 
                  bottom: 10 * screenHeight / 375,
                  left: 20 * screenWidth / 375, 
                  right: 20 * screenWidth / 375
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), 
                      spreadRadius: 0, 
                      blurRadius: 5, 
                      offset: const Offset(0, 3), 
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedRadialGauge(
                      duration: const Duration(seconds: 1), 
                      value: 1.0,
                      radius: 110,
                      curve: Curves.elasticOut,

                      axis: GaugeAxis(
                        min: progressValue,
                        max: 10.0,
                        degrees: 280,

                        style: const GaugeAxisStyle(
                          thickness: 15, 
                          background: Color.fromARGB(255, 242, 198, 198), 
                          segmentSpacing: 0
                        ),
                        pointer: const GaugePointer.triangle(
                          width: 25, 
                          height: 25, 
                          color: Colors.transparent
                        ),
                        progressBar: const GaugeProgressBar.rounded(
                          color: Color.fromARGB(255, 255, 96, 120)
                        )
                      ),
                    ),
                    Positioned(
                      top: 35 * screenHeight / 375,
                      child: Container(
                        width: 150 * screenWidth / 375,
                        height: 10 * screenHeight / 375,
                        color: Colors.transparent,
                        child: Text(
                          "BMI $currentBMI",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Arial',
                          ),
                        )
                      )
                    ), 
                    Positioned(
                      top: 50 * screenHeight / 375,
                      child: Container(
                        width: 115 * screenWidth / 375,
                        height: 12 * screenHeight / 375,
                        decoration: BoxDecoration(
                          color: Colors.transparent, 
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all( 
                            color: const Color.fromARGB(255, 249, 157, 188),
                            width: 1.0
                          )
                        ),
                        child: Text(
                          statusText, 
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14,
                            color: Color.fromARGB(255, 249, 157, 188),
                          ),
                        ),
                      )
                    ),
                    Positioned(
                      top: 65 * screenHeight / 375,
                      left: 95 * screenWidth / 375,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            //width: 90 * screenWidth / 375,
                            height: 20 * screenHeight / 375,
                            color: Colors.transparent,
                            child: Text(
                              currentWeight.toString(),
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 32, 
                                fontWeight: FontWeight.bold                
                              ),
                            )
                          ),
                          Column(
                            children: [
                              SizedBox(height: 5 * screenHeight / 375),
                              Container(
                                alignment: Alignment.bottomCenter,
                                width: 15 * screenWidth / 375,
                                height: 10 * screenHeight / 375,
                                color: Colors.transparent,
                                child: const Text(
                                  "kg",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                  ),
                                )
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                    Positioned(
                      top: 92 * screenHeight / 375,
                      child: Container(
                        width: 115 * screenWidth / 375,
                        height: 12 * screenHeight / 375,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 249, 157, 188), 
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            fixedSize: Size(200 * screenWidth / 375, 100 * screenHeight / 375),

                            surfaceTintColor: Colors.transparent, 
                            backgroundColor: Colors.transparent, 
                            foregroundColor: Colors.transparent, 
                            shadowColor: Colors.transparent
                          ),
                          child: const Text(
                            "Manage Goal", 
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          )
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 5 * screenHeight / 375),

            Container(
              width: 140 * screenWidth / 375,
              height: 15 * screenHeight / 375,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 249, 157, 188),
                borderRadius: BorderRadius.circular(40)
              ),
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent, 
                  backgroundColor: Colors.transparent, 
                  foregroundColor: Colors.transparent, 
                  surfaceTintColor: Colors.transparent
                ),
                child: const Text(
                  "Add Record", 
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                )
              ),
            ),

            SizedBox(height: 8 * screenHeight / 375),

            Container(
              padding: EdgeInsets.only(
                left: 20 * screenWidth / 375
              ),
              width: double.infinity,
              child: const Text(
                "Stay Fit Plan", 
                textAlign: TextAlign.start, 
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontFamily: 'Arial',         
                  fontSize: 14
                ),
              )
            ),

            SizedBox(height: 3 * screenHeight / 375),

            Material(
              elevation: 1, 
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 300 * screenWidth / 375, 
                height: 150 * screenHeight / 375,
                padding: EdgeInsets.only(
                  top: 5 * screenHeight / 375, 
                  bottom: 10 * screenHeight / 375,
                  left: 20 * screenWidth / 375, 
                  right: 20 * screenWidth / 375
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), 
                      spreadRadius: 0, 
                      blurRadius: 5, 
                      offset: const Offset(0, 3), 
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 2 * screenHeight / 375,),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Calories Record", 
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Arial', 
                          fontSize: 14, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 20 * screenHeight / 375,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Text(
                            caloriesDeficitSurplus,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontFamily: 'Arial', 
                              fontSize: 30
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 3 * screenHeight / 375,),
                            const SizedBox(
                              child: Text(
                                " kcal"
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20 * screenHeight / 375,),
                    Row(
                      children: [
                        SizedBox(                         
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Total Burnt", 
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                ),
                              ),
                              Text(
                                "$totalCaloriesBurn kcal", 
                                style: const TextStyle(
                                  fontFamily: 'Arial',
                                ),
                              )
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Total Consumed", 
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                ),
                              ),
                              Text(
                                "$totalCaloriesConsumed kcal", 
                                style: const TextStyle(
                                  fontFamily: 'Arial',
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10 * screenHeight / 375,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                        
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  "assets/images/breakfast.jpg",
                                  width: 35 * screenWidth / 375,
                                  height: 20 * screenHeight / 375,
                                )
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    size: 15.0,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    " Breakfast", 
                                    style: TextStyle(
                                      fontFamily: 'Arial', 
                                      fontSize: 10
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                            
                        const Expanded(child: SizedBox()),

                        GestureDetector(
                          onTap: () {
                        
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  "assets/images/lunch.jpg",
                                  width: 35 * screenWidth / 375,
                                  height: 20 * screenHeight / 375,
                                )
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    size: 15.0,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    " Lunch", 
                                    style: TextStyle(
                                      fontFamily: 'Arial', 
                                      fontSize: 10
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),

                        GestureDetector(
                          onTap: () {
                        
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  "assets/images/dinner.jpg",
                                  width: 35 * screenWidth / 375,
                                  height: 20 * screenHeight / 375,
                                )
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    size: 15.0,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    " Dinner", 
                                    style: TextStyle(
                                      fontFamily: 'Arial', 
                                      fontSize: 10
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),

                        GestureDetector(
                          onTap: () {
                        
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  "assets/images/snacks.jpg",
                                  width: 35 * screenWidth / 375,
                                  height: 20 * screenHeight / 375,
                                )
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    size: 15.0,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    " Snacks", 
                                    style: TextStyle(
                                      fontFamily: 'Arial', 
                                      fontSize: 10
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]
        ),
      )
    );
  }
}