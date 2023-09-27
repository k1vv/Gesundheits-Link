import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class TrackLocation extends StatefulWidget {
  const TrackLocation({Key? key}) : super(key: key);

  @override
  _TrackLocationState createState() => _TrackLocationState();
}

class _TrackLocationState extends State<TrackLocation> {
  late MapController mapController;
  List<Marker> markers = [];
  bool isRunning = false;
  bool showError = false;
  bool isMapExpanded = true;
  LatLng originalCenter = const LatLng(3.14661, 101.69515);
  bool showWidgets1 = false;
  bool showWidgets2 = false;
  bool showWidgets3 = false;


  @override
  void initState() {
    super.initState();
    mapController = MapController();

    // Automatically start running when the page is loaded
    startRunning();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: isMapExpanded ? 650 : 350,
                width: 360,
                child: FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    interactiveFlags: InteractiveFlag.none,
                    center: const LatLng(3.14661, 101.69515),
                    zoom: 10,
                  ),
                  nonRotatedChildren: [
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution('Mapbox',
                            onTap: () => launchUrl(Uri.parse(
                                'https://www.mapbox.com/about/maps/'))),
                      ],
                    ),
                  ],
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/azim-razmi/cln080fjn013f01ns8xhkczvp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXppbS1yYXptaSIsImEiOiJjbG16eXpqZ3UxOHcwMnFvNzRrN2hlemV0In0.91Bg7Xu9ZhxZ5Ioeo3YHhg',
                      additionalOptions: const {
                        'accessToken':
                            'pk.eyJ1IjoiYXppbS1yYXptaSIsImEiOiJjbG16eXpqZ3UxOHcwMnFvNzRrN2hlemV0In0.91Bg7Xu9ZhxZ5Ioeo3YHhg',
                        'id': 'mapbox.satellite',
                      },
                    ),
                    MarkerLayer(
                      markers: markers,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isMapExpanded = !isMapExpanded;
                            showWidgets1 = !showWidgets1;
                            showWidgets2 = !showWidgets2;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent),
                        child: Text(
                          isMapExpanded ? 'Λ' : 'V',
                          style: const TextStyle(
                              color: Color.fromARGB(167, 233, 30, 98),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                  width: 180,
                                  height: 20,
                                  child: Text(
                                    '00.00',
                                    textAlign: TextAlign.center,
                                  )),
                              SizedBox(
                                  width: 180,
                                  child: Text(
                                    'KM',
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 180,
                                height: 20,
                                child: Text(
                                  '00:00:00',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Duration',
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Visibility(
                              visible: showWidgets1,
                              child: const Column(
                                children: [
                                  SizedBox(
                                    width: 180,
                                    height: 20,
                                    child: Text(
                                      '00',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180,
                                    height: 50,
                                    child: Text(
                                      'Kcal',
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )),
                          Visibility(
                              visible: showWidgets1,
                              child: const Column(
                                children: [
                                  SizedBox(
                                    width: 180,
                                    height: 20,
                                    child: Text(
                                      '00',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 180,
                                    height: 50,
                                    child: Text(
                                      'Pace',
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                      Visibility(
                        visible: showWidgets2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                            showWidgets2 = !showWidgets2;
                            showWidgets3 = !showWidgets3;
                          });
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.transparent,
                                  surfaceTintColor: Colors.transparent
                                ),
                                child: Image.asset(
                                  'assets/images/pause.png',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Visibility(
                        visible: showWidgets3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {

                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.transparent,
                                  surfaceTintColor: Colors.transparent
                                ),
                                child: Image.asset(
                                  'assets/images/stop.png',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                            showWidgets3 = !showWidgets3;
                            showWidgets2 = !showWidgets2;
                          });
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.transparent,
                                  surfaceTintColor: Colors.transparent
                                ),
                                child: Image.asset(
                                  'assets/images/start.png',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void startRunning() {
    setState(() {
      isRunning = true;
    });

    Geolocator.getPositionStream().listen((Position position) {
      updateMapPosition(position);
    });
  }

  void stopRunning() {
    setState(() {
      isRunning = false;
    });

    setState(() {
      markers.clear();
      mapController.move(originalCenter, 10);
    });

    Geolocator.getPositionStream().listen((Position position) {}).cancel();
  }

  void updateMapPosition(Position position) {
    final LatLng latLng = LatLng(position.latitude, position.longitude);

    setState(() {
      markers.clear();
      markers.add(
        Marker(
          width: 30.0,
          height: 30.0,
          point: latLng,
          // ignore: avoid_unnecessary_containers
          builder: (ctx) => Container(
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 30.0,
            ),
          ),
        ),
      );
      mapController.move(latLng, 16.0);
    });
  }
}


