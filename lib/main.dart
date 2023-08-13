import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/home.dart';
// import 'package:myapp/page-1/steps.dart';
// import 'package:myapp/page-1/map.dart';
// import 'package:myapp/page-1/notifications-bar.dart';
// import 'package:myapp/page-1/calories.dart';
// import 'package:myapp/page-1/sleep-tracker.dart';
// import 'package:myapp/page-1/smartwatch.dart';
// import 'package:myapp/page-1/sign-up.dart';
// import 'package:myapp/page-1/log-in.dart';
// import 'package:myapp/page-1/profile.dart';
// import 'package:myapp/page-1/habit1.dart';
// import 'package:myapp/page-1/habit2.dart';
// import 'package:myapp/page-1/habit0.dart';
// import 'package:myapp/page-1/account-setting.dart';
// import 'package:myapp/page-1/blood-pressure.dart';
// import 'package:myapp/page-1/real-homepage.dart';
// import 'package:myapp/page-1/calendar.dart';
// import 'package:myapp/page-1/heart-rate.dart';
// import 'package:myapp/page-1/custom-habit.dart';

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
