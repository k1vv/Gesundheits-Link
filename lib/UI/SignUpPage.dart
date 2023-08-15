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
        // signupkAd (82:1388)
        width: double.infinity,
        height: 926*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Container(
          // androidlarge1u3X (255:1602)
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                // homescroll2tq (255:1603)
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
                        // illustrationLed (255:1605)
                        left: 0*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 1024*fem,
                            height: 1001*fem,
                            child: Image.asset(
                              'assets/UI/images/illustration-NcR.png',
                              width: 1024*fem,
                              height: 1001*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // group2nM (255:1618)
                        left: 197.5777740479*fem,
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
                            // oval8aV (255:1620)
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
                        // backgroundqUu (255:1621)
                        left: 36.8555450439*fem,
                        top: 339.1474609375*fem,
                        child: Align(
                          child: SizedBox(
                            width: 354.29*fem,
                            height: 494.25*fem,
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
                        // rectangle35LgZ (255:1623)
                        left: 81*fem,
                        top: 806*fem,
                        child: Align(
                          child: SizedBox(
                            width: 98*fem,
                            height: 61*fem,
                            child: Image.asset(
                              'assets/UI/images/rectangle-35-yQM.png',
                              width: 98*fem,
                              height: 61*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle34Rxu (255:1624)
                        left: 240.0000152588*fem,
                        top: 806*fem,
                        child: Align(
                          child: SizedBox(
                            width: 98*fem,
                            height: 61*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(17.65350914*fem),
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // submitjTo (255:1625)
                        left: 99*fem,
                        top: 818*fem,
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
                        // resetD85 (255:1626)
                        left: 267.5000152588*fem,
                        top: 818*fem,
                        child: Align(
                          child: SizedBox(
                            width: 42*fem,
                            height: 34*fem,
                            child: Text(
                              'Reset',
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
                        // signupH7w (255:1627)
                        left: 124.5*fem,
                        top: 231*fem,
                        child: Align(
                          child: SizedBox(
                            width: 143*fem,
                            height: 34*fem,
                            child: Text(
                              'SIGN UP',
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
                // bgn4h (255:1631)
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
                // placeholderH1T (255:1632)
                left: 104.6222229004*fem,
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
                // bgB6q (255:1633)
                left: 87.9777832031*fem,
                top: 633.1525878906*fem,
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
                // placeholdergpH (255:1634)
                left: 110.5666656494*fem,
                top: 651.6724853516*fem,
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
              Positioned(
                // bgAjT (255:1635)
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
                // placeholder3HT (255:1636)
                left: 110.5666656494*fem,
                top: 532.4499511719*fem,
                child: Align(
                  child: SizedBox(
                    width: 35*fem,
                    height: 20*fem,
                    child: Text(
                      'Email',
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