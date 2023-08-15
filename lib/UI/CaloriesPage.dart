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
        // caloriesfBo (78:1001)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // profilestatsscrollPtV (78:1018)
              margin: EdgeInsets.fromLTRB(26*fem, 0*fem, 27*fem, 16*fem),
              padding: EdgeInsets.fromLTRB(6*fem, 60*fem, 0*fem, 79*fem),
              width: double.infinity,
              height: 812*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // headerfb7 (78:1061)
                    margin: EdgeInsets.fromLTRB(18*fem, 0*fem, 96*fem, 47*fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 62.5*fem, 0*fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // closeHMb (78:1064)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 78.5*fem, 0*fem),
                              width: 56*fem,
                              height: 56*fem,
                              child: Image.asset(
                                'assets/UI/images/close-Wnd.png',
                                width: 56*fem,
                                height: 56*fem,
                              ),
                            ),
                            Text(
                              // yourprofile12h (78:1063)
                              'Calories',
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
                    // calendarvvM (234:2346)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 69.94*fem),
                    width: 388.04*fem,
                    height: 33.06*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(16*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // daySNu (234:2347)
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
                                    // jcu (234:2348)
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
                                    // pPT (234:2349)
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
                                    // 9Aq (234:2350)
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
                                    // 4Yh (234:2351)
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
                                    // BtD (234:2352)
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
                                    // JT3 (234:2353)
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
                          // activecid (234:2354)
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
                                  // basek49 (234:2355)
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
                                  // today8julSxZ (234:2356)
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
                    // bodyiv5 (78:1019)
                    margin: EdgeInsets.fromLTRB(18*fem, 0*fem, 28*fem, 0*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // graph4DF (78:1043)
                          margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 56*fem),
                          width: 319*fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // titleAXB (78:1057)
                                margin: EdgeInsets.fromLTRB(121*fem, 0*fem, 121*fem, 12*fem),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // uDs (78:1059)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
                                      child: Text(
                                        '1200',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 36*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2777777778*ffem/fem,
                                          color: Color(0xff040415),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      // kcalc8H (78:1058)
                                      'Kcal',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Arial',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.7142857143*ffem/fem,
                                        color: Color(0xff7e7e7e),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupdaihxC9 (TMFqyNJed3oADb9WevDaih)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 24*fem),
                                width: 319*fem,
                                height: 110*fem,
                                child: Image.asset(
                                  'assets/UI/images/auto-group-daih.png',
                                  width: 319*fem,
                                  height: 110*fem,
                                ),
                              ),
                              Container(
                                // date51s (78:1044)
                                margin: EdgeInsets.fromLTRB(8.5*fem, 0*fem, 11*fem, 0*fem),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // satzed (78:1045)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25.5*fem, 0*fem),
                                      child: Text(
                                        'Sat',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.7142857143*ffem/fem,
                                          color: Color(0xff7e7e7e),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // sunHdj (78:1046)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22.5*fem, 0*fem),
                                      child: Text(
                                        'Sun',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.7142857143*ffem/fem,
                                          color: Color(0xff7e7e7e),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // mon1Jq (78:1047)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 23*fem, 0*fem),
                                      child: Text(
                                        'Mon',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.7142857143*ffem/fem,
                                          color: Color(0xff7e7e7e),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // tueij3 (78:1048)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 23*fem, 0*fem),
                                      child: Text(
                                        'Tue',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.7142857143*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // wedFDB (78:1049)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                                      child: Text(
                                        'Wed',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.7142857143*ffem/fem,
                                          color: Color(0xff7e7e7e),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // thrwbo (78:1050)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29.5*fem, 0*fem),
                                      child: Text(
                                        'Thr',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.7142857143*ffem/fem,
                                          color: Color(0xff7e7e7e),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      // friTq3 (78:1051)
                                      'Fri',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Arial',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.7142857143*ffem/fem,
                                        color: Color(0xff7e7e7e),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // activecalories15s (78:1020)
                          width: 317*fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // title8wB (78:1037)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 50*fem),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // activecaloriesGnV (78:1039)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 129*fem, 0*fem),
                                      child: Text(
                                        'Active Calories',
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
                                      // daysNqX (78:1040)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                                      child: Text(
                                        'Today',
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
                                      // iconsnH (78:1038)
                                      width: 4*fem,
                                      height: 12*fem,
                                      child: Image.asset(
                                        'assets/UI/images/icon-S1f.png',
                                        width: 4*fem,
                                        height: 12*fem,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // infoovq (78:1021)
                                margin: EdgeInsets.fromLTRB(16.5*fem, 0*fem, 15*fem, 0*fem),
                                width: double.infinity,
                                height: 91*fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      // last7days8y7 (78:1032)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36.5*fem, 0*fem),
                                      width: 78*fem,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // autogroupr9thfy3 (TMFqhD6ua2Sj7VmDZMr9tH)
                                            padding: EdgeInsets.fromLTRB(6*fem, 0*fem, 6*fem, 9*fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // iconcNV (78:1036)
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 11*fem),
                                                  width: 20*fem,
                                                  height: 18*fem,
                                                  child: Image.asset(
                                                    'assets/UI/images/icon-RVs.png',
                                                    width: 20*fem,
                                                    height: 18*fem,
                                                  ),
                                                ),
                                                Text(
                                                  // kcal8bj (78:1035)
                                                  '246 Kcal',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont (
                                                    'Arial',
                                                    fontSize: 18*ffem,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.5555555556*ffem/fem,
                                                    color: Color(0xff040415),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            // last7days3Cu (78:1034)
                                            'Last 24 hours',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Arial',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.7142857143*ffem/fem,
                                              color: Color(0xff7e7e7e),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // alltimekt1 (78:1027)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 47*fem, 0*fem),
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // iconJ8q (78:1031)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 10*fem),
                                            width: 16*fem,
                                            height: 20*fem,
                                            child: Image.asset(
                                              'assets/UI/images/icon-FNH.png',
                                              width: 16*fem,
                                              height: 20*fem,
                                            ),
                                          ),
                                          Container(
                                            // kkcalRjF (78:1030)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                            child: Text(
                                              '84k Kcal',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont (
                                                'Arial',
                                                fontSize: 18*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.5555555556*ffem/fem,
                                                color: Color(0xff040415),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // alltimekWd (78:1029)
                                            'All Time',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Arial',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.7142857143*ffem/fem,
                                              color: Color(0xff7e7e7e),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // averageVj7 (78:1022)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0.01*fem, 0*fem, 0*fem),
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // iconQ5P (78:1026)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.99*fem, 9.99*fem),
                                            width: 16*fem,
                                            height: 20*fem,
                                            child: Image.asset(
                                              'assets/UI/images/icon-7p5.png',
                                              width: 16*fem,
                                              height: 20*fem,
                                            ),
                                          ),
                                          Container(
                                            // kcalKi9 (78:1025)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                            child: Text(
                                              '72 Kcal',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont (
                                                'Arial',
                                                fontSize: 18*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.5555555556*ffem/fem,
                                                color: Color(0xff040415),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // average38M (78:1024)
                                            'Average',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Arial',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.7142857143*ffem/fem,
                                              color: Color(0xff7e7e7e),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // appbarn5w (255:1924)
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(40*fem),
              ),
              child: Center(
                // autogroupw51oXpD (TMEiyEcdtAZyxMyc69W51o)
                child: SizedBox(
                  width: 452.28*fem,
                  height: 105*fem,
                  child: Image.asset(
                    'assets/UI/images/auto-group-w51o.png',
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