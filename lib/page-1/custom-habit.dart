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
        // customhabitzVF (287:1023)
        padding: EdgeInsets.fromLTRB(0*fem, 36*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // autogroup1m1weph (TMGNAkVQXyz74aZKF11m1w)
              margin: EdgeInsets.fromLTRB(25*fem, 0*fem, 166.5*fem, 24.23*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // iconxKb (287:1041)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 76.14*fem, 0*fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 64.36*fem,
                        height: 66.77*fem,
                        child: Image.asset(
                          'assets/page-1/images/icon-isK.png',
                          width: 64.36*fem,
                          height: 66.77*fem,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // yourprofileTGM (287:1047)
                    margin: EdgeInsets.fromLTRB(0*fem, 1.23*fem, 0*fem, 0*fem),
                    child: Text(
                      'Habit Custom',
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
              // bicepmH3 (287:1024)
              margin: EdgeInsets.fromLTRB(43*fem, 0*fem, 0*fem, 9*fem),
              child: Text(
                'Name ',
                style: SafeGoogleFont (
                  'DM Sans',
                  fontSize: 16*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.625*ffem/fem,
                  color: Color(0xff040415),
                ),
              ),
            ),
            Container(
              // tabfNR (255:2378)
              margin: EdgeInsets.fromLTRB(25*fem, 0*fem, 45*fem, 34*fem),
              padding: EdgeInsets.fromLTRB(2.45*fem, 2*fem, 24.15*fem, 2*fem),
              width: double.infinity,
              height: 34*fem,
              decoration: BoxDecoration (
                color: Color(0x19ff6079),
                borderRadius: BorderRadius.circular(100*fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupvz9bYSD (TMGNT5MY9vZuMVqGBeVz9b)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                    width: 235.4*fem,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          // contentsjP (I255:2378;0:10431;0:10448)
                          left: 0*fem,
                          top: 0*fem,
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
                          // bicepWXT (287:1040)
                          left: 15.5478515625*fem,
                          top: 1*fem,
                          child: Align(
                            child: SizedBox(
                              width: 155*fem,
                              height: 26*fem,
                              child: Text(
                                'insert your own habit name',
                                style: SafeGoogleFont (
                                  'DM Sans',
                                  fontSize: 12*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 2.1666666667*ffem/fem,
                                  color: Color(0x3f000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // contentxuF (I255:2378;0:10433;0:10444)
                    width: 96*fem,
                    height: double.infinity,
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
                ],
              ),
            ),
            Container(
              // bicepSpR (287:1025)
              margin: EdgeInsets.fromLTRB(43*fem, 0*fem, 0*fem, 12*fem),
              child: Text(
                'Frequency',
                style: SafeGoogleFont (
                  'DM Sans',
                  fontSize: 16*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.625*ffem/fem,
                  color: Color(0xff040415),
                ),
              ),
            ),
            Container(
              // taba9w (287:1030)
              margin: EdgeInsets.fromLTRB(25*fem, 0*fem, 45*fem, 396*fem),
              padding: EdgeInsets.fromLTRB(2.45*fem, 2*fem, 24.15*fem, 2*fem),
              width: double.infinity,
              height: 34*fem,
              decoration: BoxDecoration (
                color: Color(0x19ff6079),
                borderRadius: BorderRadius.circular(100*fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroup8aybs93 (TMGNo9cRYWqRLzePfn8AyB)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                    width: 235.4*fem,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          // contentPt5 (I287:1030;0:10431;0:10448)
                          left: 0*fem,
                          top: 0*fem,
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
                          // biceprFs (287:1039)
                          left: 8.5478515625*fem,
                          top: 2*fem,
                          child: Align(
                            child: SizedBox(
                              width: 181*fem,
                              height: 26*fem,
                              child: Text(
                                'choose daily, weekly or monthly',
                                style: SafeGoogleFont (
                                  'DM Sans',
                                  fontSize: 12*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 2.1666666667*ffem/fem,
                                  color: Color(0x3f000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // contentks3 (I287:1030;0:10433;0:10444)
                    padding: EdgeInsets.fromLTRB(22*fem, 3*fem, 0.73*fem, 3*fem),
                    height: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(100*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // normal3bF (I287:1030;0:10433;0:10446)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15.56*fem, 0*fem),
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
                        Container(
                          // arrowAQy (287:1048)
                          margin: EdgeInsets.fromLTRB(0*fem, 0.79*fem, 0*fem, 0*fem),
                          width: 5.71*fem,
                          height: 8.26*fem,
                          child: Image.asset(
                            'assets/page-1/images/arrow-r1o.png',
                            width: 5.71*fem,
                            height: 8.26*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // ellipse24HVb (310:968)
              width: 534*fem,
              height: 514*fem,
              child: Image.asset(
                'assets/page-1/images/ellipse-24-tSm.png',
                width: 534*fem,
                height: 514*fem,
              ),
            ),
          ],
        ),
      ),
          );
  }
}