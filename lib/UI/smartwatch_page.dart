import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class WatchConnection extends StatefulWidget {
  const WatchConnection({Key? key}) : super(key: key);

  @override
  _WatchConnectionState createState() => _WatchConnectionState();
}

class _WatchConnectionState extends State<WatchConnection> {
  final FlutterBluePlus flutterBlue = FlutterBluePlus();
  BluetoothDevice? selectedDevice;
  
  Future<void> connectToDevice(String qrCodeData) async {
  try {
    // Start scanning for devices
    FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

    // Listen to scan results and find the desired device
    FlutterBluePlus.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        // Compare the parsed QR code data with the device identifier
        if (result.device.platformName == qrCodeData) {
          selectedDevice = result.device;
          break;
        }
      }
    });

    // Wait for the scanning to complete and connect to the selected device
    await Future.delayed(Duration(seconds: 4));
    if (selectedDevice != null) {
      await selectedDevice!.connect();
      // You can now interact with the connected device
      // Don't forget to disconnect when you're done
    } else {
      // Device not found
      print('Watch not found');
    }
  } catch (e) {
    // Handle connection errors
    print('Error: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffff6079),
      body: Column(
        children: [
          Center(
            child: Stack(
              children: [
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
                          // Call the function to connect to the Bluetooth device
                          connectToDevice();
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
