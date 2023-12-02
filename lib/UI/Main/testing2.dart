import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:myapp/UI/Main/testing3.dart';

class NewScreen2 extends StatefulWidget {
  const NewScreen2({Key? key}) : super(key: key);

  @override
  State<NewScreen2> createState() => _NewScreen2State();
}

class _NewScreen2State extends State<NewScreen2> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await createNewPool();
              },
              child: Text("Confirm"),
            )
          ],
        ),
      ),
    );
  }

Future<void> createNewPool() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Generate a unique pool ID (you can use a different approach if needed)
    String poolId = DateTime.now().millisecondsSinceEpoch.toString();

    // Define the path to the pool in the database
    String poolPath = 'pools/$poolId/users';

    // Check if the pool already exists and has less than 3 users
    DatabaseEvent poolEvent =
        await _databaseReference.child(poolPath).once();
    DataSnapshot poolSnapshot = poolEvent.snapshot;
    Map<dynamic, dynamic>? poolData = poolSnapshot.value as Map<dynamic, dynamic>?;

    if (poolData == null || poolData.length < 3) {
      // Set the user ID in the pool
      await _databaseReference.child(poolPath).child(user.uid).set(true);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NewScreen3()),
      );
    } else {
      // Pool has reached the maximum number of users
      // You can display a message or handle it as needed
      print("Cannot join the pool. Maximum number of users reached.");
    }
  }
}

}
