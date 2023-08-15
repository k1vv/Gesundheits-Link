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
        // heartrateM6R (234:2405)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupjvyhUB3 (TMGMJcGHhjd9t3VuVSjVYH)
              padding: EdgeInsets.fromLTRB(36*fem, 38*fem, 3.96*fem, 253*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupbenzBbF (TMGM3chGd8tH5jMBKWBenZ)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 175.54*fem, 28.23*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // iconuXF (234:2407)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 78.14*fem, 0*fem),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 64.36*fem,
                              height: 66.77*fem,
                              child: Image.asset(
                                'assets/UI/images/icon-Yoj.png',
                                width: 64.36*fem,
                                height: 66.77*fem,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // yourprofile8uo (234:2406)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.77*fem),
                          child: Text(
                            'heart rate',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Arial',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.625*ffem/fem,
                              color: Color(0xff040415),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // calendarq3X (234:2413)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 49.94*fem),
                    width: double.infinity,
                    height: 33.06*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(16*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // daywMT (234:2414)
                          left: 10.2399902344*fem,
                          top: 5*fem,
                          child: Opacity(
                            opacity: 0.4,
                            child: Container(
                              width: 371.06*fem,
                              height: 24*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // 2th (234:2415)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34.72*fem, 0*fem),
                                    child: Text(
                                      '5',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Arial',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.7142857143*ffem/fem,
                                        color: Color(0xff040415),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // Kso (234:2416)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34.72*fem, 0*fem),
                                    child: Text(
                                      '6',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Arial',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.7142857143*ffem/fem,
                                        color: Color(0xff040415),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // DCV (234:2417)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 180.68*fem, 0*fem),
                                    child: Text(
                                      '7',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Arial',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.7142857143*ffem/fem,
                                        color: Color(0xff040415),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // 969 (234:2418)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31.22*fem, 0*fem),
                                    child: Text(
                                      '9',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Arial',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.7142857143*ffem/fem,
                                        color: Color(0xff040415),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // fqB (234:2419)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 27.72*fem, 0*fem),
                                    child: Text(
                                      '10',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Arial',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.7142857143*ffem/fem,
                                        color: Color(0xff040415),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // biq (234:2420)
                                    '11',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Arial',
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.7142857143*ffem/fem,
                                      color: Color(0xff040415),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // activeYPB (234:2421)
                          left: 120*fem,
                          top: 0*fem,
                          child: Container(
                            width: 131.72*fem,
                            height: 33.06*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(16*fem),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  // baseFHb (234:2422)
                                  left: 0*fem,
                                  top: 2.1978759766*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 131.72*fem,
                                      height: 30.87*fem,
                                      child: Container(
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(16*fem),
                                          color: Color(0x33ff6079),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // today8julMrR (234:2423)
                                  left: 26.3598632812*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 79*fem,
                                      height: 24*fem,
                                      child: Text(
                                        'Today, 8 May',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.7142857143*ffem/fem,
                                          color: Color(0xff040415),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogrouphaku3UM (TMGMBSoZJGiSrYCr6ehAku)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 53.04*fem, 33*fem),
                    padding: EdgeInsets.fromLTRB(28.5*fem, 20*fem, 50.5*fem, 19*fem),
                    width: 303*fem,
                    height: 87*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(24*fem),
                      gradient: LinearGradient (
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[Color(0xffff6079), Color(0x7cff6079)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Center(
                      // normalheartrateforthelast24hou (255:2122)
                      child: SizedBox(
                        child: Container(
                          constraints: BoxConstraints (
                            maxWidth: 224*fem,
                          ),
                          child: Text(
                            'Normal heart rate for the last 24 hours',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Arial',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // itemwy3 (234:2424)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 49.04*fem, 0*fem),
                    padding: EdgeInsets.fromLTRB(0*fem, 112*fem, 0*fem, 28*fem),
                    width: 327*fem,
                    decoration: BoxDecoration (
                      color: Color(0x19ff7288),
                      borderRadius: BorderRadius.circular(24*fem),
                      image: DecorationImage (
                        fit: BoxFit.cover,
                        image: AssetImage (
                          'assets/UI/images/auto-group-iiwh.png',
                        ),
                      ),
                    ),
                    child: Align(
                      // pathqoX (234:2475)
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        width: 323*fem,
                        height: 92*fem,
                        child: Image.asset(
                          'assets/UI/images/path-uE9.png',
                          width: 323*fem,
                          height: 92*fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // appbarmx5 (234:2484)
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(40*fem),
              ),
              child: Center(
                // autogroup8ruvXRT (TMEhhXETk46qrzQN5c8rUV)
                child: SizedBox(
                  width: 428*fem,
                  height: 105*fem,
                  child: Image.asset(
                    'assets/UI/images/auto-group-8ruv.png',
                    width: 428*fem,
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