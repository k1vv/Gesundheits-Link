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
        // sleeptrackerjz1 (78:1746)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupkenrSNd (TMFsUpnvasmwD5h5zEkenR)
              padding: EdgeInsets.fromLTRB(9*fem, 25*fem, 9*fem, 75*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupihq9keD (TMFrnG8BPQAVG2LhQFiHQ9)
                    margin: EdgeInsets.fromLTRB(20*fem, 0*fem, 134.5*fem, 23.23*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // iconpPB (82:1130)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 95.14*fem, 0*fem),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 64.36*fem,
                              height: 66.77*fem,
                              child: Image.asset(
                                'assets/page-1/images/icon-nGH.png',
                                width: 64.36*fem,
                                height: 66.77*fem,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // yourprofileW17 (82:1136)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4.77*fem),
                          child: Text(
                            'Sleep Tracker',
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
                    // calendarmBw (234:2379)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21.96*fem, 23.94*fem),
                    width: 388.04*fem,
                    height: 33.06*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(16*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // dayHAH (234:2380)
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
                                    // aQH (234:2381)
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
                                    // tfs (234:2382)
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
                                    // zU1 (234:2383)
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
                                    // uL5 (234:2384)
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
                                    // DrZ (234:2385)
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
                                    // Y89 (234:2386)
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
                          // active5ds (234:2387)
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
                                  // baseCCh (234:2388)
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
                                  // today8julfc5 (234:2389)
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
                    // itemZhT (82:957)
                    margin: EdgeInsets.fromLTRB(41*fem, 0*fem, 42*fem, 40*fem),
                    padding: EdgeInsets.fromLTRB(13*fem, 185*fem, 92*fem, 25*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      color: Color(0x19ff7288),
                      borderRadius: BorderRadius.circular(24*fem),
                      image: DecorationImage (
                        fit: BoxFit.cover,
                        image: AssetImage (
                          'assets/page-1/images/auto-group-2qdw.png',
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // pmRUm (82:1026)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 23*fem, 0*fem),
                          child: Text(
                            '10 p.m',
                            style: SafeGoogleFont (
                              'Arial',
                              fontSize: 12*ffem,
                              fontWeight: FontWeight.w400,
                              height: 2*ffem/fem,
                              color: Color(0xff7e7e7e),
                            ),
                          ),
                        ),
                        Container(
                          // amwT7 (82:1027)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37*fem, 0*fem),
                          child: Text(
                            '12 a.m',
                            style: SafeGoogleFont (
                              'Arial',
                              fontSize: 12*ffem,
                              fontWeight: FontWeight.w400,
                              height: 2*ffem/fem,
                              color: Color(0xff7e7e7e),
                            ),
                          ),
                        ),
                        Container(
                          // amDvR (82:1028)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 38*fem, 0*fem),
                          child: Text(
                            '2 a.m',
                            style: SafeGoogleFont (
                              'Arial',
                              fontSize: 12*ffem,
                              fontWeight: FontWeight.w400,
                              height: 2*ffem/fem,
                              color: Color(0xff7e7e7e),
                            ),
                          ),
                        ),
                        Text(
                          // amM13 (82:1029)
                          '4 a.m',
                          style: SafeGoogleFont (
                            'Arial',
                            fontSize: 12*ffem,
                            fontWeight: FontWeight.w400,
                            height: 2*ffem/fem,
                            color: Color(0xff7e7e7e),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupybvdhKo (TMFruqjtDA9cFbMtQmYbvd)
                    margin: EdgeInsets.fromLTRB(38*fem, 0*fem, 42*fem, 40*fem),
                    padding: EdgeInsets.fromLTRB(22*fem, 39*fem, 132*fem, 34*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      color: Color(0xffff6079),
                      borderRadius: BorderRadius.circular(17.65350914*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupyurxbRB (TMFs55yUi6SP7RHbtAYuRX)
                          margin: EdgeInsets.fromLTRB(0*fem, 4*fem, 32*fem, 0*fem),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // Xpd (82:1032)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 29*fem),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: SafeGoogleFont (
                                      'Arial',
                                      fontSize: 48*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 0.5*ffem/fem,
                                      color: Color(0xffffffff),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '60%',
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 48*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 0.5*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' ',
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 48*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 0.5*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                // qualityjJR (82:1033)
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                                  child: Text(
                                    'QUALITY',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Arial',
                                      fontSize: 20*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2*ffem/fem,
                                      color: Color(0xa3ffe4e8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // path3pu (82:1034)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                          width: 42*fem,
                          height: 76*fem,
                          child: Image.asset(
                            'assets/page-1/images/path-wXX.png',
                            width: 42*fem,
                            height: 76*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupkckwmku (TMFsDztJ5CGRbbS1fPKcKw)
                    margin: EdgeInsets.fromLTRB(43*fem, 0*fem, 42*fem, 0*fem),
                    padding: EdgeInsets.fromLTRB(35*fem, 19*fem, 35*fem, 16*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(24*fem),
                      gradient: LinearGradient (
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[Color(0xffff6079), Color(0x7cff6079)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupdyuvDso (TMFsLFCtMcQd6ZKyuCDYUV)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                          width: 115*fem,
                          height: 46*fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // timeasleep7TP (82:1036)
                                left: 0*fem,
                                top: 0*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 115*fem,
                                    height: 24*fem,
                                    child: Text(
                                      'TIME ASLEEP',
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
                              Positioned(
                                // hours25minsbNZ (82:1037)
                                left: 3*fem,
                                top: 22*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 110*fem,
                                    height: 24*fem,
                                    child: Text(
                                      '4 HOURS 25 MINS',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Arial',
                                        fontSize: 15*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.6*ffem/fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // awakenings64R (82:1038)
                          width: double.infinity,
                          child: Text(
                            '2 awakenings',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Arial',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.6*ffem/fem,
                              color: Color(0xffffffff),
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
              // appbarcHf (255:2022)
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(40*fem),
              ),
              child: Center(
                // autogrouprnhjZTo (TMEhpwBmztrbfjXuF2rNhj)
                child: SizedBox(
                  width: 452.28*fem,
                  height: 105*fem,
                  child: Image.asset(
                    'assets/page-1/images/auto-group-rnhj.png',
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