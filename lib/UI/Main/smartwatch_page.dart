import 'package:flutter/material.dart';

class WatchConnection extends StatefulWidget {
  const WatchConnection({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WatchConnectionState createState() => _WatchConnectionState();
}

class _WatchConnectionState extends State<WatchConnection> {

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
