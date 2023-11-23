// ignore_for_file: avoid_unnecessary_containers
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/UI/Habits/habit_model.dart';
import 'package:myapp/UI/Habits/habit_provider.dart';
import 'package:myapp/UI/Habits/sethabits_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class CustomHabits extends StatefulWidget {
  const CustomHabits({super.key});

  @override
  State<CustomHabits> createState() => _CustomHabitsState();
}

class _CustomHabitsState extends State<CustomHabits> {

  late TextEditingController _nameTextController = TextEditingController();
  late TextEditingController _descriptionTextController = TextEditingController();
  String name = '';
  String description = '';
  String options = 'Daily  >';
  Color buttonColor1 = const Color.fromARGB(255, 255, 241, 245);
  Color buttonColor2 = const Color.fromARGB(255, 226, 226, 226);
  Color buttonColor3 = const Color.fromARGB(255, 226, 226, 226);
  Color buttonColor4 = const Color.fromARGB(255, 226, 226, 226);
  FontWeight fontWeight1 = FontWeight.normal;
  FontWeight fontWeight2 = FontWeight.normal;
  FontWeight fontWeight3 = FontWeight.normal;
  FontWeight fontWeight4 = FontWeight.normal;
  Color textColor = Colors.black;
  bool isColorChanged = false;
  DateTime startDateTime = DateTime.now();
  String startDate = "";
  DateTime endDateTime = DateTime.now();
  String endDate = "";
  Color selectedColor = const Color.fromARGB(255, 78, 255, 196);
  IconData selectedIcon = Icons.add;
  String timeRange = "Anytime";
  List<String> previousTags = ["test", "test2", "test3"];
  String selectedTag = '';
  List<Widget> selectedTagWidgets = [];
  
  Future<void> createSaveHabit() async {
    User? user = FirebaseAuth.instance.currentUser;
    String habitName = _nameTextController.text;
    String habitDescription = _descriptionTextController.text;

    if (user != null) {
      String userId = user.uid;
      final databaseReference = FirebaseDatabase.instance.ref();
      final databasePath = 'Habits/$userId/';

      if (habitName.isNotEmpty) {
        // Generate a custom habit ID
        String customHabitId = await generateCustomHabitId(databaseReference.child(databasePath));

          Habit newHabit = Habit(
            id: customHabitId,
            name: habitName,
            description: habitDescription,
            habitIcon: selectedIcon,
            iconColor: selectedColor,
            timeRange: timeRange,
            frequency: options,
            startTime: startDate,
            startHabitTime: startDateTime,
            endTime: endDateTime,
            endHabitTime: endDate,
            isStarred: false                            
          );

        // ignore: use_build_context_synchronously
        HabitProvider habitProvider = Provider.of<HabitProvider>(context, listen: false);
        habitProvider.addHabit(newHabit);

        databaseReference.child(databasePath).child(customHabitId).set({
          "id": newHabit.id,
          "name": newHabit.name,
          "description": newHabit.description,
          "isStarred": newHabit.isStarred,
          "habitIcon": newHabit.habitIcon.toString(),
          "iconColor": newHabit.iconColor.value,
          "timeRange": newHabit.timeRange,
          "frequency": newHabit.frequency,
          "startTime": newHabit.startTime,
          "startTimeDate": newHabit.startHabitTime.toIso8601String(),
          "endTime": newHabit.endTime.toIso8601String(),
          "endHabitTime": newHabit.endHabitTime,
        });

        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage(initialIndex: 1,)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a habit name.')));
      }
    } else {
      debugPrint("Error saving habits to firebase");
    }
  }

  Future<String> generateCustomHabitId(DatabaseReference reference) async {
    String baseId = 'HB';
    int counter = 1;
    String customHabitId = '$baseId${counter.toString().padLeft(3, '0')}';

    while (await checkIfIdExists(reference, customHabitId)) {
      counter++;
      customHabitId = '$baseId${counter.toString().padLeft(3, '0')}';
    }
    return customHabitId;
  }

  Future<bool> checkIfIdExists(DatabaseReference reference, String habitId) async {
    DatabaseEvent event = await reference.child(habitId).once();
    DataSnapshot snapshot = event.snapshot;
    return snapshot.value != null;
  }
  
  _openIconPicker() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
      context,
      iconPackModes: [IconPack.cupertino, IconPack.lineAwesomeIcons, IconPack.fontAwesomeIcons, IconPack.material],
    );

    if (icon != null) {
      setState(() {
        selectedIcon = icon;
      });
    }
  }

  void openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void changeColor(int buttonNumber) {
    setState(() {
      buttonColor1 = const Color.fromARGB(255, 226, 226, 226);
      buttonColor2 = const Color.fromARGB(255, 226, 226, 226);
      buttonColor3 = const Color.fromARGB(255, 226, 226, 226);
      buttonColor4 = const Color.fromARGB(255, 226, 226, 226);

      fontWeight1 = FontWeight.normal;
      fontWeight2 = FontWeight.normal;
      fontWeight3 = FontWeight.normal;
      fontWeight4 = FontWeight.normal;

      switch (buttonNumber) {
        case 1:
          buttonColor1 = const Color.fromARGB(255, 255, 241, 245);
          fontWeight1 = FontWeight.bold;
          break;
        case 2:
          buttonColor2 = const Color.fromARGB(255, 255, 241, 245);
          fontWeight2 = FontWeight.bold;
          break;
        case 3:
          buttonColor3 = const Color.fromARGB(255, 255, 241, 245);
          fontWeight3 = FontWeight.bold;
          break;
        case 4:
          buttonColor4 = const Color.fromARGB(255, 255, 241, 245);
          fontWeight4 = FontWeight.bold;
          break;
        default:
          break;
      }
    });
  }

  void showTagDialog() {
    TextEditingController tagController = TextEditingController();
    tagController.text = selectedTag;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose or enter your tag'),
          content: Column(
            children: [
              TextFormField(
                controller: tagController,
                decoration: const InputDecoration(labelText: 'Enter your tag'),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedTag,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTag = newValue!;
                  });
                },
                items: previousTags.map((String tag) {
                  return DropdownMenuItem<String>(
                    value: tag, // Make sure each value is unique
                    child: Text(tag),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Choose tag'),
              ),
              const SizedBox(height: 20),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Add the new tag to the list if it's not already present
                String newTag = tagController.text.trim();
                if (newTag.isNotEmpty && !previousTags.contains(newTag)) {
                  setState(() {
                    previousTags.add(newTag);
                    selectedTag = newTag;
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() { 
    super.initState();
    selectedTag = previousTags.isNotEmpty ? previousTags[0] : '';
    timeRange = "Anytime";
    selectedColor = const Color.fromARGB(255, 78, 255, 196);
    startDate = DateFormat('dd-MM-yyyy').format(startDateTime);
    endDate = "No End";
    _nameTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameTextController.dispose();
    _descriptionTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
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
                              builder: (context) => const SetHabits()));
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
                'Set Your Habits',
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
      body: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
              width: 40 * screenWidth / 375,
            ),
            Column(children: [
              SizedBox(
                height: 10 * screenHeight / 375,
              ),
              SizedBox(
                width: 300 * screenWidth / 375,
                child: const Text(
                  'Name',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                  width: 300 * screenWidth / 375,
                  height: 35 * screenHeight / 375,
                  child: TextField(
                    controller: _nameTextController,
                    decoration: const InputDecoration(
                      hintText: 'Habit Name',
                    ),
                    style: const TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                    ),
                    onSubmitted: (String value) {
                      setState(() {
                        name = _nameTextController.text;
                      });
                    },
                  )),
              SizedBox(
                width: 300 * screenWidth / 375,
                child: const Text(
                  'Description',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 300 * screenWidth / 375,
                height: 40 * screenHeight / 375,
                child: TextField(
                  controller: _descriptionTextController,
                  decoration: const InputDecoration(
                    hintText: 'Habit Description',
                  ),
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14,
                  ),
                  onSubmitted: (String value) {
                    setState(() {
                      description = _descriptionTextController.text;
                    });
                  },
                )
              ),
              SizedBox(
                width: 300 * screenWidth / 375,
                child: const Text(
                  'Icon & Color',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 5 * screenHeight / 375,),
              SizedBox(
                width: 300 * screenWidth / 375,
                child: Row(
                  children: [
                    const Text(
                      "Icon", 
                      style: TextStyle(
                        fontSize: 14, 
                        fontFamily: 'Arial'
                      ),
                    ),
                    SizedBox(width: 5 * screenWidth / 375,),
                    Container(
                      width: 50 * screenWidth / 375,
                      height: 25 * screenWidth / 375,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), 
                        color: const Color.fromARGB(255, 235, 235, 235)
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _openIconPicker();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: Colors.transparent, 
                              backgroundColor: Colors.transparent, 
                              foregroundColor: Colors.transparent, 
                              surfaceTintColor: Colors.transparent, 
                              alignment: Alignment.center
                            ),
                            child: const Text("")
                          ),
                          GestureDetector(
                            onTap: () {
                              _openIconPicker();
                            },
                            child: Icon(
                              selectedIcon, 
                              color: selectedColor,                             
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20 * screenWidth / 375),
                    const Text(
                      "|", 
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                    SizedBox(width: 20 * screenWidth / 375),
                    const Text(
                      "Color", 
                      style: TextStyle(
                        fontSize: 14, 
                        fontFamily: 'Arial'
                      ),
                    ),
                    SizedBox(width: 5 * screenWidth / 375,),
                    SizedBox(
                      width: 50 * screenWidth / 375,
                      height: 25 * screenWidth / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          openColorPicker();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: selectedColor,
                          backgroundColor: selectedColor,
                          foregroundColor: selectedColor,
                          surfaceTintColor: selectedColor,
                        ),
                        child: const Text(""),
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 10 * screenHeight / 375,),
              SizedBox(
                width: 300 * screenWidth / 375,
                child: const Text(
                  "Tag",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 5 * screenHeight / 375,),
              Row(
                children: [
                  Container(
                    width: 50 * screenWidth / 375,
                    height: 25 * screenWidth / 375,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30), 
                      color: const Color.fromARGB(255, 235, 235, 235)                      
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showTagDialog();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shadowColor: Colors.transparent, 
                            backgroundColor: Colors.transparent, 
                            foregroundColor: Colors.transparent, 
                            surfaceTintColor: Colors.transparent, 
                            alignment: Alignment.center),
                            child: const Text("")
                          ),
                        GestureDetector(
                          onTap: () {
                            showTagDialog();
                          },
                          child: const Icon(
                            Icons.add, 
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                    SizedBox(width: 250 * screenWidth / 375,)
                ],
              ),              
              SizedBox(width: 10 * screenHeight / 375),
              Row(
                children: [
                  SizedBox(
                    width: 180 * screenWidth / 375,
                    child: const Text(
                      'Frequency',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 120 * screenWidth / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                // ignore: sized_box_for_whitespace
                                title: Container(
                                  width: double.infinity,
                                  child: const Text(
                                    "Choose an Option",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // ignore: sized_box_for_whitespace
                                    Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            options = 'Daily  >';
                                          });
                                          Navigator.pop(context, "Daily");
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent),
                                        child: const Text("Daily"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            options = 'Weekly  >';
                                          });
                                          Navigator.pop(context, "Weekly");
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent),
                                        child: const Text("Weekly"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            options = 'Monthly  >';
                                          });
                                          Navigator.pop(context, "Monthly");
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent),
                                        child: const Text("Monthly"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: Colors.transparent),
                        child: Text(
                          options,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Arial',
                            fontSize: 14,
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 5 * screenHeight / 375,
              ),
              SizedBox(
                width: 300 * screenWidth / 375,
                child: const Text(
                  'Time Range',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5 * screenHeight / 375,
              ),
              SizedBox(
                width: 295 * screenWidth / 375,
                height: 15 * screenHeight / 375,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      child: ElevatedButton(
                          onPressed: () {
                            changeColor(1);
                            setState(() {
                              timeRange = "Anytime";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            backgroundColor: buttonColor1,
                          ),
                          child: Text(
                            'Anytime',
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: fontWeight1,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 124, 124, 124)),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      child: ElevatedButton(
                          onPressed: () {
                            changeColor(2);
                            setState(() {
                              timeRange = "Morning";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            backgroundColor: buttonColor2,
                          ),
                          child: Text(
                            'Morning',
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: fontWeight2,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 124, 124, 124)),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      child: ElevatedButton(
                          onPressed: () {
                            changeColor(3);
                            setState(() {
                              timeRange = "Afternoon";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            backgroundColor: buttonColor3,
                          ),
                          child: Text(
                            'Afternoon',
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: fontWeight3,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 124, 124, 124)),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                              timeRange = "Evening";
                            });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          backgroundColor: buttonColor4,
                        ),
                        child: Text(
                          'Evening',
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: fontWeight4,
                                fontSize: 10,
                                color: const Color.fromARGB(255, 124, 124, 124)),
                        )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10 * screenHeight / 375,),
              SizedBox(
                width: 300 * screenWidth / 375,
                child: const Text(
                  "Habit Term",
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold
                  ), 
                ),
              ),
              SizedBox(height: 10 * screenHeight / 375,),
              Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Start", 
                        style: TextStyle(
                          fontSize: 12, 
                          fontFamily: 'Arial', 
                          color: Colors.grey
                        ),
                      ),
                      SizedBox(height: 3 * screenHeight / 375,),
                      SizedBox(
                        width: 116 * screenWidth / 375,
                        height: 15 * screenHeight / 375,
                        child: ElevatedButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context, 
                              builder: (BuildContext context) => SizedBox(
                                height: 125 * screenHeight / 375,
                                child: CupertinoDatePicker(
                                  backgroundColor: Colors.white,
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() {
                                      startDateTime = newTime;
                                      startDate = DateFormat('dd-MM-yyyy').format(startDateTime);
                                    });
                                  },
                                  use24hFormat: true, 
                                  mode: CupertinoDatePickerMode.date
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0, 
                            shadowColor: const Color.fromARGB(255, 211, 211, 211), 
                            backgroundColor: const Color.fromARGB(255, 211, 211, 211), 
                            foregroundColor: const Color.fromARGB(255, 211, 211, 211), 
                            surfaceTintColor: const Color.fromARGB(255, 211, 211, 211), 
                          ),                           
                          child: Text(
                            startDate,
                            style: const TextStyle(
                              fontSize: 12, 
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          )
                         ),
                      )
                    ],
                  ),
                  SizedBox(width: 4 * screenWidth / 375),
                  Column(
                    children: [
                      SizedBox(height: 12 * screenHeight / 375,),
                      Container(
                        width: 45 * screenWidth /375,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromARGB(255, 124, 124, 124)
                            )
                          )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 4 * screenWidth / 375),
                  Column(
                    children: [
                      const Text(
                        "End", 
                        style: TextStyle(
                          fontSize: 12, 
                          fontFamily: 'Arial', 
                          color: Colors.grey
                        ),
                      ),
                      SizedBox(height: 3 * screenHeight / 375,),
                      SizedBox(
                        width: 116 * screenWidth / 375,
                        height: 15 * screenHeight / 375,
                        child: ElevatedButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context, 
                              builder: (BuildContext context) => SizedBox(
                                height: 125 * screenHeight / 375,
                                child: CupertinoDatePicker(
                                  backgroundColor: Colors.white,
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() {
                                      endDateTime = newTime;
                                      endDate = DateFormat('dd-MM-yyyy').format(endDateTime);
                                    });
                                  },
                                  use24hFormat: true, 
                                  mode: CupertinoDatePickerMode.date
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0, 
                            shadowColor: const Color.fromARGB(255, 211, 211, 211), 
                            backgroundColor: const Color.fromARGB(255, 211, 211, 211), 
                            foregroundColor: const Color.fromARGB(255, 211, 211, 211), 
                            surfaceTintColor: const Color.fromARGB(255, 211, 211, 211), 
                          ),
                          child: Text(
                            endDate,
                            style: const TextStyle(
                              fontSize: 12, 
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          )
                         ),
                      )
                    ],
                  )
                ],
              ), 
              SizedBox(height: 20 * screenHeight / 375,), 
              SizedBox(
                width: 300 * screenWidth / 375,
                height: 20 * screenHeight / 375,
                child: ElevatedButton(
                  onPressed: () {
                    createSaveHabit();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 197, 216),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      fontFamily: 'Arial', 
                      fontSize: 20, 
                      color: Colors.white,
                    ), 
                    ),
                ),
              )          
            ]),
          ],
        ),
      ),
    );
  }
}
