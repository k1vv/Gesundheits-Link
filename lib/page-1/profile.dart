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
        // profileRUD (82:1462)
        width: double.infinity,
        height: 926*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // bodyZqK (82:1496)
              left: 0*fem,
              top: 158*fem,
              child: Container(
                width: 534*fem,
                height: 1057*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroup5fq95Hs (TMFvQQb2MAMoDeHMa45FQ9)
                      padding: EdgeInsets.fromLTRB(84*fem, 0*fem, 75*fem, 133*fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // userQb3 (82:1517)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 40*fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupcxc59oX (TMFvtJxCQtTUywx9qLCxC5)
                                  padding: EdgeInsets.fromLTRB(119.5*fem, 0*fem, 119.5*fem, 72*fem),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // autogroup71ndTpD (TMFvnUnaYmPhT3nKDF71nd)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 11*fem),
                                        child: Center(
                                          // ellipse14QUZ (82:1523)
                                          child: SizedBox(
                                            width: 122*fem,
                                            height: 121*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/ellipse-14.png',
                                              width: 122*fem,
                                              height: 121*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // linhnguyenj13 (82:1521)
                                        'Zinnirahabin',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Arial',
                                          fontSize: 24*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.4166666667*ffem/fem,
                                          color: Color(0xff040415),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // lineSAM (82:1518)
                                  width: double.infinity,
                                  height: 1*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(0.5*fem),
                                    color: Color(0x33bfbfbf),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // itemsBdj (82:1498)
                            margin: EdgeInsets.fromLTRB(24*fem, 0*fem, 19*fem, 0*fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // itemj9T (82:1511)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 35*fem),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom (
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // autogroups7hf1cm (TMFvcuECuzeCDa5J3fs7hF)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                                            width: 48*fem,
                                            height: 48*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/auto-group-s7hf.png',
                                              width: 48*fem,
                                              height: 48*fem,
                                            ),
                                          ),
                                          Container(
                                            // goalsWZX (82:1513)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 119*fem, 0*fem),
                                            child: Text(
                                              'Push Notification',
                                              style: SafeGoogleFont (
                                                'Arial',
                                                fontSize: 16*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.625*ffem/fem,
                                                color: Color(0xff040415),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // arrownmw (82:1512)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                            width: 5*fem,
                                            height: 8*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/arrow.png',
                                              width: 5*fem,
                                              height: 8*fem,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // itemJEV (82:1499)
                                  margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 0*fem, 0*fem),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom (
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // iconaho (82:1502)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                                            width: 48*fem,
                                            height: 48*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/icon-zQZ.png',
                                              width: 48*fem,
                                              height: 48*fem,
                                            ),
                                          ),
                                          Container(
                                            // settingshnR (82:1501)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 182*fem, 0*fem),
                                            child: Text(
                                              'Settings',
                                              style: SafeGoogleFont (
                                                'Arial',
                                                fontSize: 16*ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.625*ffem/fem,
                                                color: Color(0xff040415),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // arrow241 (82:1500)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                            width: 5*fem,
                                            height: 8*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/arrow-pBB.png',
                                              width: 5*fem,
                                              height: 8*fem,
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
                    Container(
                      // autogroupevsf9PX (TMFvGpyKXQNgE5GAZYEvsf)
                      width: double.infinity,
                      height: 514*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // buttonhR3 (I82:1497;0:9192)
                            left: 50*fem,
                            top: 22*fem,
                            child: Container(
                              width: 327*fem,
                              height: 64*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(16*fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign Out',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Arial',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.625*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // ellipse24j6q (82:1524)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 534*fem,
                                height: 514*fem,
                                child: Image.asset(
                                  'assets/page-1/images/ellipse-24-G4R.png',
                                  width: 534*fem,
                                  height: 514*fem,
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
              // headerejb (82:1525)
              left: 50*fem,
              top: 117*fem,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 327*fem,
                  height: 56*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // arrowm3X (82:1528)
                        width: 56*fem,
                        height: 56*fem,
                        child: Image.asset(
                          'assets/page-1/images/arrow-EYq.png',
                          width: 56*fem,
                          height: 56*fem,
                        ),
                      ),
                      SizedBox(
                        width: 79*fem,
                      ),
                      Text(
                        // account4YR (82:1527)
                        'Account',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Arial',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.625*ffem/fem,
                          color: Color(0xff040415),
                        ),
                      ),
                      SizedBox(
                        width: 79*fem,
                      ),
                      Container(
                        // morenUR (82:1526)
                        width: 56*fem,
                        height: 56*fem,
                        child: Image.asset(
                          'assets/page-1/images/more.png',
                          width: 56*fem,
                          height: 56*fem,
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
          );
  }
}