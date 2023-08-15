import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // smartwatchhXF (82:1147)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffff6079),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // autogroupyxeheBb (TMFuGBzMkMG6XRnUeUyxEh)
              padding: EdgeInsets.fromLTRB(47*fem, 52*fem, 49*fem, 367*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // youarenotconnectedtothedevicep (82:1219)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                    constraints: BoxConstraints (
                      maxWidth: 332*fem,
                    ),
                    child: Text(
                      'You are not connected to the device, please add the connection according to the following way',
                      style: SafeGoogleFont (
                        'DM Sans',
                        fontSize: 13*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.8461538462*ffem/fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupcelvc1w (TMFtnncMPNrWKbndvUCeLV)
                    margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 35*fem),
                    width: 330*fem,
                    height: 155*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle29X8u (82:1208)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 330*fem,
                              height: 154*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(17.65350914*fem),
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // basedBw (82:1209)
                          left: 25*fem,
                          top: 30.4211425781*fem,
                          child: Align(
                            child: SizedBox(
                              width: 68.98*fem,
                              height: 76.58*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(24*fem),
                                  gradient: LinearGradient (
                                    begin: Alignment(0, -1),
                                    end: Alignment(0, 1),
                                    colors: <Color>[Color(0xffff6079), Color(0x7cff6079)],
                                    stops: <double>[0, 1],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // ecq (82:1210)
                          left: 49*fem,
                          top: 53*fem,
                          child: Align(
                            child: SizedBox(
                              width: 21*fem,
                              height: 24*fem,
                              child: Text(
                                '+',
                                style: SafeGoogleFont (
                                  'DM Sans',
                                  fontSize: 36*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 0.6666666667*ffem/fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // searchaddYiD (82:1212)
                          left: 127*fem,
                          top: 60*fem,
                          child: Align(
                            child: SizedBox(
                              width: 88*fem,
                              height: 24*fem,
                              child: Text(
                                'search add',
                                style: SafeGoogleFont (
                                  'DM Sans',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // clicksearchtoaddautomaticallys (82:1213)
                          left: 25*fem,
                          top: 107*fem,
                          child: Align(
                            child: SizedBox(
                              width: 263*fem,
                              height: 48*fem,
                              child: Text(
                                'click search to add, automatically search nearby watcher',
                                style: SafeGoogleFont (
                                  'DM Sans',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.8461538462*ffem/fem,
                                  color: Color(0xff7e7e7e),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupe7js8wK (TMFtznGNFTSom3ucrpe7js)
                    margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 0*fem),
                    padding: EdgeInsets.fromLTRB(23*fem, 35*fem, 42*fem, 4*fem),
                    width: 330*fem,
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(17.65350914*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupwtyqQP3 (TMFu6H7Cyk3rvJJ9njWTYq)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 39*fem, 0*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // qr195j (82:1215)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 33*fem, 0*fem),
                                width: 71*fem,
                                height: 67*fem,
                                child: Image.asset(
                                  'assets/page-1/images/qr-1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                // sweepandaddGRF (82:1217)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                                child: Text(
                                  'Sweep and Add',
                                  style: SafeGoogleFont (
                                    'DM Sans',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // scantheqrcodeofthewatchtoaddth (82:1218)
                          margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 0*fem, 0*fem),
                          constraints: BoxConstraints (
                            maxWidth: 260*fem,
                          ),
                          child: Text(
                            'Scan the qr code of the watch to add the device',
                            style: SafeGoogleFont (
                              'DM Sans',
                              fontSize: 13*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.8461538462*ffem/fem,
                              color: Color(0xff7e7e7e),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // appbar11T (255:2071)
              width: 452.28*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(40*fem),
              ),
              child: Center(
                // autogroup94mbkDw (TMEghy42exz8siDRAd94mb)
                child: SizedBox(
                  width: 452.28*fem,
                  height: 105*fem,
                  child: Image.asset(
                    'assets/page-1/images/auto-group-94mb.png',
                    width: 452.28*fem,
                    height: 105*fem,
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