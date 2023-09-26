import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/UI/steps_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  void _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final int currentDayNum = selectedDate.day;
    final String currentDayDay = DateFormat('EEEE').format(selectedDate);
    final String currentYear = DateTime.now().year.toString();
    final String currentMonth = DateFormat('MMMM').format(selectedDate);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        // Wrap the content with SingleChildScrollView
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 40,
                left: 30,
                right: 10,
                bottom: 5,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        elevation: 0,
                        heroTag: 'btn1',
                        backgroundColor:
                            const Color.fromARGB(255, 255, 241, 245),
                        onPressed: _showDatePicker,
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.calendar_month_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 20,
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        heroTag: 'btn2',
                        backgroundColor:
                            const Color.fromARGB(255, 255, 241, 245),
                        onPressed: () {},
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 290,
              child: Text(
                "$currentDayNum, $currentDayDay's Information",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: 286,
              child: Text(
                '$currentMonth, $currentYear',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 145,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const StepsPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: Color.fromARGB(50, 158, 158, 158),
                                ),
                              ),
                            ),
                            child: const Row(
                              children: [
                                SizedBox(width: 0, height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          'Calories',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 35),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/flame.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40),
                                    Text(
                                      '620.68',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'kcal',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 145,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: Color.fromARGB(50, 158, 158, 158),
                                ),
                              ),
                            ),
                            child: const Row(
                              children: [
                                SizedBox(width: 0, height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          'Steps',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 48),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/icon-Z93.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40),
                                    Text(
                                      '1 240',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Steps',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 145,
                      height: 310,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(50, 158, 158, 158),
                            ),
                          ),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 0, height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text(
                                      'Heart',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 48),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/heartrate.png'),
                                      width: 20,
                                      height: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 200),
                                Text(
                                  '74',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'bpm',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 146,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: Color.fromARGB(50, 158, 158, 158),
                                ),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          'Blood Pressure',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/pressure.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40),
                                    Text(
                                      '120/80',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'mmHg',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 145,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: Color.fromARGB(50, 158, 158, 158),
                                ),
                              ),
                            ),
                            child: const Row(
                              children: [
                                SizedBox(width: 0, height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          'Sleep Tracker',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/star.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 42),
                                    Text(
                                      '4 hours',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'deep sleep',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
