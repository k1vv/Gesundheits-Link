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
        // calendarMuB (255:2183)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroup3r5t5qB (TMGFYMhZvEkhsH67nv3r5T)
              padding: EdgeInsets.fromLTRB(4*fem, 8*fem, 0*fem, 57.74*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogrouptbn5oFP (TMG8WE6HRiBkaKDSEktBn5)
                    margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 12*fem, 14*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // ellipse24it9 (255:2247)
                          margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 240*fem, 0*fem),
                          width: 51*fem,
                          height: 49*fem,
                          child: Image.asset(
                            'assets/page-1/images/ellipse-24-7Kf.png',
                            width: 51*fem,
                            height: 49*fem,
                          ),
                        ),
                        Container(
                          // autogroupzfmweG1 (TMG8iZ55RdEnPR7isHZFmw)
                          margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 21*fem, 0*fem),
                          width: 48*fem,
                          height: 48*fem,
                          child: Image.asset(
                            'assets/page-1/images/auto-group-zfmw.png',
                            width: 48*fem,
                            height: 48*fem,
                          ),
                        ),
                        Container(
                          // autogroupfccvwku (TMG8nPJ2UjYBgQbjLKFccV)
                          width: 48*fem,
                          height: 48*fem,
                          child: Image.asset(
                            'assets/page-1/images/auto-group-fccv.png',
                            width: 48*fem,
                            height: 48*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupxxzmUkq (TMG8ut5Y22ud5Zg6RHXXzM)
                    width: 431*fem,
                    height: 680.26*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // todaysinformationoYD (255:2184)
                          left: 34*fem,
                          top: 249.5219726562*fem,
                          child: Container(
                            width: 344.92*fem,
                            height: 430.74*fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // titleHCV (255:2230)
                                  margin: EdgeInsets.fromLTRB(2.78*fem, 0*fem, 0*fem, 16.18*fem),
                                  width: 324.97*fem,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // autogroupscwpD69 (TMGB4pVMgMjb4qbVBTSCwP)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.18*fem),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // todaysinformationYPK (255:2233)
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
                                              // icondvZ (255:2231)
                                              margin: EdgeInsets.fromLTRB(0*fem, 2.08*fem, 0*fem, 0*fem),
                                              width: 4.1*fem,
                                              height: 11.21*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/icon-x25.png',
                                                width: 4.1*fem,
                                                height: 11.21*fem,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        // july2021L4H (255:2232)
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
                                  // itemseqf (255:2185)
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // autogroupvpfscGh (TMG9A3LcG3VfwkNZMnVPFs)
                                        margin: EdgeInsets.fromLTRB(2.78*fem, 0*fem, 6.92*fem, 15.39*fem),
                                        width: double.infinity,
                                        height: 235.47*fem,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // autogroupzuedw45 (TMG9HsStwBKqiZEE8vzuED)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15.38*fem, 0*fem),
                                              width: 159.92*fem,
                                              height: double.infinity,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // caloriesGMF (255:2186)
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
                                                              // titleJYq (255:2190)
                                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.48*fem),
                                                              width: double.infinity,
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    // caloriesExH (255:2197)
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
                                                                    // flame93f (255:2191)
                                                                    width: 16.4*fem,
                                                                    height: 18.69*fem,
                                                                    child: Image.asset(
                                                                      'assets/page-1/images/flame.png',
                                                                      width: 16.4*fem,
                                                                      height: 18.69*fem,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              // autogroup3e1b5CD (TMG9R2udLeEYk4XHXj3E1b)
                                                              width: 53*fem,
                                                              height: 43.36*fem,
                                                              child: Stack(
                                                                children: [
                                                                  Positioned(
                                                                    // kcal2NM (255:2188)
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
                                                                    // UVF (255:2189)
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
                                                  Container(
                                                    // stepsMow (255:2198)
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
                                                          // title4CZ (255:2202)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.48*fem),
                                                          width: double.infinity,
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                // stepsCJm (255:2204)
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
                                                                // iconi2D (255:2203)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 1.13*fem, 0*fem, 0*fem),
                                                                width: 22.55*fem,
                                                                height: 19.2*fem,
                                                                child: Image.asset(
                                                                  'assets/page-1/images/icon-6fj.png',
                                                                  width: 22.55*fem,
                                                                  height: 19.2*fem,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          // autogroupdwuuEFT (TMG9bwm7WkpyU9MXU1DWUu)
                                                          width: 42*fem,
                                                          height: 43.36*fem,
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                // stepsNcZ (255:2200)
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
                                                                // sJR (255:2201)
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
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // heartngH (255:2219)
                                              width: 159.92*fem,
                                              height: double.infinity,
                                              decoration: BoxDecoration (
                                                border: Border.all(color: Color(0x33bfbfbf)),
                                                borderRadius: BorderRadius.circular(24*fem),
                                              ),
                                              child: Center(
                                                // autogroupyjpsLC1 (TMEhaC7LmfxmefDeqiyjPs)
                                                child: SizedBox(
                                                  width: 159.92*fem,
                                                  height: 235.47*fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/auto-group-yjps.png',
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
                                        // autogroupgscyT1j (TMG9zmSRGVQ23GMvR6GsCy)
                                        width: double.infinity,
                                        height: 110.52*fem,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // stepsAwj (255:2205)
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
                                                        // titlebn9 (255:2209)
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.39*fem),
                                                        width: double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              // stepsLzd (255:2211)
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
                                                              // icon4vd (255:2210)
                                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
                                                              width: 20*fem,
                                                              height: 19.5*fem,
                                                              child: Image.asset(
                                                                'assets/page-1/images/icon-Uch.png',
                                                                width: 20*fem,
                                                                height: 19.5*fem,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // autogroupnpbkbQm (TMGA8bYhwdEBp5DbCEnPBK)
                                                        margin: EdgeInsets.fromLTRB(0.4*fem, 0*fem, 0*fem, 0*fem),
                                                        width: 42*fem,
                                                        height: 43.36*fem,
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                              // steps89o (255:2207)
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
                                                              // DBF (255:2208)
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
                                              // stepsWg9 (255:2212)
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
                                                        // titlePjw (255:2216)
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.39*fem),
                                                        width: double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              // stepsWpZ (255:2218)
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
                                                              // iconeA5 (255:2217)
                                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2.09*fem),
                                                              width: 22.55*fem,
                                                              height: 19.2*fem,
                                                              child: Image.asset(
                                                                'assets/page-1/images/icon-jTF.png',
                                                                width: 22.55*fem,
                                                                height: 19.2*fem,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // autogroupds6vLYh (TMGAKktmy7ffKPtJu9ds6V)
                                                        margin: EdgeInsets.fromLTRB(0.4*fem, 0*fem, 0*fem, 0*fem),
                                                        width: 42*fem,
                                                        height: 43.36*fem,
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                              // stepsrG9 (255:2214)
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
                                                              // NEV (255:2215)
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
                        ),
                        Positioned(
                          // chartgraphicFZB (255:2235)
                          left: 73*fem,
                          top: 75*fem,
                          child: Container(
                            width: 282*fem,
                            height: 146*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupodmoBSq (TMGBLyh6jP62AvynH1odmo)
                                  padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.37*fem, 0*fem),
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // bar1guP (I255:2235;18:890)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.37*fem, 0.42*fem),
                                        padding: EdgeInsets.fromLTRB(0*fem, 59.35*fem, 0*fem, 0*fem),
                                        width: 15.91*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          color: Color(0xffe9edf7),
                                          borderRadius: BorderRadius.circular(60*fem),
                                        ),
                                        child: Align(
                                          // rectangle18z9P (I255:2235;18:892)
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
                                      Container(
                                        // bar2vHw (I255:2235;18:893)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.37*fem, 0*fem),
                                        width: 16*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(60*fem),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // rectangle17E3j (I255:2235;18:894)
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
                                              // rectangle18LMf (I255:2235;18:895)
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
                                      Container(
                                        // bar342m (I255:2235;18:896)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.37*fem, 0*fem),
                                        width: 16*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(60*fem),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // rectangle17vam (I255:2235;18:897)
                                              left: 0.0910644531*fem,
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
                                              // rectangle18cyP (I255:2235;18:898)
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
                                      Container(
                                        // bar49Cd (I255:2235;18:899)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.37*fem, 0*fem),
                                        width: 16.05*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(60*fem),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // rectangle17suK (I255:2235;18:900)
                                              left: 0.1364746094*fem,
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
                                              // rectangle18QPT (I255:2235;18:901)
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
                                      Container(
                                        // bar5WBb (I255:2235;18:902)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.37*fem, 0.42*fem),
                                        padding: EdgeInsets.fromLTRB(0*fem, 44.79*fem, 0*fem, 0*fem),
                                        width: 15.91*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          color: Color(0xffe9edf7),
                                          borderRadius: BorderRadius.circular(60*fem),
                                        ),
                                        child: Align(
                                          // rectangle18Qnm (I255:2235;18:904)
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
                                      Container(
                                        // bar6uUd (I255:2235;18:905)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.42*fem),
                                        width: 15.91*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(60*fem),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // rectangle171Xf (I255:2235;18:906)
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
                                              // rectangle18jCm (I255:2235;18:907)
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
                                  // bar7Dtd (I255:2235;18:908)
                                  width: 16*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(60*fem),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        // rectangle17xLR (I255:2235;18:909)
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
                                        // rectangle18Gc1 (I255:2235;18:910)
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
                        ),
                        Positioned(
                          // calendarn4Z (255:2236)
                          left: 30*fem,
                          top: 1*fem,
                          child: Container(
                            width: 388.04*fem,
                            height: 33.06*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(16*fem),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  // dayVzZ (255:2237)
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
                                            // xNM (255:2238)
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
                                            // sVK (255:2239)
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
                                            // bw7 (255:2240)
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
                                            // Y5f (255:2241)
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
                                            // GnM (255:2242)
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
                                            // PMB (255:2243)
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
                                  // active8pZ (255:2244)
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
                                          // baseE6u (255:2245)
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
                                          // today8julKu3 (255:2246)
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
                        ),
                        Positioned(
                          // contentc7T (35:1541)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            width: 431*fem,
                            height: 527*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // group11wQd (35:1802)
                                  left: 0*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 431*fem,
                                      height: 527*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/group-11.png',
                                        width: 431*fem,
                                        height: 527*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // calendarFw7 (I35:1545;0:10096)
                                  left: 34.4119873047*fem,
                                  top: 211*fem,
                                  child: Container(
                                    width: 348.51*fem,
                                    height: 240*fem,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          // calendarys7 (I35:1545;0:10104)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.5*fem, 24*fem),
                                          width: 345.01*fem,
                                          height: 192*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // activeiZo (I35:1545;0:10105)
                                                left: 94.9239501953*fem,
                                                top: 18.7307128906*fem,
                                                child: Container(
                                                  width: 210.33*fem,
                                                  height: 139.5*fem,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        // oval2Kb (I35:1545;0:10112)
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 55.17*fem, 40.54*fem),
                                                        child: TextButton(
                                                          onPressed: () {},
                                                          style: TextButton.styleFrom (
                                                            padding: EdgeInsets.zero,
                                                          ),
                                                          child: Container(
                                                            width: 44.82*fem,
                                                            height: 46.5*fem,
                                                            child: Image.asset(
                                                              'assets/page-1/images/oval.png',
                                                              width: 44.82*fem,
                                                              height: 46.5*fem,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        // itemJY1 (I35:1545;0:10106)
                                                        margin: EdgeInsets.fromLTRB(165.5*fem, 0*fem, 0*fem, 47.69*fem),
                                                        width: 44.82*fem,
                                                        height: 2.38*fem,
                                                        child: Image.asset(
                                                          'assets/page-1/images/item-Fa1.png',
                                                          width: 44.82*fem,
                                                          height: 2.38*fem,
                                                        ),
                                                      ),
                                                      Container(
                                                        // itembX7 (I35:1545;0:10109)
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 165.5*fem, 0*fem),
                                                        width: 44.82*fem,
                                                        height: 2.38*fem,
                                                        child: Image.asset(
                                                          'assets/page-1/images/item.png',
                                                          width: 44.82*fem,
                                                          height: 2.38*fem,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // dayWty (I35:1545;0:10113)
                                                left: 0*fem,
                                                top: 0*fem,
                                                child: Container(
                                                  width: 345.01*fem,
                                                  height: 192*fem,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        // autogroupbmkbE4H (TMGD5bU7XiGeuesuUJbmKb)
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 41.17*fem, 0*fem),
                                                        height: double.infinity,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              // 8vM (I35:1545;0:10114)
                                                              '1',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // 4p1 (I35:1545;0:10121)
                                                              '8',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // c4q (I35:1545;0:10128)
                                                              '15',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // 83B (I35:1545;0:10135)
                                                              '22',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // eGR (I35:1545;0:10142)
                                                              '29',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // autogroupv1uqo9K (TMGDLFiMUUYoLKFKx4v1Uq)
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 41.17*fem, 0*fem),
                                                        height: double.infinity,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              // L9F (I35:1545;0:10115)
                                                              '2',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // s9B (I35:1545;0:10122)
                                                              '9',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // ooX (I35:1545;0:10129)
                                                              '16',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // Ym7 (I35:1545;0:10136)
                                                              '23',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // fqj (I35:1545;0:10143)
                                                              '30',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // autogroupy4i1DcM (TMGDZqA4jGq53cL1Rky4i1)
                                                        height: double.infinity,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              // m85 (I35:1545;0:10116)
                                                              '3',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // UoB (I35:1545;0:10123)
                                                              '10',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // ps3 (I35:1545;0:10130)
                                                              '17',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // KYu (I35:1545;0:10137)
                                                              '24',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 18*fem,
                                                            ),
                                                            Text(
                                                              // Rbw (I35:1545;0:10144)
                                                              '31',
                                                              textAlign: TextAlign.center,
                                                              style: SafeGoogleFont (
                                                                'Arial',
                                                                fontSize: 14*ffem,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.7142857143*ffem/fem,
                                                                color: Color(0xff040415),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // autogroupqtdbNXB (TMGEWUFgtJQtGSS32hQtDB)
                                                        padding: EdgeInsets.fromLTRB(41.17*fem, 0*fem, 0*fem, 0*fem),
                                                        height: double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              // autogroupxwg1Jfj (TMGDmueGsp345UPpHexwG1)
                                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 41.17*fem, 0*fem),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    // SX3 (I35:1545;0:10117)
                                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
                                                                    child: Text(
                                                                      '4',
                                                                      textAlign: TextAlign.center,
                                                                      style: SafeGoogleFont (
                                                                        'Arial',
                                                                        fontSize: 14*ffem,
                                                                        fontWeight: FontWeight.w400,
                                                                        height: 1.7142857143*ffem/fem,
                                                                        color: Color(0xff040415),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    // y1B (I35:1545;0:10124)
                                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17*fem),
                                                                    child: Text(
                                                                      '11',
                                                                      textAlign: TextAlign.center,
                                                                      style: SafeGoogleFont (
                                                                        'Arial',
                                                                        fontSize: 14*ffem,
                                                                        fontWeight: FontWeight.w400,
                                                                        height: 1.7142857143*ffem/fem,
                                                                        color: Color(0xffffffff),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    // scM (I35:1545;0:10133)
                                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 18*fem),
                                                                    child: Text(
                                                                      '18',
                                                                      textAlign: TextAlign.center,
                                                                      style: SafeGoogleFont (
                                                                        'Arial',
                                                                        fontSize: 14*ffem,
                                                                        fontWeight: FontWeight.w400,
                                                                        height: 1.7142857143*ffem/fem,
                                                                        color: Color(0xff040415),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    // njK (I35:1545;0:10138)
                                                                    '25',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              // autogrouphcsw7Wh (TMGDxuKxLPFAPyAt9Uhcsw)
                                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 41.17*fem, 0*fem),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    // T4m (I35:1545;0:10118)
                                                                    '5',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 18*fem,
                                                                  ),
                                                                  Text(
                                                                    // PUD (I35:1545;0:10125)
                                                                    '12',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 18*fem,
                                                                  ),
                                                                  Text(
                                                                    // WHw (I35:1545;0:10131)
                                                                    '19',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 18*fem,
                                                                  ),
                                                                  Text(
                                                                    // 3of (I35:1545;0:10139)
                                                                    '26',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              // autogroupsjvsoXw (TMGE9u1dnxTGiTwx1JSJVs)
                                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 41.17*fem, 0*fem),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    // Lnm (I35:1545;0:10119)
                                                                    '6',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 18*fem,
                                                                  ),
                                                                  Text(
                                                                    // snh (I35:1545;0:10126)
                                                                    '13',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 18*fem,
                                                                  ),
                                                                  Text(
                                                                    // PW9 (I35:1545;0:10132)
                                                                    '20',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 18*fem,
                                                                  ),
                                                                  Text(
                                                                    // jK7 (I35:1545;0:10140)
                                                                    '27',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              // autogroup4cmtaqX (TMGEHtnK31Wog6hGdY4cmT)
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    // 8s3 (I35:1545;0:10120)
                                                                    '7',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 18*fem,
                                                                  ),
                                                                  Text(
                                                                    // UR7 (I35:1545;0:10127)
                                                                    '14',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 18*fem,
                                                                  ),
                                                                  Text(
                                                                    // bVj (I35:1545;0:10134)
                                                                    '21',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 18*fem,
                                                                  ),
                                                                  Text(
                                                                    // 7DB (I35:1545;0:10141)
                                                                    '28',
                                                                    textAlign: TextAlign.center,
                                                                    style: SafeGoogleFont (
                                                                      'Arial',
                                                                      fontSize: 14*ffem,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1.7142857143*ffem/fem,
                                                                      color: Color(0xff040415),
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // autogroupqhob48R (TMGCCsRdiFbvaECiFwQhob)
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // satCVX (I35:1545;0:10097)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 33.67*fem, 0*fem),
                                                child: Text(
                                                  'Sat',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont (
                                                    'Arial',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.7142857143*ffem/fem,
                                                    color: Color(0xffff6079),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // sun8PB (I35:1545;0:10098)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 30.67*fem, 0*fem),
                                                child: Text(
                                                  'Sun',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont (
                                                    'Arial',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.7142857143*ffem/fem,
                                                    color: Color(0xffff6079),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // monfP7 (I35:1545;0:10099)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31.17*fem, 0*fem),
                                                child: Text(
                                                  'Mon',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont (
                                                    'Arial',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.7142857143*ffem/fem,
                                                    color: Color(0xffff6079),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // tuemww (I35:1545;0:10100)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31.17*fem, 0*fem),
                                                child: Text(
                                                  'Tue',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont (
                                                    'Arial',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.7142857143*ffem/fem,
                                                    color: Color(0xff040415),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // wedV7F (I35:1545;0:10101)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 32.17*fem, 0*fem),
                                                child: Text(
                                                  'Wed',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont (
                                                    'Arial',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.7142857143*ffem/fem,
                                                    color: Color(0xffff6079),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // thrp9X (I35:1545;0:10102)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37.67*fem, 0*fem),
                                                child: Text(
                                                  'Thr',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont (
                                                    'Arial',
                                                    fontSize: 14*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.7142857143*ffem/fem,
                                                    color: Color(0xffff6079),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                // friM9T (I35:1545;0:10103)
                                                'Fri',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (
                                                  'Arial',
                                                  fontSize: 14*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.7142857143*ffem/fem,
                                                  color: Color(0xffff6079),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // titleVmT (35:1546)
                                  left: 187.5001220703*fem,
                                  top: 70.3461914062*fem,
                                  child: Container(
                                    width: 56*fem,
                                    height: 61.38*fem,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // thursdayQ7j (35:1548)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9.38*fem),
                                          child: Text(
                                            'Thursday',
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
                                        Text(
                                          // julyXCM (35:1547)
                                          '08 May',
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
                                ),
                                Positioned(
                                  // iconU7b (35:1549)
                                  left: 27.583984375*fem,
                                  top: 70.3461914062*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 64.36*fem,
                                      height: 66.77*fem,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Image.asset(
                                          'assets/page-1/images/icon-5mb.png',
                                          width: 64.36*fem,
                                          height: 66.77*fem,
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
                ],
              ),
            ),
            Container(
              // appbarkau (255:2271)
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(40*fem),
              ),
              child: Center(
                // autogroupeknq6uf (TMEhD7t7yaK4YD4cH4eknq)
                child: SizedBox(
                  width: 452.28*fem,
                  height: 105*fem,
                  child: Image.asset(
                    'assets/page-1/images/auto-group-eknq.png',
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