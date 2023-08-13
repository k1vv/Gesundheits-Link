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
        // accountsettingPku (153:1950)
        padding: EdgeInsets.fromLTRB(0*fem, 71*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // headerq77 (153:1954)
              margin: EdgeInsets.fromLTRB(50*fem, 0*fem, 51*fem, 35*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    // arrowA9P (153:1957)
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 56*fem,
                      height: 56*fem,
                      child: Image.asset(
                        'assets/page-1/images/arrow-u4u.png',
                        width: 56*fem,
                        height: 56*fem,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 53*fem,
                  ),
                  Text(
                    // accountayo (153:1956)
                    'Account setting',
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
                    width: 53*fem,
                  ),
                  Container(
                    // moreWMf (153:1955)
                    width: 56*fem,
                    height: 56*fem,
                    child: Image.asset(
                      'assets/page-1/images/more-KAR.png',
                      width: 56*fem,
                      height: 56*fem,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupj5sbRDj (TMG1DBkB93Vc5T8rSCj5sb)
              margin: EdgeInsets.fromLTRB(153*fem, 0*fem, 153*fem, 14*fem),
              width: double.infinity,
              height: 121*fem,
              decoration: BoxDecoration (
                image: DecorationImage (
                  fit: BoxFit.cover,
                  image: AssetImage (
                    'assets/page-1/images/ellipse-14-Ucq.png',
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // buttonvgH (153:1971)
                    left: 90*fem,
                    top: 88*fem,
                    child: Align(
                      child: SizedBox(
                        width: 32*fem,
                        height: 33*fem,
                        child: Image.asset(
                          'assets/page-1/images/button-83B.png',
                          width: 32*fem,
                          height: 33*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // Rsw (153:1976)
                    left: 95*fem,
                    top: 93*fem,
                    child: Align(
                      child: SizedBox(
                        width: 23*fem,
                        height: 24*fem,
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
                ],
              ),
            ),
            Container(
              // goals6DP (153:1970)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 80*fem),
              child: Text(
                'Change profile picture',
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
              // autogrouptcxd1bF (TMG1LWsJ7RdgHnKZg5tCxD)
              margin: EdgeInsets.fromLTRB(50*fem, 0*fem, 67*fem, 40*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupgw97YLH (TMG1TM1FP45ewdqKNhgw97)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 51*fem, 0*fem),
                    width: 48*fem,
                    height: 48*fem,
                    child: Image.asset(
                      'assets/page-1/images/auto-group-gw97.png',
                      width: 48*fem,
                      height: 48*fem,
                    ),
                  ),
                  Container(
                    // goals4ZX (153:2004)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 82*fem, 6*fem),
                    child: Text(
                      'change username',
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
                    // arrowanm (153:2005)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                    width: 5*fem,
                    height: 8*fem,
                    child: Image.asset(
                      'assets/page-1/images/arrow-vzu.png',
                      width: 5*fem,
                      height: 8*fem,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupjfvveXj (TMG1aWTynWzMy98NmVjFvV)
              margin: EdgeInsets.fromLTRB(50*fem, 0*fem, 66*fem, 168*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // iconn89 (153:2008)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 51*fem, 0*fem),
                    width: 48*fem,
                    height: 48*fem,
                    child: Image.asset(
                      'assets/page-1/images/icon-gDF.png',
                      width: 48*fem,
                      height: 48*fem,
                    ),
                  ),
                  Container(
                    // goalsJcH (153:2018)
                    margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 85*fem, 0*fem),
                    child: Text(
                      'change password',
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
                    // arrowSCh (153:2019)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                    width: 5*fem,
                    height: 8*fem,
                    child: Image.asset(
                      'assets/page-1/images/arrow-V13.png',
                      width: 5*fem,
                      height: 8*fem,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // ellipse25mEy (310:967)
              width: 534*fem,
              height: 514*fem,
              child: Image.asset(
                'assets/page-1/images/ellipse-25.png',
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