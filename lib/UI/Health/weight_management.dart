import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:myapp/UI/Main/main_page.dart';

class WeightManagementPage extends StatefulWidget {
  const WeightManagementPage({super.key});

  @override
  State<WeightManagementPage> createState() => _WeightManagementPageState();
}

class _WeightManagementPageState extends State<WeightManagementPage> {

  String selectedGoal = 'Gain';
  TextEditingController weightController = TextEditingController();
  TextEditingController calorieController = TextEditingController();


  bool isDeficit = false;
  bool gainLost = true;

  int userAge = 0;

  double progressValue = 0.0;

  double caloriesBreakfast = 0.0;
  double caloriesLunch = 0.0;
  double caloriesDinner = 0.0;
  double caloriesSnacks = 0.0;

  double userBMI = 0.0;
  double userBMR = 0.0;
  double currentWeight = 0.0;
  double currentHeights = 0.0;
  double activeCaloriesBurn = 0.0;

  String userGender = "";
  String userWeight = "";
  String userBirthday = "";

  String currentBMI = "N/A";
  String statusText = "N/A";
  String totalCaloriesBurn = "N/A";
  String totalCaloriesConsumed = "N/A";
  String caloriesDeficitSurplus = "N/A";

  String goalsType = "Lose";
  String initialWeight = "N/A"; 
  String totalLostGain = "N/A"; 
  String targetedWeight = "N/A";

  Future<void> saveCaloriesBreakfast (double caloriesBreakfast) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final today = DateTime.now();

      if(user != null) {
        String userId = user.uid;
        final databasePath = 'health/$userId/calories_consumed/${today.year}-${today.month}-${today.day}/breakfast';

        final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

        try {

          await databaseReference.child(databasePath).set(caloriesBreakfast);

        } catch (error) {
          debugPrint("Error saving to firebase : $error");
        }
      }

    } catch (error) {
      debugPrint("Error Found : $error");
    }
  }

  Future<void> saveCaloriesLunch (double caloriesLunch) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final today = DateTime.now();

      if(user != null) {
        String userId = user.uid;
        final databasePath = 'health/$userId/calories_consumed/${today.year}-${today.month}-${today.day}/lunch';

        final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

        try {

          await databaseReference.child(databasePath).set(caloriesLunch);

        } catch (error) {
          debugPrint("Error saving to firebase : $error");
        }
      }

    } catch (error) {
      debugPrint("Error Found : $error");
    }
  }

  Future<void> saveCaloriesDinner (double caloriesDinner) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final today = DateTime.now();

      if(user != null) {
        String userId = user.uid;
        final databasePath = 'health/$userId/calories_consumed/${today.year}-${today.month}-${today.day}/dinner';

        final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

        try {

          await databaseReference.child(databasePath).set(caloriesDinner);

        } catch (error) {
          debugPrint("Error saving to firebase : $error");
        }
      }

    } catch (error) {
      debugPrint("Error Found : $error");
    }
  }

  Future<void> saveCaloriesSnacks (double caloriesSnacks) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final today = DateTime.now();

      if(user != null) {
        String userId = user.uid;
        final databasePath = 'health/$userId/calories_consumed/${today.year}-${today.month}-${today.day}/snacks';

        final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

        try {

          await databaseReference.child(databasePath).set(caloriesSnacks);

        } catch (error) {
          debugPrint("Error saving to firebase : $error");
        }
      }

    } catch (error) {
      debugPrint("Error Found : $error");
    }
  }

  Future<void> saveWeightsGoals (double initialWeight, double weightGoals, String earnLost) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if(user != null) {
        String userId = user.uid;
        final databasePath = 'health/$userId/health_goal/weights_goal/';

        final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

        try {

          await databaseReference.child(databasePath).set({
            'inital_weight': initialWeight.toString(), 
            'weight_goals': weightGoals.toString(),
            'goals_type': earnLost
          });

        } catch (error) {
          debugPrint("Error saving to firebase : $error");
        }
      }
    } catch (error) {
      debugPrint("Error Found : $error");
    }
  }

  Future<void> fetchBodyMeasurements() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;

      final DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref();

      DataSnapshot dataSnapshot = (await databaseReference.child('health').child(userId).child('body_measurements').once()).snapshot;

      Map<Object?, Object?>? data = dataSnapshot.value as Map<Object?, Object?>?;



      if (data != null) {
        
        if(mounted) {
          setState(() {
            currentWeight = double.parse(data['weight'].toString());
            currentHeights = double.parse(data['height'].toString());
            userBirthday = data['birthday'].toString();
            userGender = data['gender'].toString();
          });
        }
        
      } else {
        debugPrint("Error Fetching Data");
      }
    } else {
      debugPrint("User isn't Logged In");
    }
  }

  Future<void> fetchWeightGoals() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;      

      if(user != null) {
        String userId = user.uid;
        final databasePath = 'health/$userId/health_goal/weights_goal/';

        final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
        DataSnapshot dataSnapshot = await databaseReference.child(databasePath).get();

        if (dataSnapshot.exists) {
          Map<dynamic, dynamic> values = dataSnapshot.value as Map<dynamic, dynamic>;
          double initialWeights = double.tryParse(values['inital_weight'].toString()) ?? 0.0;
          double weightGoalss = double.tryParse(values['weight_goals'].toString()) ?? 0.0;
          String goalsType = values['goals_type'].toString();

          initialWeight = "${initialWeights.toStringAsFixed(2)} KG";
          targetedWeight = "${weightGoalss.toStringAsFixed(2)} KG";

          if(goalsType == "Loss") {
            if(mounted) {
              setState(() {
                gainLost = true;
              });
            }        
          } else {
            if(mounted) {
              setState(() {
                gainLost = false;
              });
            }
          }
          calculateTotalProgress(initialWeights, currentWeight);
        }
      }
    } catch (error) {
      debugPrint("Error Encountered when fetching goals: $error");
    }
  }

  Future<void> fetchActiveCaloriesBurn() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final today = DateTime.now();

      if (user != null) {
        String userId = user.uid;
        final databasePath = 'health/$userId/calories/${today.year}-${today.month}-${today.day}/';

        final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

        DataSnapshot dataSnapshot = (await databaseReference.child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          Map<Object?, Object?>? data = dataSnapshot.value as Map<Object?, Object?>?;
          int sum = data?.values.whereType<int>().fold<int>(0, (int acc, int value) => acc + value) ?? 0;

          activeCaloriesBurn = double.parse(sum.toString());

          debugPrint("Your Active Calories Burn : $activeCaloriesBurn");
        }
      }
    } catch (error) {
      debugPrint("Error found : $error");
    }
  }

  Future<void> fetchCaloriesConsumed() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final today = DateTime.now();

      if (user != null) {
        String userId = user.uid;
        final databasePath = 'health/$userId/calories_consumed/${today.year}-${today.month}-${today.day}/';

        final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

        DataSnapshot dataSnapshot = (await databaseReference.child(databasePath).once()).snapshot;

        if (dataSnapshot.value != null) {
          Map<Object?, Object?>? data = dataSnapshot.value as Map<Object?, Object?>?;
          double sum = data?.values.whereType<double>().fold<double>(0, (double acc, double value) => acc + value) ?? 0;

          totalCaloriesConsumed = sum.toString();

          debugPrint("Your Calories Consumed : $totalCaloriesConsumed");
        }
      }
    } catch (error) {
      debugPrint("Error found : $error");
    }
  }

  Future<void> calculateCaloriesStatus () async {

    double sum = 0.0;

    try {
      sum = (double.parse(totalCaloriesBurn) - double.parse(totalCaloriesConsumed));

      if (sum < 0) {
        isDeficit = true;
      } else {
        isDeficit = false;
      }

      if (mounted) {
        setState(() {
          caloriesDeficitSurplus = sum.toString();
        });
      }
    } catch (error) {
      debugPrint("Error parsing: $error");
    }
  }

  Future<void> calculateAge () async {
      try {
      DateTime now = DateTime.now();
      DateTime birthday = DateTime.parse(userBirthday);

      int age = now.year - birthday.year;

       if (now.month < birthday.month ||
          (now.month == birthday.month &&
              now.day < birthday.day)) {
        age--;
      }

      userAge = age;
      debugPrint("Your age is : $userAge");
      } catch (error) {
        debugPrint('$error');
      }
  }

  Future<void> calculateBMI () async {

    double heightInM = currentHeights / 100.0;
    double userBMI = currentWeight / (heightInM * heightInM);

    debugPrint("$userBMI");

    if(mounted) {
      setState(() {
        currentBMI = userBMI.toStringAsFixed(2);
      });
      if (userBMI < 18.5) {
        setState(() {
          statusText = "UNDERWEIGHT";
        });
        
      } else if (userBMI < 25) {
        setState(() {
          statusText = "HEALTHY";
        });
        
      } else if (userBMI < 30) {
        setState(() {
          statusText = "OVERWEIGHT";
        });
        
      } else if (userBMI < 40) {
        setState(() {
          statusText = "OBESITY";
        });
        
      }
    } 
  }

  Future<void> calculateBMR () async {
    try {
      if(userGender == "Male") {

        userBMR = 88.362 + (13.397 * currentWeight) + (4.799 * currentHeights) - (5.677 * userAge);

        debugPrint("Your BMR is : $userBMR");

      } else if(userGender == "Female") {

        userBMR = 447.593 + (9.247 * currentWeight) + (3.098 * currentHeights) - (4.330* userAge);

        debugPrint("Your BMR is : $userBMR");

      }
    } catch (error) {
      debugPrint("$error");
    }
  }

  Future<void> calculateTotalCaloriesBurn () async {
    if(mounted) {
      setState(() {
        totalCaloriesBurn = (activeCaloriesBurn + userBMR).toStringAsFixed(2);
      });
    } 

    debugPrint("Total calories: $totalCaloriesBurn");
  }

  Future<void> calculateTotalProgress (double initialweightss, double currentweightss) async {
    try{
      if(gainLost == true) {
        totalLostGain = "${(initialweightss - currentweightss).toStringAsFixed(2)} KG";
      } else {
        totalLostGain = "${(currentweightss - initialweightss).toStringAsFixed(2)} KG";
      }
    } catch (error) {
      debugPrint ("Error Encountered: $error");
    }
  }

  Future<void> fetchData () async {

    await fetchBodyMeasurements();
    await fetchActiveCaloriesBurn();
    await fetchCaloriesConsumed();
    await fetchWeightGoals();

  }

  Future<void> calculateData () async {

    await calculateAge();
    await calculateBMI();
    await calculateBMR();
    await calculateTotalCaloriesBurn();

    await calculateCaloriesStatus();

  }

  Future<void> dataInitialization () async {

    await fetchData();

    await calculateData();

  }

    void addWeightRecord(BuildContext context, double screenHeight, double screenWidth) {

    TextEditingController currentWeightController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Create Your Goals",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        content: Container(
          height: 100 * screenHeight / 375, // Adjust the height as needed
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              TextField(
                controller: currentWeightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Current Weight',
                ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: 225 * screenWidth / 375,
            child: TextButton(
              onPressed: () {
                String initialWeightText = weightController.text;
                String weightGoalsText = calorieController.text;

                double initialWeight = double.tryParse(initialWeightText) ?? 0.0;
                double weightGoals = double.tryParse(weightGoalsText) ?? 0.0;

                saveWeightsGoals(initialWeight, weightGoals, selectedGoal);

                Navigator.pop(context);
              },
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showGoalsAlertDialog(BuildContext context, double screenHeight, double screenWidth) {
    // Define controllers for text fields
    TextEditingController weightController = TextEditingController();
    TextEditingController calorieController = TextEditingController();

    // Define a variable to store the selected goal
    String selectedGoal = 'Gain';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Create Your Goals",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        content: Container(
          height: 100 * screenHeight / 375, // Adjust the height as needed
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return DropdownButton<String>(
                    value: selectedGoal,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGoal = newValue!;
                      });
                    },
                    items: <String>['Gain', 'Loss'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                },
              ),

              // Text field for weight
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Initial Weight',
                ),
              ),

              // Text field for calorie
              TextField(
                controller: calorieController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Target Weight',
                ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: 225 * screenWidth / 375,
            child: TextButton(
              onPressed: () {
                String initialWeightText = weightController.text;
                String weightGoalsText = calorieController.text;

                double initialWeight = double.tryParse(initialWeightText) ?? 0.0;
                double weightGoals = double.tryParse(weightGoalsText) ?? 0.0;

                saveWeightsGoals(initialWeight, weightGoals, selectedGoal);

                Navigator.pop(context);
              },
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showBreakfastAlertDialog(BuildContext context, double screenHeight, double screenWidth) {
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: const Text(
          "Breakfast", 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        content: SizedBox(
          height: 45 * screenHeight / 375,
          child: Column(
            children: [
              TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  if(mounted) {
                    setState(() {
                      caloriesBreakfast = double.tryParse(value) ?? 0.0;
                    });
                  }               
                },
                decoration: const InputDecoration(labelText: 'Enter Calories'),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: 225 * screenWidth / 375,
            child: TextButton(
              onPressed: () {
                debugPrint('Snacks Calories: $caloriesBreakfast');
                saveCaloriesBreakfast(caloriesBreakfast);
                Navigator.pop(context);
              },
              child: const Text(
                "Save", 
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      )
    );
  }

  void showLunchAlertDialog(BuildContext context, double screenHeight, double screenWidth) {
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: const Text(
          "Lunch", 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        content: SizedBox(
          height: 45 * screenHeight / 375,
          child: Column(
            children: [
              TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  if(mounted) {
                    setState(() {
                      caloriesLunch = double.tryParse(value) ?? 0.0;
                    });
                  }               
                },
                decoration: const InputDecoration(labelText: 'Enter Calories'),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: 225 * screenWidth / 375,
            child: TextButton(
              onPressed: () {
                debugPrint('Snacks Calories: $caloriesLunch');
                saveCaloriesLunch(caloriesLunch);
                Navigator.pop(context);
              },
              child: const Text(
                "Save", 
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
  
  void showDinnerAlertDialog(BuildContext context, double screenHeight, double screenWidth) {
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: const Text(
          "Dinner", 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        content: SizedBox(
          height: 45 * screenHeight / 375,
          child: Column(
            children: [
              TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  if(mounted) {
                    setState(() {
                      caloriesDinner = double.tryParse(value) ?? 0.0;
                    });
                  }               
                },
                decoration: const InputDecoration(labelText: 'Enter Calories'),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: 225 * screenWidth / 375,
            child: TextButton(
              onPressed: () {
                debugPrint('Snacks Calories: $caloriesDinner');
                saveCaloriesDinner(caloriesDinner);
                Navigator.pop(context);
              },
              child: const Text(
                "Save", 
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      )
    );
  }

  void showSnacksAlertDialog(BuildContext context, double screenHeight, double screenWidth) {
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: const Text(
          "Snacks", 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        content: SizedBox(
          height: 45 * screenHeight / 375,
          child: Column(
            children: [
              TextField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  if(mounted) {
                    setState(() {
                      caloriesSnacks = double.tryParse(value) ?? 0.0;
                    });
                  }               
                },
                decoration: const InputDecoration(labelText: 'Enter Calories'),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: 225 * screenWidth / 375,
            child: TextButton(
              onPressed: () {
                debugPrint('Snacks Calories: $caloriesSnacks');
                saveCaloriesSnacks(caloriesSnacks);
                Navigator.pop(context);
              },
              child: const Text(
                "Save", 
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      )
    );
  }

  @override
  void initState() {
    super.initState();

    dataInitialization();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        );
        return false;
      },
      child: Scaffold(
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

      body: NotificationListener<ScrollNotification>(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 0,
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
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 5 * screenHeight / 375,
                        child: AnimatedRadialGauge(
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
                      ),
                      Positioned(
                        top: 30 * screenHeight / 375,
                        child: Container(
                          width: 150 * screenWidth / 375,
                          height: 10 * screenHeight / 375,
                          color: Colors.transparent,
                          child: Text(
                            "BMI : $currentBMI",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Arial',
                            ),
                          )
                        )
                      ), 
                      Positioned(
                        top: 45 * screenHeight / 375,
                        child: Container(
                          width: 140 * screenWidth / 375,
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
                        top: 60 * screenHeight / 375,
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
                              showGoalsAlertDialog(context, screenHeight, screenWidth);
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
                      ),
                      Positioned(
                        top: 110 * screenHeight / 375,
                        child: Row(
                          children: [
                            Container(
                              width: 85 * screenWidth / 375, 
                              height: 50 * screenHeight / 375,
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(
                                  width: 1.0, 
                                  color: Colors.black
                                ) )
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "Inital Weight", 
                                    style: TextStyle(
                                      fontFamily: 'Arial', 
                                      fontSize: 12
                                    ),
                                  ),
                                  SizedBox(height: 2 * screenHeight / 375,),
                                  Text(
                                    initialWeight
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 85 * screenWidth / 375, 
                              height: 50 * screenHeight / 375,
                              decoration: const BoxDecoration(
                                border: Border(right: BorderSide(
                                  width: 1.0, 
                                  color: Colors.black
                                ) )
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    gainLost ? "Total Lost" : "Total Gain",
                                    style: const TextStyle(
                                      fontFamily: 'Arial', 
                                      fontSize: 12
                                    ),
                                  ),
                                  SizedBox(height: 2 * screenHeight / 375,),
                                  Text(
                                    totalLostGain
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 85 * screenWidth / 375, 
                              height: 50 * screenHeight / 375,
                              child: Column(
                                children: [
                                  const Text(
                                    "Target Weight", 
                                    style: TextStyle(
                                      fontFamily: 'Arial', 
                                      fontSize: 12
                                    ),
                                  ),
                                  SizedBox(height: 2 * screenHeight / 375,),
                                  Text(
                                    targetedWeight
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
        
              SizedBox(height: 5 * screenHeight / 375),
        
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
                      const Row(
                        children: [
                          SizedBox(
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
                          Expanded(child: SizedBox()),
                          SizedBox(
                            child: Text(
                              "Stay Fit Plan", 
                              textAlign: TextAlign.start, 
                              style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontFamily: 'Arial',         
                                fontSize: 14
                              ),
                            )
                          ),
                          
                        ],
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
                              SizedBox(
                                child: Text(
                                  isDeficit ? "Deficit kcal" : "Surplus kcal",
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
                              showBreakfastAlertDialog(context, screenHeight, screenWidth);
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
                              showLunchAlertDialog(context, screenHeight, screenWidth);
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
                              showDinnerAlertDialog(context, screenHeight, screenWidth);
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
                              showSnacksAlertDialog(context, screenHeight, screenWidth);
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
        ),
      ))
    );
  }
}