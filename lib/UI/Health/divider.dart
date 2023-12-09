// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:myapp/UI/Health/bodymeasurements_page.dart';
import 'package:myapp/UI/Health/weight_management.dart';


class DividePage extends StatefulWidget {
  const DividePage({Key? key}) : super(key: key);

  @override
  State<DividePage> createState() => _DividePageState();
}

class _DividePageState extends State<DividePage> {

  @override
  void initState() {
    super.initState();

    checkBodyMeasurementsData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> checkBodyMeasurementsData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;

      final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

      DataSnapshot dataSnapshot = (await databaseReference
          .child('health')
          .child(userId)
          .child('body_measurements')
          .once()).snapshot;

      if (dataSnapshot.value != null) {
        // Body measurements data exists
        Map<dynamic, dynamic> measurementsData =
            dataSnapshot.value as Map<dynamic, dynamic>;

        // Check if any field is empty
        if (measurementsData['birthday'] == null ||
            measurementsData['height'] == null ||
            measurementsData['weight'] == null ||
            measurementsData['gender'] == null) {
          // Navigate to BodyMeasurementsPage if any field is empty
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BodyMeasurementsPage(),
            ),
          );
        } else {
          // Fields are not empty, navigate to somewhere else
          // You can replace 'SomewhereElsePage' with the actual destination page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WeightManagementPage(),
            ),
          );
        }
      } else {
        // Body measurements data does not exist, navigate to BodyMeasurementsPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BodyMeasurementsPage(),
          ),
        );
      }
    }
  }
}
