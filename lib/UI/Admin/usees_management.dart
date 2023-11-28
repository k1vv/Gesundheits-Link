import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  late DatabaseReference _databaseReference;
  late Future<List<Map<String, String>>> _userDetails;
  bool _isLoading = false; 
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
          if (value['email'] != "mazim.razmi@student.gmi.edu.my") {
            userSleepData(key);
            userStepsData(key);
            userHeartRateData(key);
            await userBloodOxygen(key);

            userDetails.add({
              'userId': key, 
              'username': value['username'] ?? 'N/A', // Use 'N/A' if 'username' is null
              'email': value['email'] ?? 'N/A', 
              'password': value['password'] ?? 'N/A', 
              'sleepToday': userSleepTotal ,
              'steps': userStepsToday,
              'heartRate': userHearRateToday,
              'bloodOxygen': userBloodOxygenToday,
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

  Future<void> _deleteUser(String userId, String email, String password) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: const Text('Are you sure you want to delete this user?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Set loading state to true
                setState(() {
                  _isLoading = true;
                });

                // Delete user from Firebase Realtime Database
                await _databaseReference.child(userId).remove();
                await deleteUserById(userId, email, password);
            
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop(); // Close the dialog

                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (BuildContext context) => const UserManagement()),
                );
                setState(() {
                  _userDetails = _fetchUserDetails();
                });

                // Set loading state to false after data is loaded
                setState(() {
                  _isLoading = false;
                });
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

Future<void> deleteUserById(String userId, String email, String password) async {
  String adminemail = "mazim.razmi@student.gmi.edu.my";
  String adminpassword = "Akramz5461";
  String adminid = "xhtAad07b9TI1eszEGSegP3BTrx1";

  try {
    await FirebaseAuth.instance.signOut(); // Sign out any existing user

    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.delete();
      await FirebaseAuth.instance.signOut(); // Sign out the deleted user

      // Sign in with admin credentials
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: adminemail, password: adminpassword);
    }
  } catch (e) {
    print("Error deleting user: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Display CircularProgressIndicator while loading
          : FutureBuilder<List<Map<String, String>>>(
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
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                  child: ListTile(
                    leading: GestureDetector(
                      onLongPress: () {
                        _deleteUser(userDetails[index]['userId']!, userDetails[index]['email']!, userDetails[index]['password']!);
                      },
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.pink,
                            width: 2.0,
                          ),
                        ),
                        child: const Center(
                          child: Icon(Icons.person, color: Colors.pink),
                        ),
                      ),
                    ),
                    title: Text('Username: ${userDetails[index]['username']}'),
                    subtitle: Text(
                      'Email: ${userDetails[index]['email']} \n'
                      'Sleep Today: ${userDetails[index]['sleepToday']} \n'
                      'Steps Today: ${userDetails[index]['steps']} \n'
                      'Heart Rate Today: ${userDetails[index]['heartRate']} \n'
                      'Blood Oxygen Today: ${userDetails[index]['bloodOxygen']}',
                    ),
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