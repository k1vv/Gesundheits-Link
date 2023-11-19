import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/UI/Map/tracklocation_page.dart';

class ShowMaps extends StatefulWidget {
  const ShowMaps({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowMapsState createState() => _ShowMapsState();
}

class _ShowMapsState extends State<ShowMaps> {
  bool showError = false;

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
          top: 500 * fem,
          child: Container(
            width: 375 * screenWidth / 375,
            height: 400 * screenHeight / 375,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                SizedBox(width: 40 * screenWidth / 375,),
                Column(
                  children: [
                    SizedBox(height: 15 * screenHeight / 375,),
                    Image.asset(
                      "assets/images/runner.jpg", 
                      height: 50 * screenHeight / 375,
                      width:  100 * screenWidth / 375,
                    ),
                    const Text(
                      "Elapsed Time",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ), 
                    Text(
                      "00:00:24", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5 * screenHeight / 375,),
                    SizedBox(
                      width: 50 * screenHeight / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          _requestLocationPermission();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: const Color.fromARGB(255, 248,203,198),
                          backgroundColor: const Color.fromARGB(255, 248,203,198), 
                          foregroundColor: const Color.fromARGB(255, 248,203,198),  
                          surfaceTintColor: const Color.fromARGB(255, 248,203,198), 
                        ), 
                        child: const Text(
                          "Start", 
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arial'
                          ),
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(width: 10 * screenWidth / 375,),
                Column(
                  children: [
                    SizedBox(height: 20 * screenHeight / 375),
                    const Text(
                      "Your Progress Today", 
                      style: TextStyle(
                        fontFamily: 'Arial', 
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 10 * screenHeight / 375,), 
                    const Text(
                      "Distance",
                       style: TextStyle(
                        color: Colors.grey, 
                        fontSize: 12, 
                        fontFamily: 'Arial'
                      ),
                    ),
                    Text(
                      "12.5KM/20KM",
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16, 
                        fontFamily: 'Arial'
                      ),
                    ),
                    SizedBox(height: 10 * screenHeight / 375,), 
                    const Text(
                      "Calories",
                       style: TextStyle(
                        color: Colors.grey, 
                        fontSize: 12, 
                        fontFamily: 'Arial'
                      ),
                    ),
                    Text(
                      "2400 kcal",
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16, 
                        fontFamily: 'Arial'
                      ),
                    )
                  ],
                )
              ],
            )
          ),
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
}
