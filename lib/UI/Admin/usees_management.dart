import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  late DatabaseReference _databaseReference;
  late Future<List<Map<String, String>>> _userDetails;
  String userSleepTotal = '';
  String userStepsToday = '';
  String userHearRateToday = '';
  String userBloodOxygenToday = '';

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.ref().child('users');
    _userDetails = _fetchUserDetails();
  }

  Future<List<Map<String, String>>> _fetchUserDetails() async {
    try {
      DatabaseEvent event = await _databaseReference.once();
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        Map<dynamic, dynamic> usersMap = (snapshot.value as Map<dynamic, dynamic>);

        List<Map<String, String>> userDetails = [];
        usersMap.forEach((key, value) async {

          // Exclude the user with the specified user ID
          if (key != "q38Pju8MufZvgKSF2AqyJYZYGqF2") {
            userSleepData(key);
             userStepsData(key);
             userHeartRateData(key);
            await userBloodOxygen(key);

            userDetails.add({
              'userId': key, // Include the UID in the details
              'username': value['username'],
              'email': value['email'],
              'sleepToday': userSleepTotal,
              'steps': userStepsToday,
              'heartRate': userHearRateToday,
              'bloodOxygen': userBloodOxygenToday 
            });
          }
        });
        return userDetails;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception('Error fetching user details: $error');
    }
  }

  Future<void> userStepsData(String userId) async {
    final today = DateTime.now();

    String databasePath = 'health/$userId/steps/${today.year}-${today.month}-${today.day}/${today.hour}/';
    DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
    if (dataSnapshot.value != null) {
      setState(() {
        userStepsToday = (dataSnapshot.value as int).toString();
      });
      
    } else {
      setState(() {
        userStepsToday = "N/A";
      });
      
    }
  }

  Future<void> userSleepData(String userId) async {
    final today = DateTime.now();

    String databasePath = 'health/$userId/sleep_session/${today.year}-${today.month}-${today.day}/total';
    DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
    if (dataSnapshot.value != null) {
      setState(() {
        userSleepTotal = "${dataSnapshot.value as int} minutes";
      });
    } else {
      setState(() {
        userSleepTotal = "N/A";
      });
    }
  }

  Future<void> userHeartRateData(String userId) async {
    final today = DateTime.now();

    String databasePath = 'health/$userId/heart_rate/${today.year}-${today.month}-${today.day}/${today.hour}';
    DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
    if (dataSnapshot.value != null) {
      setState(() {
        userHearRateToday = "${dataSnapshot.value as int} bpm";
      });
    } else {
      setState(() {
        userHearRateToday = "N/A";
      });
    }
  }

  Future<void> userBloodOxygen(String userId) async {
    final today = DateTime.now();

    String databasePath = 'health/$userId/blood_oxygen/${today.year}-${today.month}-${today.day}/${today.hour}';
    DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.ref().child(databasePath).once()).snapshot;
    if (dataSnapshot.value != null) {
      setState(() {
        userBloodOxygenToday = "${dataSnapshot.value as int}%";
      });
    } else {
      setState(() {
        userBloodOxygenToday = "N/A";
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: _userDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, String>> userDetails = snapshot.data ?? [];

            return ListView.builder(
              itemCount: userDetails.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('Username: ${userDetails[index]['username']}'),
                  subtitle: Text(
                    'Email: ${userDetails[index]['email']} \n Sleep Today: ${userDetails[index]['sleepToday']} \n Steps Today: ${userDetails[index]['steps']} \n Heart Rate Today: ${userDetails[index]['heartRate']} \n Blood Oxygen Today: ${userDetails[index]['bloodOxygen']}'
                    ),
                );
              },
            );
          }
        },
      ),
    );
  }
}