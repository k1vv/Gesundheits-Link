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
        // realhomepageCq7 (234:2134)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogrouprvfjY8H (TMG3nhHPWjox6WuzXtRVfj)
              padding: EdgeInsets.fromLTRB(8*fem, 8*fem, 5.96*fem, 57.74*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupsuxrTFF (TMG3S83LRPrLYYRuWVSuxR)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6.04*fem, 15*fem),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // ellipse24yzH (234:2255)
                          margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 240*fem, 0*fem),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 51*fem,
                              height: 49*fem,
                              child: Image.asset(
                                'assets/page-1/images/ellipse-24.png',
                                width: 51*fem,
                                height: 49*fem,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupc2xfTPf (TMG3aHUQEN9Eh14sypC2XF)
                          margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 21*fem, 0*fem),
                          width: 48*fem,
                          height: 48*fem,
                          child: Image.asset(
                            'assets/page-1/images/auto-group-c2xf.png',
                            width: 48*fem,
                            height: 48*fem,
                          ),
                        ),
                        Container(
                          // autogroupsnwrycu (TMG3eCXYZw4KaQViNPSnWR)
                          width: 48*fem,
                          height: 48*fem,
                          child: Image.asset(
                            'assets/page-1/images/auto-group-snwr.png',
                            width: 48*fem,
                            height: 48*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // calendarv2M (1:342)
                    margin: EdgeInsets.fromLTRB(26*fem, 0*fem, 0*fem, 40.94*fem),
                    width: 388.04*fem,
                    height: 33.06*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(16*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // dayqf7 (1:343)
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
                                    // HX7 (1:344)
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
                                    // am7 (1:345)
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
                                    // KCu (1:346)
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
                                    // SYR (1:347)
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
                                    // Zsw (1:348)
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
                                    // UED (1:349)
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
                          // active2Fj (1:350)
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
                                  // base95T (1:351)
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
                                  // today8julrVf (1:352)
                                  left: 26.3600463867*fem,
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
                    // chartgraphic8i5 (234:2188)
                    margin: EdgeInsets.fromLTRB(69*fem, 0*fem, 63.04*fem, 28.52*fem),
                    width: double.infinity,
                    height: 146*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupsarb3a9 (TMG6FTWquGJ1498CrVsaRb)
                          padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.37*fem, 0*fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // bar1yCu (I234:2188;18:890)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.42*fem),
                                padding: EdgeInsets.fromLTRB(0*fem, 59.35*fem, 0*fem, 0*fem),
                                width: 15.91*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0xffe9edf7),
                                  borderRadius: BorderRadius.circular(60*fem),
                                ),
                                child: Align(
                                  // rectangle184EM (I234:2188;18:892)
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 86.23*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(60*fem),
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 28.37*fem,
                              ),
                              Container(
                                // bar2cv5 (I234:2188;18:893)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                width: 16*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(60*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle179v1 (I234:2188;18:894)
                                      left: 0.0151367188*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 15.91*fem,
                                          height: 145.58*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(60*fem),
                                              color: Color(0xffe9edf7),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // rectangle18Fi9 (I234:2188;18:895)
                                      left: 0*fem,
                                      top: 99.9998779297*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 16*fem,
                                          height: 46*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(60*fem),
                                              color: Color(0xffff6079),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 28.37*fem,
                              ),
                              Container(
                                // bar3x6m (I234:2188;18:896)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                width: 16*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(60*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle17V6h (I234:2188;18:897)
                                      left: 0.0909423828*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 15.91*fem,
                                          height: 145.58*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(60*fem),
                                              color: Color(0xffe9edf7),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // rectangle18nrV (I234:2188;18:898)
                                      left: 0*fem,
                                      top: 35.9998779297*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 16*fem,
                                          height: 110*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(60*fem),
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 28.37*fem,
                              ),
                              Container(
                                // bar4Vku (I234:2188;18:899)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                width: 16.05*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(60*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle17pHP (I234:2188;18:900)
                                      left: 0.1363525391*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 15.91*fem,
                                          height: 145.58*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(60*fem),
                                              color: Color(0xffe9edf7),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // rectangle189Kf (I234:2188;18:901)
                                      left: 0*fem,
                                      top: 71.9998779297*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 16*fem,
                                          height: 74*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(60*fem),
                                              color: Color(0xffff6079),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 28.37*fem,
                              ),
                              Container(
                                // bar5cU9 (I234:2188;18:902)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.42*fem),
                                padding: EdgeInsets.fromLTRB(0*fem, 44.79*fem, 0*fem, 0*fem),
                                width: 15.91*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0xffe9edf7),
                                  borderRadius: BorderRadius.circular(60*fem),
                                ),
                                child: Align(
                                  // rectangle18in5 (I234:2188;18:904)
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100.78*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(60*fem),
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 28.37*fem,
                              ),
                              Container(
                                // bar61mB (I234:2188;18:905)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.42*fem),
                                width: 15.91*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(60*fem),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle179Mb (I234:2188;18:906)
                                      left: 0*fem,
                                      top: 0.0001220703*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 15.91*fem,
                                          height: 145.58*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(60*fem),
                                              color: Color(0xffe9edf7),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // rectangle184jT (I234:2188;18:907)
                                      left: 0*fem,
                                      top: 13.4379882812*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 15.91*fem,
                                          height: 132.14*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(60*fem),
                                              color: Color(0xffff6079),
                                            ),
                                          ),
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
                          // bar7P13 (I234:2188;18:908)
                          width: 16*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(60*fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle17jah (I234:2188;18:909)
                                left: 0.0908203125*fem,
                                top: 0.0001220703*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 15.91*fem,
                                    height: 145.58*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(60*fem),
                                        color: Color(0xffe9edf7),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle18Qgq (I234:2188;18:910)
                                left: 0*fem,
                                top: 65*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 16*fem,
                                    height: 81*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(60*fem),
                                        color: Color(0xff000000),
                                      ),
                                    ),
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
                    // todaysinformationWjs (234:1962)
                    margin: EdgeInsets.fromLTRB(30*fem, 0*fem, 39.12*fem, 0*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // titlerHw (234:1994)
                          margin: EdgeInsets.fromLTRB(2.78*fem, 0*fem, 0*fem, 16.18*fem),
                          width: 324.97*fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // autogroupbm33MVb (TMG5yYoghcncjHaPXaBM33)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.18*fem),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // todaysinformation6CH (234:1997)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 160.87*fem, 0*fem),
                                      child: Text(
                                        'Today\'s Information',
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
                                      // iconyms (234:1995)
                                      margin: EdgeInsets.fromLTRB(0*fem, 2.08*fem, 0*fem, 0*fem),
                                      width: 4.1*fem,
                                      height: 11.21*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/icon-PvR.png',
                                        width: 4.1*fem,
                                        height: 11.21*fem,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                // july2021JJM (234:1996)
                                'May, 2023',
                                style: SafeGoogleFont (
                                  'Arial',
                                  fontSize: 14*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.7142857143*ffem/fem,
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xff7e7e7e),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // itemscpq (234:1963)
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupblgmyfP (TMG43GhSB3UQvmLb67BLgM)
                                margin: EdgeInsets.fromLTRB(2.78*fem, 0*fem, 6.92*fem, 15.39*fem),
                                width: double.infinity,
                                height: 235.47*fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroupn4cmUs3 (TMG4AWzMrxzoYgaUQSn4cM)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15.38*fem, 0*fem),
                                      width: 159.92*fem,
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // calories1ry (234:1964)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14.95*fem),
                                            child: TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom (
                                                padding: EdgeInsets.zero,
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(16.4*fem, 16.82*fem, 20.5*fem, 12.24*fem),
                                                width: double.infinity,
                                                decoration: BoxDecoration (
                                                  border: Border.all(color: Color(0x33bfbfbf)),
                                                  borderRadius: BorderRadius.circular(24*fem),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      // titletQy (234:1968)
                                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.48*fem),
                                                      width: double.infinity,
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            // caloriesoXw (234:1975)
                                                            margin: EdgeInsets.fromLTRB(0*fem, 1.37*fem, 55.61*fem, 0*fem),
                                                            child: Text(
                                                              'Calories',
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
                                                            // flameXD3 (234:1969)
                                                            width: 16.4*fem,
                                                            height: 18.69*fem,
                                                            child: Image.asset(
                                                              'assets/page-1/images/flame-VMj.png',
                                                              width: 16.4*fem,
                                                              height: 18.69*fem,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      // autogroupymwms21 (TMG4KRuBE4pr2ritBfYmWm)
                                                      width: 53*fem,
                                                      height: 43.36*fem,
                                                      child: Stack(
                                                        children: [
                                                          Positioned(
                                                            // kcalzsK (234:1966)
                                                            left: 0*fem,
                                                            top: 27.3582763672*fem,
                                                            child: Align(
                                                              child: SizedBox(
                                                                width: 23*fem,
                                                                height: 16*fem,
                                                                child: Text(
                                                                  'Kcal',
                                                                  style: SafeGoogleFont (
                                                                    'Arial',
                                                                    fontSize: 12*ffem,
                                                                    fontWeight: FontWeight.w700,
                                                                    height: 1.3333333333*ffem/fem,
                                                                    fontStyle: FontStyle.italic,
                                                                    color: Color(0xff7e7e7e),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            // hmj (234:1967)
                                                            left: 0*fem,
                                                            top: 0*fem,
                                                            child: Align(
                                                              child: SizedBox(
                                                                width: 53*fem,
                                                                height: 28*fem,
                                                                child: Text(
                                                                  '620.68',
                                                                  style: SafeGoogleFont (
                                                                    'Arial',
                                                                    fontSize: 18*ffem,
                                                                    fontWeight: FontWeight.w700,
                                                                    height: 1.5555555556*ffem/fem,
                                                                    color: Color(0xff040415),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            // stepsNcy (234:1976)
                                            onPressed: () {},
                                            style: TextButton.styleFrom (
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(16.4*fem, 15.18*fem, 17.43*fem, 15.25*fem),
                                              width: double.infinity,
                                              decoration: BoxDecoration (
                                                border: Border.all(color: Color(0x33bfbfbf)),
                                                borderRadius: BorderRadius.circular(24*fem),
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // titleTPX (234:1980)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.48*fem),
                                                    width: double.infinity,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          // stepsoCV (234:1982)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 69.54*fem, 0*fem),
                                                          child: Text(
                                                            'Steps',
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
                                                          // iconKwX (234:1981)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 1.13*fem, 0*fem, 0*fem),
                                                          width: 22.55*fem,
                                                          height: 19.2*fem,
                                                          child: Image.asset(
                                                            'assets/page-1/images/icon-HL5.png',
                                                            width: 22.55*fem,
                                                            height: 19.2*fem,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupxeazrRf (TMG4Wg5SY1t18bLRp7xeaZ)
                                                    width: 42*fem,
                                                    height: 43.36*fem,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          // stepsobo (234:1978)
                                                          left: 0*fem,
                                                          top: 27.3582763672*fem,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 30*fem,
                                                              height: 16*fem,
                                                              child: Text(
                                                                'Steps',
                                                                style: SafeGoogleFont (
                                                                  'Arial',
                                                                  fontSize: 12*ffem,
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 1.3333333333*ffem/fem,
                                                                  fontStyle: FontStyle.italic,
                                                                  color: Color(0xff7e7e7e),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // VUd (234:1979)
                                                          left: 0*fem,
                                                          top: 0*fem,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 42*fem,
                                                              height: 28*fem,
                                                              child: Text(
                                                                '1 240',
                                                                style: SafeGoogleFont (
                                                                  'Arial',
                                                                  fontSize: 18*ffem,
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 1.5555555556*ffem/fem,
                                                                  color: Color(0xff040415),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
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
                                      // heartmh3 (234:1983)
                                      width: 159.92*fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration (
                                        border: Border.all(color: Color(0x33bfbfbf)),
                                        borderRadius: BorderRadius.circular(24*fem),
                                      ),
                                      child: Center(
                                        // autogroupx6tpiMP (TMEgz3RaRXitPPetLdx6TP)
                                        child: SizedBox(
                                          width: 159.92*fem,
                                          height: 235.47*fem,
                                          child: Image.asset(
                                            'assets/page-1/images/auto-group-x6tp.png',
                                            width: 159.92*fem,
                                            height: 235.47*fem,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupfbu12ss (TMG4wq2CEbgAKGoxcSfBU1)
                                width: double.infinity,
                                height: 110.52*fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // stepsyo7 (234:2280)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25.08*fem, 0.26*fem),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(16*fem, 15.26*fem, 14.92*fem, 15.25*fem),
                                          width: 159.92*fem,
                                          height: double.infinity,
                                          decoration: BoxDecoration (
                                            border: Border.all(color: Color(0x33bfbfbf)),
                                            borderRadius: BorderRadius.circular(24*fem),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // titlenkZ (234:2284)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.39*fem),
                                                width: double.infinity,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      // stepsXTF (234:2286)
                                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                                                      child: Text(
                                                        'Blood Pressure\n',
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
                                                      // icon3wP (234:2400)
                                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
                                                      width: 20*fem,
                                                      height: 19.5*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/icon-2iM.png',
                                                        width: 20*fem,
                                                        height: 19.5*fem,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                // autogroup2joxn8H (TMG54jzLngjpZYGYEc2JoX)
                                                margin: EdgeInsets.fromLTRB(0.4*fem, 0*fem, 0*fem, 0*fem),
                                                width: 42*fem,
                                                height: 43.36*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // stepsmW1 (234:2282)
                                                      left: 0*fem,
                                                      top: 27.3583984375*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 30*fem,
                                                          height: 16*fem,
                                                          child: Text(
                                                            'Steps',
                                                            style: SafeGoogleFont (
                                                              'Arial',
                                                              fontSize: 12*ffem,
                                                              fontWeight: FontWeight.w700,
                                                              height: 1.3333333333*ffem/fem,
                                                              fontStyle: FontStyle.italic,
                                                              color: Color(0xff7e7e7e),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // 3iR (234:2283)
                                                      left: 0*fem,
                                                      top: 0*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 42*fem,
                                                          height: 28*fem,
                                                          child: Text(
                                                            '1 240',
                                                            style: SafeGoogleFont (
                                                              'Arial',
                                                              fontSize: 18*ffem,
                                                              fontWeight: FontWeight.w700,
                                                              height: 1.5555555556*ffem/fem,
                                                              color: Color(0xff040415),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // stepsk73 (234:2332)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0.26*fem, 0*fem, 0*fem),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(16*fem, 15.26*fem, 13.34*fem, 15.25*fem),
                                          width: 159.92*fem,
                                          height: double.infinity,
                                          decoration: BoxDecoration (
                                            border: Border.all(color: Color(0x33bfbfbf)),
                                            borderRadius: BorderRadius.circular(24*fem),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // title24Z (234:2336)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.39*fem),
                                                width: double.infinity,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      // stepsZqB (234:2338)
                                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24.03*fem, 0*fem),
                                                      child: Text(
                                                        'Sleep Tracker',
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
                                                      // icontMf (234:2337)
                                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2.09*fem),
                                                      width: 22.55*fem,
                                                      height: 19.2*fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/icon-Z93.png',
                                                        width: 22.55*fem,
                                                        height: 19.2*fem,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                // autogroup4ce1Bbf (TMG5EjhgqkZjm5hh1u4Ce1)
                                                margin: EdgeInsets.fromLTRB(0.4*fem, 0*fem, 0*fem, 0*fem),
                                                width: 42*fem,
                                                height: 43.36*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // steps7kD (234:2334)
                                                      left: 0*fem,
                                                      top: 27.3583984375*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 30*fem,
                                                          height: 16*fem,
                                                          child: Text(
                                                            'Steps',
                                                            style: SafeGoogleFont (
                                                              'Arial',
                                                              fontSize: 12*ffem,
                                                              fontWeight: FontWeight.w700,
                                                              height: 1.3333333333*ffem/fem,
                                                              fontStyle: FontStyle.italic,
                                                              color: Color(0xff7e7e7e),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // zZ7 (234:2335)
                                                      left: 0*fem,
                                                      top: 0*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 42*fem,
                                                          height: 28*fem,
                                                          child: Text(
                                                            '1 240',
                                                            style: SafeGoogleFont (
                                                              'Arial',
                                                              fontSize: 18*ffem,
                                                              fontWeight: FontWeight.w700,
                                                              height: 1.5555555556*ffem/fem,
                                                              color: Color(0xff040415),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
              // appbarJph (234:2210)
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(40*fem),
              ),
              child: Center(
                // autogroupiwav4Yy (TMEis9xSAff9eDyHhRiwAV)
                child: SizedBox(
                  width: 452.28*fem,
                  height: 105*fem,
                  child: Image.asset(
                    'assets/page-1/images/auto-group-iwav.png',
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