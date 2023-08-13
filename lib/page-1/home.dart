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
        // homeVRK (1:2)
        width: double.infinity,
        height: 926*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Container(
          // homescroll1Rb (1:78)
          width: 429*fem,
          height: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffff6079),
          ),
          child: Stack(
            children: [
              Positioned(
                // illustrationi57 (1:79)
                left: 0*fem,
                top: 0*fem,
                child: Align(
                  child: SizedBox(
                    width: 1024*fem,
                    height: 1001*fem,
                    child: Image.asset(
                      'assets/page-1/images/illustration.png',
                      width: 1024*fem,
                      height: 1001*fem,
                    ),
                  ),
                ),
              ),
              Positioned(
                // groupBDb (1:92)
                left: 238*fem,
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
                    // ovaleN5 (1:94)
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
                // backgroundwVb (1:96)
                left: 63*fem,
                top: 627*fem,
                child: Align(
                  child: SizedBox(
                    width: 304.3*fem,
                    height: 60.44*fem,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(16*fem),
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // homeba9 (1:98)
                left: 179.5*fem,
                top: 640*fem,
                child: Align(
                  child: SizedBox(
                    width: 64*fem,
                    height: 34*fem,
                    child: Text(
                      'HOME',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'DM Sans',
                        fontSize: 24*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.4166666667*ffem/fem,
                        letterSpacing: -2*fem,
                        color: Color(0xffff6079),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // gesundheitslinkqzH (1:101)
                left: 46*fem,
                top: 364*fem,
                child: Align(
                  child: SizedBox(
                    width: 333*fem,
                    height: 34*fem,
                    child: Text(
                      'GESUNDHEITSLINK',
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
              Positioned(
                // findoutexactlywhatdiettraining (1:102)
                left: 45*fem,
                top: 413*fem,
                child: Align(
                  child: SizedBox(
                    width: 308*fem,
                    height: 48*fem,
                    child: Text(
                      'FIND OUT EXACTLY WHAT DIET & TRAINING WILL WORK SPECIFICALLY FOR YOU',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w400,
                        height: 2*ffem/fem,
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
          );
  }
}