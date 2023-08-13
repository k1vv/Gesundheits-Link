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
        // bloodpressurehLD (153:2029)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogrouprxmxEqw (TMG27F5mVr1FuUwGRGrXmX)
              padding: EdgeInsets.fromLTRB(19*fem, 47*fem, 20.96*fem, 202*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // headerxmw (153:2042)
                    margin: EdgeInsets.fromLTRB(35*fem, 0*fem, 98.04*fem, 40*fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 38*fem, 0*fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // closeTih (153:2044)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 0*fem),
                              width: 56*fem,
                              height: 56*fem,
                              child: Image.asset(
                                'assets/page-1/images/close-8W5.png',
                                width: 56*fem,
                                height: 56*fem,
                              ),
                            ),
                            Text(
                              // yourprofilePcM (153:2043)
                              'Blood Pressure',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Arial',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.625*ffem/fem,
                                color: Color(0xff040415),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // calendar4iV (234:2368)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 82.94*fem),
                    width: double.infinity,
                    height: 33.06*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(16*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // dayneV (234:2369)
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
                                    // VYu (234:2370)
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
                                    // CCR (234:2371)
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
                                    // KXw (234:2372)
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
                                    // DtD (234:2373)
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
                                    // kt9 (234:2374)
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
                                    // 5vR (234:2375)
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
                          // activepND (234:2376)
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
                                  // baseu8m (234:2377)
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
                                  // today8julzvu (234:2378)
                                  left: 29.3598632812*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 73*fem,
                                      height: 24*fem,
                                      child: Text(
                                        'Today, 8 Jul',
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
                    // stepsuY5 (153:2053)
                    margin: EdgeInsets.fromLTRB(31*fem, 0*fem, 30.04*fem, 48*fem),
                    padding: EdgeInsets.fromLTRB(34.75*fem, 13*fem, 34.75*fem, 169*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(24*fem),
                      gradient: LinearGradient (
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[Color(0x19ff6079), Color(0x0cff6079)],
                        stops: <double>[0, 1],
                      ),
                      image: DecorationImage (
                        fit: BoxFit.cover,
                        image: AssetImage (
                          'assets/page-1/images/auto-group-znzz.png',
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // stepsYL9 (153:2060)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 4*fem),
                          child: Text(
                            'Blood Pressure',
                            style: SafeGoogleFont (
                              'Arial',
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.7142857143*ffem/fem,
                              fontStyle: FontStyle.italic,
                              color: Color(0xff7e7e7e),
                            ),
                          ),
                        ),
                        Container(
                          // iconReq (153:2119)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 230*fem, 0*fem),
                          width: 27.5*fem,
                          height: 24*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-fd3.png',
                            width: 27.5*fem,
                            height: 24*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // YUZ (157:1707)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26.04*fem, 16*fem),
                    child: Text(
                      '120/80 mmHg',
                      style: SafeGoogleFont (
                        'Arial',
                        fontSize: 36*ffem,
                        fontWeight: FontWeight.w700,
                        height: 0.7777777778*ffem/fem,
                        color: Color(0xff040415),
                      ),
                    ),
                  ),
                  Container(
                    // tabfp5 (153:2177)
                    margin: EdgeInsets.fromLTRB(30*fem, 0*fem, 31.04*fem, 0*fem),
                    width: double.infinity,
                    height: 34*fem,
                    decoration: BoxDecoration (
                      color: Color(0x19ff6079),
                      borderRadius: BorderRadius.circular(100*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // contentxHP (I153:2177;0:10431;0:10448)
                          left: 2.2397460938*fem,
                          top: 2*fem,
                          child: Container(
                            width: 96*fem,
                            height: 30*fem,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(100*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Daily',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Arial',
                                  fontSize: 14*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.7142857143*ffem/fem,
                                  color: Color(0xffff6079),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // contentpaV (I153:2177;0:10433;0:10444)
                          left: 217.2534179688*fem,
                          top: 2*fem,
                          child: Container(
                            width: 96*fem,
                            height: 30*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(100*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Monthly',
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
                        Positioned(
                          // titleUuw (153:2170)
                          left: 1*fem,
                          top: 6*fem,
                          child: Container(
                            width: 317*fem,
                            height: 28*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // activecaloriesoxD (153:2172)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 166*fem, 0*fem),
                                  child: Text(
                                    'Normal',
                                    style: SafeGoogleFont (
                                      'Arial',
                                      fontSize: 18*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5555555556*ffem/fem,
                                      color: Color(0xff040415),
                                    ),
                                  ),
                                ),
                                Container(
                                  // daysJ8H (153:2173)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                  child: Text(
                                    '24 hours',
                                    textAlign: TextAlign.right,
                                    style: SafeGoogleFont (
                                      'Arial',
                                      fontSize: 18*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5555555556*ffem/fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // iconQSD (153:2171)
                                  width: 4*fem,
                                  height: 12*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/icon-GeV.png',
                                    width: 4*fem,
                                    height: 12*fem,
                                  ),
                                ),
                              ],
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
              // appbarX13 (255:1973)
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(40*fem),
              ),
              child: Center(
                // autogroupqzczGUR (TMEgtJ69qsGnSuRse6QZCZ)
                child: SizedBox(
                  width: 452.28*fem,
                  height: 105*fem,
                  child: Image.asset(
                    'assets/page-1/images/auto-group-qzcz.png',
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