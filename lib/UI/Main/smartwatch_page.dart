import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class WatchConnection extends StatefulWidget {
  const WatchConnection({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WatchConnectionState createState() => _WatchConnectionState();
}

class _WatchConnectionState extends State<WatchConnection> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  QRViewController? qrController;
  bool isScanning = false;
  String watchsIds = "";
  String watchid = "";
  String watchName = "";
  int watchBattery = 0;

  bool isWatchConnected = false;

  Future<String?> fetchDataFromFirebase() async {
    try {
      setState(() {
      isWatchConnected = true; // Set the connection status to true
    });
      // Get the current user from Firebase Auth
      User? user = FirebaseAuth.instance.currentUser;
  
      if (user != null) {
        // Reference to the users collection
        DatabaseReference usersRef =
            FirebaseDatabase.instance.ref().child('users');
  
        // Reference to the specific user's data
        DatabaseReference userDataRef = usersRef.child(user.uid).child('smartwatch');
  
        // Fetch the data
        DataSnapshot snapshot = (await userDataRef.once()).snapshot;
  
        // Check if the data exists
        if (snapshot.value != null) {
          String data = snapshot.value.toString();
          watchid = snapshot.value.toString();
          watchsIds = snapshot.value.toString();
          
          await fetchWatchData();
          
          return data;
        } else {
          setState(() {
      isWatchConnected = false; // Set the connection status to false
    });
          return null;
        }
      } else {
        // No user is currently logged in
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching data from Firebase: $e');
      return null;
    }
  }
  
  Future<void> fetchWatchData() async {
    try {
      DatabaseReference watchRef = FirebaseDatabase.instance.ref().child('SmartWatch');
      DatabaseReference userDataRef = watchRef.child(watchsIds);
  
      DataSnapshot snapshot = (await userDataRef.once()).snapshot;
  
      if (snapshot.value != null) {
        final Map<Object?, Object?> dataMap = snapshot.value as Map<Object?, Object?>;
  
        if (dataMap['DeviceName'] != null) {
          watchName = dataMap['DeviceName'].toString();
  
          if (watchName == "freshbs") {
            watchName = "Galaxy Watch 4";
          } else if (watchName == "sdk_gwear_x86_64") {
            watchName = "Wear OS Emulator";
          } else {
            watchName = "Unknown Device";
          }
        }
  
        if (dataMap['batteryLevel'] != null) {
          watchBattery = dataMap['batteryLevel'] as int;
        }
      } else {
        // Handle the case where data doesn't exist
        watchName = 'Unknown Device';
        watchBattery = 0;
      }
    } catch (e) {
      debugPrint('Error fetching data from Firebase: $e');
      // Handle the error if needed
    }
  }

  Future<void> deleteDataFromFirebase() async {
  try {
    // Get the current user from Firebase Auth
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reference to the users collection
      DatabaseReference usersRef =
          FirebaseDatabase.instance.ref().child('users');

      // Reference to the specific user's data
      DatabaseReference userDataRef = usersRef.child(user.uid).child('smartwatch');

      // Delete the data
      await userDataRef.remove();

      // Optionally, reset the watchid or perform any other cleanup
      watchid = "";
      setState(() {
      isWatchConnected = false; // Set the connection status to false
    });
    } else {
      // No user is currently logged in
      debugPrint('No user is currently logged in');
    }
  } catch (e) {
    debugPrint('Error deleting data from Firebase: $e');
  }
}

  void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Disconnect Watch'),
          content: const Text('Are you sure you want to disconnect from your smartwatch?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                await deleteDataFromFirebase();
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffff6079),
      body: Stack(
        children: [
          Row(
            children: [
              const SizedBox(width: 40,),
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 150,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.topLeft,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadowColor: Colors.white,
                        foregroundColor: Colors.grey,
                        surfaceTintColor: Colors.white,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (isScanning) {
                          qrController?.pauseCamera();
                        } else {
                          qrController?.resumeCamera();
                        }
                        setState(() {
                          isScanning = !isScanning;
                        });
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset('assets/images/qrno.png'),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              const SizedBox(
                                child: Text(
                                  'Sweep & Add',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 13,
                              ),
                              SizedBox(
                                width: 225,
                                child: Text(
                                  'Scan the qr code of the watch to add the device',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),     
                  FutureBuilder(
                    future: fetchDataFromFirebase(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data != null) {
                        return Column(
                          children: [
                            const SizedBox(height: 20,),
                            if (isWatchConnected)
                              SizedBox(
                                height: 150,
                                width: 300,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.topLeft,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    shadowColor: Colors.white,
                                    foregroundColor: Colors.grey,
                                    surfaceTintColor: Colors.white,
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    showDeleteConfirmationDialog(context);
                                  },
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          const SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Icon(
                                              Icons.watch,
                                              size: 50,
                                              color: Colors.black, // Customize the color as needed
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          Column(
                                            children: [
                                              const SizedBox(
                                                child: Text(
                                                  'Watch Connected',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  watchName,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 13,
                                          ),
                                          SizedBox(
                                            width: 225,
                                            child: Text(
                                              'Battery Level : $watchBattery%',
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          if (isScanning)
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 450,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) {
                    // ignore: unnecessary_this
                    this.qrController = controller;
                    controller.scannedDataStream.listen((scanData) {
                      debugPrint('Scanned data: ${scanData.code}');

                      if (scanData.code != null && scanData.code!.isNotEmpty) {
                        _saveScannedData(scanData.code!);
                        qrController?.pauseCamera();
                        setState(() {
                          isScanning = false;
                        });
                      }
                    });
                  },
                ),
              ),
            ),
        ],
      ),
    ).animate().fadeIn(duration: 1200.ms);
  }

Future<void> _saveScannedData(String scannedData) async {
  try {
    // Get the current user
    User? user = _auth.currentUser;

    if (user != null) {
      // Get the user's unique id
      String userId = user.uid;

      // Save the scanned data to Firebase Realtime Database
      await _database.child('users').child(userId).update({
        'smartwatch': scannedData,
      });
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainPage(initialIndex: 2,)));
      debugPrint('Scanned data saved to Firebase: $scannedData');
      
    } else {
      debugPrint('User not signed in.');
    }
  } catch (error) {
    debugPrint('Error saving scanned data: $error');
  }
}

  @override
  void dispose() {
    qrController?.dispose();
    this.qrController = null;
    super.dispose();
  }
}
