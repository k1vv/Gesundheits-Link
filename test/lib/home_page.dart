import 'package:flutter/material.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(
          top: 70,
          left: 30,
          right: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Information",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Column()
                  ],
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.pink.shade50,
                      onPressed: () {
                        // Add your onPressed logic for the first button here
                      },
                      child: Icon(
                        Icons.calendar_month_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 20,
                    ), // Add some spacing between the buttons
                    FloatingActionButton(
                      backgroundColor: Colors.pink.shade50,
                      onPressed: () {
                        // Add your onPressed logic for the second button here
                      },
                      child: Icon(
                        Icons.notifications_none_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
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
