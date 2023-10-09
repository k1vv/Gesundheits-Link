import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/UI/tracklocation_page.dart';

class ShowMaps extends StatefulWidget {
  const ShowMaps({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowMapsState createState() => _ShowMapsState();
}

class _ShowMapsState extends State<ShowMaps> {
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 500,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background11.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 165 * fem,
          top: 420 * fem,
          child: SizedBox(
            height: 80,
            width: 80,
            child: ClipOval(
              child: FloatingActionButton(
                elevation: 10.0,
                onPressed: () {
                  _requestLocationPermission();
                },
                shape: const CircleBorder(),
                child: Image.asset(
                  'assets/images/200w.gif',
                  fit: BoxFit.cover,
                  height: 85,
                  width: 85,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 525 * fem,
          child: Container(
            width: 375 * screenWidth / 375,
            height: 400 * screenHeight / 375,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 50,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 75,
                              width: 75,
                              child: Image.asset('assets/images/runner.jpg',
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(height: 25 * screenHeight / 475),
                            const SizedBox(child: Text('Elapsed Time')),
                            const SizedBox(child: Text('00 : 00 : 00'))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 195 * fem,
          top: 575 * fem,
          child: const SizedBox(
              height: 50,
              child: Text(
                'Your Progress Today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )),
        ),
        Positioned(
          left: 250 * fem,
          top: 620 * fem,
          child: const SizedBox(
              height: 50,
              child: Text(
                'Distance',
                style: TextStyle(),
              )),
        ),
        Positioned(
          left: 230 * fem,
          top: 645 * fem,
          child: const SizedBox(
              height: 50,
              child: Text(
                '12.5KM/20KM',
                style: TextStyle(),
              )),
        ),
        Positioned(
          left: 256 * fem,
          top: 685 * fem,
          child: const SizedBox(
              height: 50,
              child: Text(
                'Calorie',
                style: TextStyle(),
              )),
        ),
        Positioned(
          left: 248 * fem,
          top: 709 * fem,
          child: const SizedBox(
              height: 50,
              child: Text(
                '2400 Kcal',
                style: TextStyle(),
              )),
        ),
        Positioned(
          left: 110 * fem,
          top: 475 * fem,
          child: AnimatedOpacity(
            opacity: showError ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 50,
              width: 180,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Please grant permission to use Location services in the settings',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _requestLocationPermission() async {
    final status = await Geolocator.requestPermission();

    if (status == LocationPermission.always ||
        status == LocationPermission.whileInUse) {
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TrackLocation()));
    } else if (status == LocationPermission.denied ||
        status == LocationPermission.deniedForever) {
      setState(() {
        showError = true;
      });
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          showError = false;
        });
      });
    }
  }
}
