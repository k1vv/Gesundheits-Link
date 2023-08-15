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
        // login9FF (255:1640)
        width: double.infinity,
        height: 926*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Container(
          // androidlarge1fjP (255:1641)
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                // homescrollCzD (255:1642)
                left: 0*fem,
                top: 0*fem,
                child: Container(
                  width: 510.03*fem,
                  height: 1071.84*fem,
                  decoration: BoxDecoration (
                    color: Color(0xffff6079),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        // illustrationKow (255:1643)
                        left: 0*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 1024*fem,
                            height: 1001*fem,
                            child: Image.asset(
                              'assets/UI/images/illustration-j5K.png',
                              width: 1024*fem,
                              height: 1001*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // groupEg1 (255:1656)
                        left: 197.5777587891*fem,
                        top: 0*fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(50*fem, 50*fem, 50*fem, 50*fem),
                          width: 220*fem,
                          height: 220*fem,
                          decoration: BoxDecoration (
                            border: Border.all(color: Color(0xffffffff)),
                            borderRadius: BorderRadius.circular(110*fem),
                          ),
                          child: Center(
                            // ovalKBf (255:1658)
                            child: SizedBox(
                              width: double.infinity,
                              height: 120*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(60*fem),
                                  border: Border.all(color: Color(0xffffffff)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // backgroundqvh (255:1659)
                        left: 37*fem,
                        top: 339*fem,
                        child: Align(
                          child: SizedBox(
                            width: 354*fem,
                            height: 350*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(16*fem),
                                color: Color(0xa0ffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle35YaD (255:1660)
                        left: 88*fem,
                        top: 659*fem,
                        child: Align(
                          child: SizedBox(
                            width: 98*fem,
                            height: 61*fem,
                            child: Image.asset(
                              'assets/UI/images/rectangle-35.png',
                              width: 98*fem,
                              height: 61*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle34eNM (255:1661)
                        left: 262*fem,
                        top: 658*fem,
                        child: Align(
                          child: SizedBox(
                            width: 98*fem,
                            height: 61*fem,
                            child: Image.asset(
                              'assets/UI/images/rectangle-34.png',
                              width: 98*fem,
                              height: 61*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // submitmSy (255:1662)
                        left: 109*fem,
                        top: 673*fem,
                        child: Align(
                          child: SizedBox(
                            width: 53*fem,
                            height: 34*fem,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Submit',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'DM Sans',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 2.2666666667*ffem/fem,
                                  color: Color(0xffff6079),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // signupcyP (255:1663)
                        left: 283.5*fem,
                        top: 673*fem,
                        child: Align(
                          child: SizedBox(
                            width: 54*fem,
                            height: 34*fem,
                            child: Text(
                              'Sign up\n',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'DM Sans',
                                fontSize: 15*ffem,
                                fontWeight: FontWeight.w700,
                                height: 2.2666666667*ffem/fem,
                                color: Color(0xffff6079),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // loginKN1 (255:1664)
                        left: 136.5*fem,
                        top: 231*fem,
                        child: Align(
                          child: SizedBox(
                            width: 120*fem,
                            height: 34*fem,
                            child: Text(
                              'LOG IN',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'DM Sans',
                                fontSize: 40*ffem,
                                fontWeight: FontWeight.w700,
                                height: 0.85*ffem/fem,
                                letterSpacing: -2*fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // bgBv1 (255:1665)
                left: 87.9777832031*fem,
                top: 407.4399414062*fem,
                child: Align(
                  child: SizedBox(
                    width: 249.67*fem,
                    height: 72.92*fem,
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(8*fem),
                        border: Border.all(color: Color(0xffd1e2ea)),
                        color: Color(0xfff4f8fa),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // placeholderUPK (255:1666)
                left: 104.6221923828*fem,
                top: 435.2199707031*fem,
                child: Align(
                  child: SizedBox(
                    width: 64*fem,
                    height: 20*fem,
                    child: Text(
                      'Username',
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.4285714286*ffem/fem,
                        color: Color(0xff90a0ac),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // bgZvZ (255:1669)
                left: 87.9777832031*fem,
                top: 512.7724609375*fem,
                child: Align(
                  child: SizedBox(
                    width: 249.67*fem,
                    height: 72.92*fem,
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(8*fem),
                        border: Border.all(color: Color(0xffd1e2ea)),
                        color: Color(0xfff4f8fa),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // placeholdergkH (255:1670)
                left: 110.5666503906*fem,
                top: 532.4499511719*fem,
                child: Align(
                  child: SizedBox(
                    width: 62*fem,
                    height: 20*fem,
                    child: Text(
                      'Password',
                      style: SafeGoogleFont (
                        'Roboto',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.4285714286*ffem/fem,
                        color: Color(0xff90a0ac),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
          );
  }
}