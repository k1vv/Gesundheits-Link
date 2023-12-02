import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:myapp/UI/Main/testing3.dart';

class JoinPoolScreen extends StatefulWidget {
  const JoinPoolScreen({Key? key}) : super(key: key);

  @override
  State<JoinPoolScreen> createState() => _JoinPoolScreenState();
}

class _JoinPoolScreenState extends State<JoinPoolScreen> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference();
  late List<String> poolList = [];

  @override
  void initState() {
    super.initState();
    fetchAvailablePools();
  }

  Future<void> fetchAvailablePools() async {
    // Define the path to the pools in the database
    String poolsPath = 'pools';

    // Fetch the list of pools
    DatabaseEvent poolsEvent =
        await _databaseReference.child(poolsPath).once();
    DataSnapshot poolsSnapshot = poolsEvent.snapshot;
    Map<dynamic, dynamic>? poolsData =
        poolsSnapshot.value as Map<dynamic, dynamic>?;

    if (poolsData != null) {
      // Update the poolList with the available pool IDs
      setState(() {
        poolList = poolsData.keys.cast<String>().toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join a Pool'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (poolList.isEmpty)
              Text('No pools available. Create a new pool or try again later.')
            else
              ListView.builder(
                shrinkWrap: true,
                itemCount: poolList.length,
                itemBuilder: (context, index) {
                  String poolId = poolList[index];
                  return ListTile(
                    title: Text('Pool $poolId'),
                    onTap: () async {
                      await joinPool(poolId);
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> joinPool(String poolId) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Define the path to the pool in the database
      String poolPath = 'pools/$poolId/users';

      // Check if the pool has less than 3 users
      DatabaseEvent poolEvent =
          await _databaseReference.child(poolPath).once();
      DataSnapshot poolSnapshot = poolEvent.snapshot;
      Map<dynamic, dynamic>? poolData =
          poolSnapshot.value as Map<dynamic, dynamic>?;

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
