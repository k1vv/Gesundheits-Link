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
        // habit2RFX (126:1528)
        padding: EdgeInsets.fromLTRB(0*fem, 18*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0x33ff748a),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // autogroup9asoJKK (TMFxUbdkqL7rPPKeiD9Aso)
              margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 215.5*fem, 17.23*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // iconzT3 (126:1918)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 86.14*fem, 0*fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 64.36*fem,
                        height: 66.77*fem,
                        child: Image.asset(
                          'assets/page-1/images/icon-Tkd.png',
                          width: 64.36*fem,
                          height: 66.77*fem,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // yourprofileRoF (126:1924)
                    margin: EdgeInsets.fromLTRB(0*fem, 7.23*fem, 0*fem, 0*fem),
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
              // content7g5 (126:1754)
              padding: EdgeInsets.fromLTRB(310*fem, 84*fem, 82.38*fem, 77.47*fem),
              width: double.infinity,
              height: 847*fem,
              decoration: BoxDecoration (
                image: DecorationImage (
                  fit: BoxFit.cover,
                  image: AssetImage (
                    'assets/page-1/images/auto-group-xeg5.png',
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // groupzzm (126:1979)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 51.47*fem),
                    width: 35.62*fem,
                    height: 28.53*fem,
                    child: Image.asset(
                      'assets/page-1/images/group-FM3.png',
                      width: 35.62*fem,
                      height: 28.53*fem,
                    ),
                  ),
                  Container(
                    // autogroupqfjmXE1 (TMFxevft2EQVxaY7BgQfJm)
                    width: 35.62*fem,
                    height: 605.53*fem,
                    child: Image.asset(
                      'assets/page-1/images/auto-group-qfjm.png',
                      width: 35.62*fem,
                      height: 605.53*fem,
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