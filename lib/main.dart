import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/UI/WelcomePage.dart';
// import 'package:myapp/UI/steps.dart';
// import 'package:myapp/UI/map.dart';
// import 'package:myapp/UI/notifications-bar.dart';
// import 'package:myapp/UI/calories.dart';
// import 'package:myapp/UI/sleep-tracker.dart';
// import 'package:myapp/UI/smartwatch.dart';
// import 'package:myapp/UI/sign-up.dart';
// import 'package:myapp/UI/log-in.dart';
// import 'package:myapp/UI/profile.dart';
// import 'package:myapp/UI/habit1.dart';
// import 'package:myapp/UI/habit2.dart';
// import 'package:myapp/UI/habit0.dart';
// import 'package:myapp/UI/account-setting.dart';
// import 'package:myapp/UI/blood-pressure.dart';
// import 'package:myapp/UI/real-homepage.dart';
// import 'package:myapp/UI/calendar.dart';
// import 'package:myapp/UI/heart-rate.dart';
// import 'package:myapp/UI/custom-habit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'Flutter',
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
		home: Scaffold(
		body: SingleChildScrollView(
			child: Scene(),
		),
		),
	);
	}
}
