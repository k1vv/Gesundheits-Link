import 'package:health/health.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UI/Main/utils.dart';
import 'package:myapp/UI/Main/home_page.dart';
import 'package:myapp/UI/Welcome/login_page.dart';
import 'package:permission_handler/permission_handler.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  // ignore: prefer_final_fields, unused_field
  List<HealthDataPoint> _healthDataList = [];
  // ignore: unused_field
  AppState _state = AppState.DATA_NOT_FETCHED;
  // ignore: unused_field, prefer_final_fields
  int _nofSteps = 0;

  static const types = dataTypesAndroid;

  final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  Future authorize() async {
    try {
      await Permission.activityRecognition.request();
      await Permission.location.request();

      bool? hasPermissions = await health.hasPermissions(types, permissions: permissions);
      hasPermissions = false;

      bool authorized = false;
      if (!hasPermissions) {
        try {
          authorized = await health.requestAuthorization(types, permissions: permissions);
        } catch (error) {
          debugPrint("Exception in authorize: $error");
        }
      }
      setState(() => _state = (authorized) ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED);
    } catch (error) {
      SnackBar(
        content: Text('Your message here $error'),
        duration: const Duration(seconds: 3)
      );
    }
  }

  @override
  void initState() {
    super.initState();
    authorize();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/wallpaper.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Existing Content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.25, 20, 0),
              child: Column(
                children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'GESUNDHEITS LINK',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33, color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'FIND OUT EXACTLY WHAT DIET AND TRAINING WILL WORK SPECIALLY FOR YOU',
                  style: TextStyle(fontSize: 12, color: Colors.white),textAlign: TextAlign.center,
                ),

                Padding(        
                  padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LogInScreen()));
                    },
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'Welcome',
                      style: TextStyle(fontSize: 20 ,color: Color(0xffff6079)),
                    ),
                    style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320, 50),
                    ),
                  ),
                ),
              ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
