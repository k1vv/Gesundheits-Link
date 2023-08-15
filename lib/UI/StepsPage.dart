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
        // stepsSc1 (32:350)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroup2apxLBb (TMFkVSc4TVWWVk1fu32APX)
              padding: EdgeInsets.fromLTRB(19*fem, 0*fem, 0*fem, 38.59*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // push3rh (32:432)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 109*fem, 26*fem),
                    width: 48*fem,
                    height: 10*fem,
                    child: Image.asset(
                      'assets/UI/images/push.png',
                      width: 48*fem,
                      height: 10*fem,
                    ),
                  ),
                  Container(
                    // autogroupstu79uj (TMFiP185Jw92JrT4qBsTu7)
                    width: 410*fem,
                    height: 746.41*fem,
                    child: Container(
                      // autogroupdupjtMX (TMFixuKFohXrntBMZeDuPj)
                      width: 376*fem,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            // group19ZyT (126:1174)
                            left: 0*fem,
                            top: 14*fem,
                            child: Align(
                              child: SizedBox(
                                width: 375*fem,
                                height: 732*fem,
                                child: Image.asset(
                                  'assets/UI/images/group-19.png',
                                  width: 375*fem,
                                  height: 732*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // kilometersaNm (32:433)
                            left: 264.9052734375*fem,
                            top: 670*fem,
                            child: Container(
                              width: 77.02*fem,
                              height: 74.08*fem,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // HHB (32:436)
                                    width: double.infinity,
                                    child: Text(
                                      '4.84',
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
                                  Container(
                                    // kilometersnDw (32:435)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.13*fem),
                                    width: double.infinity,
                                    child: Text(
                                      'Kilometers',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Aleo',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.7142857143*ffem/fem,
                                        color: Color(0xff7e7e7e),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // percentfYd (32:437)
                                    width: 13.7*fem,
                                    height: 13.95*fem,
                                    child: Image.asset(
                                      'assets/UI/images/percent-aLZ.png',
                                      width: 13.7*fem,
                                      height: 13.95*fem,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // timen7T (32:441)
                            left: 160*fem,
                            top: 698*fem,
                            child: Align(
                              child: SizedBox(
                                width: 34*fem,
                                height: 24*fem,
                                child: Text(
                                  'Time',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Aleo',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.7142857143*ffem/fem,
                                    color: Color(0xff7e7e7e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // Fmj (32:442)
                            left: 155*fem,
                            top: 670*fem,
                            child: Align(
                              child: SizedBox(
                                width: 44*fem,
                                height: 28*fem,
                                child: Text(
                                  '24:06',
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
                            ),
                          ),
                          Positioned(
                            // percentLYH (32:443)
                            left: 209.5280761719*fem,
                            top: 730.1330566406*fem,
                            child: Align(
                              child: SizedBox(
                                width: 13.7*fem,
                                height: 13.95*fem,
                                child: Image.asset(
                                  'assets/UI/images/percent.png',
                                  width: 13.7*fem,
                                  height: 13.95*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // caloriesRZj (32:447)
                            left: 25.5947265625*fem,
                            top: 698*fem,
                            child: Align(
                              child: SizedBox(
                                width: 54*fem,
                                height: 24*fem,
                                child: Text(
                                  'Calories',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Aleo',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.7142857143*ffem/fem,
                                    color: Color(0xff7e7e7e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // hn9 (32:448)
                            left: 38.0947265625*fem,
                            top: 670*fem,
                            child: Align(
                              child: SizedBox(
                                width: 29*fem,
                                height: 28*fem,
                                child: Text(
                                  '480',
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
                            ),
                          ),
                          Positioned(
                            // baseDEh (32:449)
                            left: 86.2639160156*fem,
                            top: 732.4581298828*fem,
                            child: Align(
                              child: SizedBox(
                                width: 13.7*fem,
                                height: 13.95*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(10*fem),
                                    color: Color(0xffff6079),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x66ff6079),
                                        offset: Offset(0*fem, 4*fem),
                                        blurRadius: 4*fem,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // triangleUgR (32:450)
                            left: 88.5466308594*fem,
                            top: 734.783203125*fem,
                            child: Align(
                              child: SizedBox(
                                width: 9.13*fem,
                                height: 6.98*fem,
                                child: Image.asset(
                                  'assets/UI/images/triangle-Jbs.png',
                                  width: 9.13*fem,
                                  height: 6.98*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // chartLTj (32:451)
                            left: 1*fem,
                            top: 380*fem,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0*fem, 23*fem, 0*fem, 23*fem),
                              width: 375*fem,
                              height: 176*fem,
                              decoration: BoxDecoration (
                                image: DecorationImage (
                                  fit: BoxFit.cover,
                                  image: AssetImage (
                                    'assets/UI/images/path.png',
                                  ),
                                ),
                              ),
                              child: Align(
                                // pathCVw (32:453)
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  width: 375*fem,
                                  height: 76*fem,
                                  child: Image.asset(
                                    'assets/UI/images/path-3t5.png',
                                    width: 375*fem,
                                    height: 76*fem,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // totalkilocaloriesLMF (32:454)
                            left: 118.6080322266*fem,
                            top: 608*fem,
                            child: Align(
                              child: SizedBox(
                                width: 136*fem,
                                height: 26*fem,
                                child: Text(
                                  'Total Kilocalories ',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Aleo',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.625*ffem/fem,
                                    color: Color(0xff7e7e7e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // Qc1 (32:455)
                            left: 138.5001220703*fem,
                            top: 562*fem,
                            child: Align(
                              child: SizedBox(
                                width: 77*fem,
                                height: 46*fem,
                                child: Text(
                                  '4880',
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
                            ),
                          ),
                          Positioned(
                            // uof (32:456)
                            left: 270.0185546875*fem,
                            top: 586*fem,
                            child: Align(
                              child: SizedBox(
                                width: 23*fem,
                                height: 16*fem,
                                child: Text(
                                  '14%',
                                  style: SafeGoogleFont (
                                    'Arial',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3333333333*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // triangleRGD (32:457)
                            left: 268.8774414062*fem,
                            top: 632.4777832031*fem,
                            child: Align(
                              child: SizedBox(
                                width: 9.13*fem,
                                height: 6.98*fem,
                                child: Image.asset(
                                  'assets/UI/images/triangle.png',
                                  width: 9.13*fem,
                                  height: 6.98*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // jXo (32:458)
                            left: 273.4426269531*fem,
                            top: 585*fem,
                            child: Align(
                              child: SizedBox(
                                width: 23*fem,
                                height: 16*fem,
                                child: Text(
                                  '14%',
                                  style: SafeGoogleFont (
                                    'Arial',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3333333333*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // dateDSy (32:459)
                            left: 3*fem,
                            top: 335*fem,
                            child: Container(
                              width: 127*fem,
                              height: 62*fem,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // todaywds (32:460)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                    child: Text(
                                      'Today',
                                      style: SafeGoogleFont (
                                        'Aleo',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.7142857143*ffem/fem,
                                        color: Color(0xff7e7e7e),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // thu08julyqjF (32:461)
                                    'Thu, 08 May',
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
                          ),
                          Positioned(
                            // titlemso (32:463)
                            left: 133.6080322266*fem,
                            top: 215*fem,
                            child: Container(
                              width: 86*fem,
                              height: 64*fem,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // stepsthX (32:466)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                    child: Text(
                                      'Steps',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Arial',
                                        fontSize: 24*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.4166666667*ffem/fem,
                                        color: Color(0xff040415),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // stepsWD7 (32:465)
                                    '1 240 Steps',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Aleo',
                                      fontSize: 16*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.625*ffem/fem,
                                      color: Color(0xff7e7e7e),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // basebkM (32:467)
                            left: 129*fem,
                            top: 64*fem,
                            child: Align(
                              child: SizedBox(
                                width: 120*fem,
                                height: 120*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(60*fem),
                                    color: Color(0x19ff6079),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // vectori4H (32:468)
                            left: 170*fem,
                            top: 103*fem,
                            child: Align(
                              child: SizedBox(
                                width: 44*fem,
                                height: 41.1*fem,
                                child: Image.asset(
                                  'assets/UI/images/vector.png',
                                  width: 44*fem,
                                  height: 41.1*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // rectangle20RzH (32:469)
                            left: 204*fem,
                            top: 510.5*fem,
                            child: Align(
                              child: SizedBox(
                                width: 38*fem,
                                height: 17*fem,
                                child: Image.asset(
                                  'assets/UI/images/rectangle-20.png',
                                  width: 38*fem,
                                  height: 17*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // polygon1ABB (32:470)
                            left: 211*fem,
                            top: 515.0083007812*fem,
                            child: Align(
                              child: SizedBox(
                                width: 6*fem,
                                height: 8.04*fem,
                                child: Image.asset(
                                  'assets/UI/images/polygon-1.png',
                                  width: 6*fem,
                                  height: 8.04*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // FiR (32:472)
                            left: 220*fem,
                            top: 507*fem,
                            child: Align(
                              child: SizedBox(
                                width: 16*fem,
                                height: 24*fem,
                                child: Text(
                                  '14%',
                                  style: SafeGoogleFont (
                                    'DM Sans',
                                    fontSize: 8*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 3*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // headermRs (126:1175)
                            left: 24*fem,
                            top: 0*fem,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 72*fem, 0*fem),
                                width: 255*fem,
                                height: 56*fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // closeriD (126:1177)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 88*fem, 0*fem),
                                      width: 56*fem,
                                      height: 56*fem,
                                      child: Image.asset(
                                        'assets/UI/images/close.png',
                                        width: 56*fem,
                                        height: 56*fem,
                                      ),
                                    ),
                                    Text(
                                      // yourprofilemaH (126:1176)
                                      'Steps',
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // appbar5ay (255:1875)
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(40*fem),
              ),
              child: Center(
                // autogroupt96dRPw (TMEiD1PLCVtVu92rtDt96D)
                child: SizedBox(
                  width: 452.28*fem,
                  height: 105*fem,
                  child: Image.asset(
                    'assets/UI/images/auto-group-t96d.png',
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