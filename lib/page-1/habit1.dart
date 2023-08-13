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
        // habit1zfb (126:1222)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0x33ff748a),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupmsyvjNH (TMFx3CCRHNUeRU1e9FmSYV)
              padding: EdgeInsets.fromLTRB(18.5*fem, 59*fem, 18.5*fem, 45*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupcsusfFw (TMFwhnb6AT8bBGm83UcSus)
                    margin: EdgeInsets.fromLTRB(1.5*fem, 0*fem, 161*fem, 23.23*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // iconnbT (126:1491)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 68.14*fem, 0*fem),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 64.36*fem,
                              height: 66.77*fem,
                              child: Image.asset(
                                'assets/page-1/images/icon-wah.png',
                                width: 64.36*fem,
                                height: 66.77*fem,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // yourprofileETT (126:1497)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.77*fem),
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
                    // item94d (126:1515)
                    margin: EdgeInsets.fromLTRB(131.5*fem, 0*fem, 153.5*fem, 18*fem),
                    padding: EdgeInsets.fromLTRB(23.19*fem, 22.31*fem, 23.19*fem, 22.31*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(24*fem),
                      gradient: LinearGradient (
                        begin: Alignment(-3.057, -0.232),
                        end: Alignment(-0.309, 2.361),
                        colors: <Color>[Color(0xffff6079), Color(0xffff7f93)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Center(
                      // iconCHo (126:1518)
                      child: SizedBox(
                        width: 59.63*fem,
                        height: 57.38*fem,
                        child: Image.asset(
                          'assets/page-1/images/icon-Sru.png',
                          width: 59.63*fem,
                          height: 57.38*fem,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // fullbodyworkoutJrd (126:1473)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 24*fem),
                    child: Text(
                      'Custom Your Own Habit',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'DM Sans',
                        fontSize: 32*ffem,
                        fontWeight: FontWeight.w700,
                        height: 0.75*ffem/fem,
                        color: Color(0xff040415),
                      ),
                    ),
                  ),
                  Container(
                    // shiftstubbornbodyQ8y (126:2022)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 0*fem),
                    child: Text(
                      'Star Your Favorite Habit',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'DM Sans',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.7142857143*ffem/fem,
                        color: Color(0xff1e1e1e),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroup1aayi9f (TMFwqT2zGfjPmFj8yY1Aay)
              width: double.infinity,
              height: 540*fem,
              child: Stack(
                children: [
                  Positioned(
                    // contentfKo (126:1366)
                    left: 0*fem,
                    top: 32*fem,
                    child: Container(
                      width: 428*fem,
                      height: 407*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // baseoB7 (126:1367)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 428*fem,
                                height: 403*fem,
                                child: Image.asset(
                                  'assets/page-1/images/base-jmB.png',
                                  width: 428*fem,
                                  height: 403*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // autogroupsqer5eR (TMEi6bQMMAWwDMFEoKsQeR)
                            left: 0*fem,
                            top: 4*fem,
                            child: Align(
                              child: SizedBox(
                                width: 428*fem,
                                height: 403*fem,
                                child: Image.asset(
                                  'assets/page-1/images/auto-group-sqer.png',
                                  width: 428*fem,
                                  height: 403*fem,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // button9uB (126:1474)
                    left: 172*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 65*fem,
                        height: 65*fem,
                        child: Image.asset(
                          'assets/page-1/images/button-z9f.png',
                          width: 65*fem,
                          height: 65*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // g8R (126:1481)
                    left: 192*fem,
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
                  Positioned(
                    // appbarm9s (234:2582)
                    left: 0*fem,
                    top: 435*fem,
                    child: Container(
                      width: 428*fem,
                      height: 105*fem,
                      decoration: BoxDecoration (
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(40*fem),
                      ),
                      child: Center(
                        // autogroupahgytkH (TMEhL7gTp7zQNtU1pmaHGy)
                        child: SizedBox(
                          width: 428*fem,
                          height: 105*fem,
                          child: Image.asset(
                            'assets/page-1/images/auto-group-ahgy.png',
                            width: 428*fem,
                            height: 105*fem,
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
          );
  }
}