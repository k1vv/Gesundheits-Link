// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:myapp/UI/Health/weight_management.dart';

class BodyMeasurementsPage extends StatefulWidget {
  const BodyMeasurementsPage({Key? key}) : super(key: key);

  @override
  _BodyMeasurementsPageState createState() => _BodyMeasurementsPageState();
}

class _BodyMeasurementsPageState extends State<BodyMeasurementsPage> {
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Measurements'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _birthdayController,
              decoration: const InputDecoration(labelText: 'Birthday'),
              onTap: () async {
                // Use await to get the result of showDatePicker
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                // Check if a date was selected before updating the UI
                if (pickedDate != null) {
                  // Format the picked date as needed
                  String formattedDate =
                      "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";

                  // Update the controller and UI
                  setState(() {
                    _birthdayController.text = formattedDate;
                  });
                }
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Height (cm)'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedGender,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue!;
                });
              },
              items: <String>['Male', 'Female']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text('Select Gender'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                saveBodyMeasurements();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeightManagementPage()
                  )
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void saveBodyMeasurements() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;

      final DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref();

      await databaseReference.child('health').child(userId).child('body_measurements').set({
        'birthday': _birthdayController.text,
        'height': _heightController.text,
        'weight': _weightController.text,
        'gender': _selectedGender,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Body measurements saved successfully!'),
        ),
      );
    }
  }
}
