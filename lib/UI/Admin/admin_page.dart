// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health/health.dart';
import 'package:myapp/UI/Admin/navbar.dart';
import 'package:myapp/UI/Main/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AdminPageState createState() => _AdminPageState();
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTHORIZED,
  AUTH_NOT_GRANTED,
  DATA_ADDED,
  DATA_DELETED,
  DATA_NOT_ADDED,
  DATA_NOT_DELETED,
  STEPS_READY,
}

class _AdminPageState extends State<AdminPage> {
  bool switchValue = true;
  String steps = "";
  DateTime selectedDate = DateTime.now();

  // ignore: prefer_final_fields
  List<HealthDataPoint> _healthDataList = [];
  int? _stepCount; // New variable to store step count
  // ignore: unused_field
  AppState _state = AppState.DATA_NOT_FETCHED;

  static const types = dataTypesAndroid;

  final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  Future authorize() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();

    bool? hasPermissions =
        await health.hasPermissions(types, permissions: permissions);
    hasPermissions = false;

    bool authorized = false;
    if (!hasPermissions) {
      try {
        authorized =
            await health.requestAuthorization(types, permissions: permissions);
      } catch (error) {
        debugPrint("Exception in authorize: $error");
      }
    }
    setState(() =>
        _state = (authorized) ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED);
  }

  Future<void> fetchStepData() async {
    setState(() => _state = AppState.FETCHING_DATA);

    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day);
    _healthDataList.clear();

    try {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        yesterday,now,
        types
      );
      if (types.contains(HealthDataType.STEPS)) {
        for (HealthDataPoint dataPoint in healthData) {
          if (dataPoint.type == HealthDataType.STEPS) {
            String x = dataPoint.value.toString();
            _stepCount = int.parse(x);
            break;
          }
        }
      }
      _healthDataList.addAll(
          (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
    } catch (error) {
      debugPrint("Exception in getHealthDataFromTypes: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedDate = DateTime.now();
      selectedDate =
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      //fetchStepData();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
        backgroundColor: Colors.pink,
      ),
      drawer: const NavBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
              child: Container(
                width: 398,
                height: 136,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 154, 183),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                        child: Text(
                          'Health Connection Status :',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Switch.adaptive(
                      value: switchValue,
                      onChanged: (newValue) {

                      },
                      activeColor: _stepCount != null ? Colors.red : const Color(0xFF39EF3E),
                      activeTrackColor: _stepCount != null ? Colors.red : Colors.green,
                      inactiveTrackColor: Colors.red,
                      inactiveThumbColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.pinkAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    switchValue ? "TRUE" : "FALSE",
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
