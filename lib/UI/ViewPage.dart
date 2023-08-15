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
        // habit0DiH (126:2298)
        padding: EdgeInsets.fromLTRB(1*fem, 33*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
          image: DecorationImage (
            fit: BoxFit.cover,
            image: AssetImage (
              'assets/UI/images/base-ohb.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupflsq61P (TMFyWKRFJMEJoQ65dLfLSq)
              margin: EdgeInsets.fromLTRB(23*fem, 0*fem, 190.5*fem, 44*fem),
              width: double.infinity,
              height: 65*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupfdwjzcZ (TMFyfZeqoHX5fE1o6jfdwj)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 102.5*fem, 0*fem),
                    width: 65*fem,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          // buttonj4M (137:1491)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 65*fem,
                              height: 65*fem,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Image.asset(
                                  'assets/UI/images/button.png',
                                  width: 65*fem,
                                  height: 65*fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // E17 (137:1497)
                          left: 22*fem,
                          top: 21*fem,
                          child: Align(
                            child: SizedBox(
                              width: 23*fem,
                              height: 24*fem,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  '+',
                                  style: SafeGoogleFont (
                                    'DM Sans',
                                    fontSize: 40*ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 0.6*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // yourprofileUw3 (137:1571)
                    margin: EdgeInsets.fromLTRB(0*fem, 11*fem, 0*fem, 0*fem),
                    child: Text(
                      'Habits',
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
              // calendarP2R (137:1498)
              margin: EdgeInsets.fromLTRB(26*fem, 0*fem, 27.78*fem, 64.94*fem),
              width: double.infinity,
              height: 33.06*fem,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(16*fem),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // dayhYu (137:1499)
                    left: 9.6960449219*fem,
                    top: 0*fem,
                    child: Opacity(
                      opacity: 0.4,
                      child: Container(
                        width: 357.32*fem,
                        height: 24*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // CVf (137:1500)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 33.09*fem, 0*fem),
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
                              // JHo (137:1501)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 33.09*fem, 0*fem),
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
                              // Qbj (137:1502)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 173.47*fem, 0*fem),
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
                              // 8nd (137:1503)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29.59*fem, 0*fem),
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
                              // sER (137:1504)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26.09*fem, 0*fem),
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
                              // xFs (137:1505)
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
                    // activeW2V (137:1506)
                    left: 123.2641601562*fem,
                    top: 0*fem,
                    child: Container(
                      width: 126.69*fem,
                      height: 33.06*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(16*fem),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // baseoXP (137:1507)
                            left: 0*fem,
                            top: 2.1978759766*fem,
                            child: Align(
                              child: SizedBox(
                                width: 126.69*fem,
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
                            // today8jul7Y5 (137:1508)
                            left: 23.8439941406*fem,
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
              // autogroupmzqp17f (TMFynE8QVzjh8FdtxGMZqP)
              margin: EdgeInsets.fromLTRB(23*fem, 0*fem, 37*fem, 44*fem),
              padding: EdgeInsets.fromLTRB(22*fem, 11*fem, 23.38*fem, 7*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(24*fem),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0*fem, 4*fem),
                    blurRadius: 2*fem,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // cyclingtrackSTs (137:1559)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25*fem, 4*fem),
                    width: 24*fem,
                    height: 24*fem,
                    child: Image.asset(
                      'assets/UI/images/cycling-track.png',
                      width: 24*fem,
                      height: 24*fem,
                    ),
                  ),
                  Container(
                    // bodybackWyX (137:1566)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 138*fem, 4*fem),
                    child: Text(
                      'Cycling',
                      style: SafeGoogleFont (
                        'DM Sans',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.7142857143*ffem/fem,
                        color: Color(0xff040415),
                      ),
                    ),
                  ),
                  Container(
                    // tickremovebgpreview1ScH (277:1003)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
                    width: 43*fem,
                    height: 36*fem,
                    child: Image.asset(
                      'assets/UI/images/tick-removebg-preview-1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    // groupZgu (137:1557)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.47*fem),
                    width: 35.62*fem,
                    height: 28.53*fem,
                    child: Image.asset(
                      'assets/UI/images/group.png',
                      width: 35.62*fem,
                      height: 28.53*fem,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupuqb7Uos (TMFz3DhRabUZvZnd8CuQb7)
              margin: EdgeInsets.fromLTRB(23*fem, 0*fem, 34*fem, 233*fem),
              width: double.infinity,
              height: 250*fem,
              child: Stack(
                children: [
                  Positioned(
                    // background137 (137:1568)
                    left: 3*fem,
                    top: 196*fem,
                    child: Align(
                      child: SizedBox(
                        width: 367*fem,
                        height: 54*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(24*fem),
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // background41P (137:1569)
                    left: 0*fem,
                    top: 98*fem,
                    child: Align(
                      child: SizedBox(
                        width: 367*fem,
                        height: 54*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(24*fem),
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // backgroundLDo (137:1570)
                    left: 3*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 367*fem,
                        height: 54*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(24*fem),
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0*fem, 4*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group1qj (137:1579)
                    left: 308*fem,
                    top: 13*fem,
                    child: Container(
                      width: 35.62*fem,
                      height: 224.53*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // group8vM (137:1581)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 69.47*fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // groupgBB (137:1583)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 69.47*fem),
                                  width: 35.62*fem,
                                  height: 28.53*fem,
                                  child: Image.asset(
                                    'assets/UI/images/group-pTT.png',
                                    width: 35.62*fem,
                                    height: 28.53*fem,
                                  ),
                                ),
                                Container(
                                  // vectorNph (137:1582)
                                  width: 35.62*fem,
                                  height: 28.53*fem,
                                  child: Image.asset(
                                    'assets/UI/images/vector-9Vb.png',
                                    width: 35.62*fem,
                                    height: 28.53*fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // vectoritZ (137:1580)
                            width: 35.62*fem,
                            height: 28.53*fem,
                            child: Image.asset(
                              'assets/UI/images/vector-1kD.png',
                              width: 35.62*fem,
                              height: 28.53*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // iconenD (137:1572)
                    left: 19.2827148438*fem,
                    top: 15*fem,
                    child: Align(
                      child: SizedBox(
                        width: 22.83*fem,
                        height: 24.79*fem,
                        child: Image.asset(
                          'assets/UI/images/icon-oDK.png',
                          width: 22.83*fem,
                          height: 24.79*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // legsandcorekaM (137:1585)
                    left: 65*fem,
                    top: 15*fem,
                    child: Align(
                      child: SizedBox(
                        width: 56*fem,
                        height: 26*fem,
                        child: Text(
                          'Stretch',
                          style: SafeGoogleFont (
                            'DM Sans',
                            fontSize: 16*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.625*ffem/fem,
                            color: Color(0xff040415),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // iconslightshoerunp4R (137:1586)
                    left: 16*fem,
                    top: 116*fem,
                    child: Align(
                      child: SizedBox(
                        width: 23*fem,
                        height: 23*fem,
                        child: Image.asset(
                          'assets/UI/images/icons-light-shoe-run.png',
                          width: 23*fem,
                          height: 23*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // legsandcorei9o (137:1596)
                    left: 65*fem,
                    top: 112*fem,
                    child: Align(
                      child: SizedBox(
                        width: 61*fem,
                        height: 26*fem,
                        child: Text(
                          'Running',
                          style: SafeGoogleFont (
                            'DM Sans',
                            fontSize: 16*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.625*ffem/fem,
                            color: Color(0xff040415),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // iconpTj (137:1599)
                    left: 27*fem,
                    top: 216*fem,
                    child: Align(
                      child: SizedBox(
                        width: 24*fem,
                        height: 20*fem,
                        child: Image.asset(
                          'assets/UI/images/icon-bfw.png',
                          width: 24*fem,
                          height: 20*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // legscoreXsw (137:1605)
                    left: 65*fem,
                    top: 214*fem,
                    child: Align(
                      child: SizedBox(
                        width: 122*fem,
                        height: 26*fem,
                        child: Text(
                          'Yoga and Pilates',
                          style: SafeGoogleFont (
                            'DM Sans',
                            fontSize: 16*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.625*ffem/fem,
                            color: Color(0xff040415),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // tickremovebgpreview7Qgq (287:1053)
                    left: 258*fem,
                    top: 208*fem,
                    child: Align(
                      child: SizedBox(
                        width: 43*fem,
                        height: 36*fem,
                        child: Image.asset(
                          'assets/UI/images/tick-removebg-preview-7.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // tickremovebgpreview6Y2M (287:1052)
                    left: 258*fem,
                    top: 107*fem,
                    child: Align(
                      child: SizedBox(
                        width: 43*fem,
                        height: 36*fem,
                        child: Image.asset(
                          'assets/UI/images/tick-removebg-preview-6.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // tickremovebgpreview51wX (287:1051)
                    left: 258*fem,
                    top: 13*fem,
                    child: Align(
                      child: SizedBox(
                        width: 43*fem,
                        height: 36*fem,
                        child: Image.asset(
                          'assets/UI/images/tick-removebg-preview-5.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // appbarLyo (234:2533)
              width: 428*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(40*fem),
              ),
              child: Center(
                // autogroupmyss6TB (TMEj7Zi6G46FHeWEQZMyss)
                child: SizedBox(
                  width: 428*fem,
                  height: 105*fem,
                  child: Image.asset(
                    'assets/UI/images/auto-group-myss.png',
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