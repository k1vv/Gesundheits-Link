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
        // notificationsbarw5j (78:808)
        padding: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group143eZ (82:1459)
              margin: EdgeInsets.fromLTRB(26*fem, 0*fem, 27*fem, 13*fem),
              width: double.infinity,
              height: 793*fem,
              child: Stack(
                children: [
                  Positioned(
                    // profilenotificationsmqT (78:818)
                    left: 0*fem,
                    top: 0*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0*fem, 58.6*fem, 0*fem, 0*fem),
                      width: 375*fem,
                      height: 793*fem,
                      decoration: BoxDecoration (
                        color: Color(0xffffffff),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // headerTTP (78:856)
                            margin: EdgeInsets.fromLTRB(24*fem, 0*fem, 24*fem, 33.71*fem),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // arrow8ZX (78:859)
                                      width: 56*fem,
                                      height: 54.69*fem,
                                      child: Image.asset(
                                        'assets/UI/images/arrow-zW5.png',
                                        width: 56*fem,
                                        height: 54.69*fem,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 63*fem,
                                    ),
                                    Container(
                                      // notificationseGy (78:858)
                                      margin: EdgeInsets.fromLTRB(0*fem, 7.4*fem, 0*fem, 0*fem),
                                      child: Text(
                                        'Notifications',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'DM Sans',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.7142857143*ffem/fem,
                                          color: Color(0xff040415),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 63*fem,
                                    ),
                                    Container(
                                      // morej3X (78:857)
                                      width: 56*fem,
                                      height: 54.69*fem,
                                      child: Image.asset(
                                        'assets/UI/images/more-yxu.png',
                                        width: 56*fem,
                                        height: 54.69*fem,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // bodyBRK (78:819)
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // todayuMK (78:838)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 42.63*fem),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // todayEPb (78:855)
                                        margin: EdgeInsets.fromLTRB(24*fem, 0*fem, 0*fem, 42*fem),
                                        child: Text(
                                          'Today',
                                          style: SafeGoogleFont (
                                            'DM Sans',
                                            fontSize: 14*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.7142857143*ffem/fem,
                                            color: Color(0xff7e7e7e),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // itemY9P (78:846)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 31.25*fem),
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // autogroupyj1wGr5 (TMFpmV9RY3dRRD4H7QYj1w)
                                              margin: EdgeInsets.fromLTRB(24*fem, 0*fem, 24*fem, 62.39*fem),
                                              width: double.infinity,
                                              height: 84*fem,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // avatar12y (78:852)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 3.81*fem, 24*fem, 0*fem),
                                                    width: 48*fem,
                                                    height: 46.88*fem,
                                                    child: Image.asset(
                                                      'assets/UI/images/avatar-he1.png',
                                                      width: 48*fem,
                                                      height: 46.88*fem,
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupvhjmJ25 (TMFpqZrxSXmsVSNmM4vHJM)
                                                    width: 255*fem,
                                                    height: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          // titleEwK (78:849)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                                                          width: double.infinity,
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                // cafitaVP (78:851)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 157*fem, 2*fem),
                                                                child: Text(
                                                                  'Steps',
                                                                  style: SafeGoogleFont (
                                                                    'DM Sans',
                                                                    fontSize: 14*ffem,
                                                                    fontWeight: FontWeight.w700,
                                                                    height: 1.7142857143*ffem/fem,
                                                                    color: Color(0xff040415),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                // pmhK7 (78:850)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 0*fem, 0*fem),
                                                                child: Text(
                                                                  '02:01 PM',
                                                                  textAlign: TextAlign.right,
                                                                  style: SafeGoogleFont (
                                                                    'DM Sans',
                                                                    fontSize: 14*ffem,
                                                                    fontWeight: FontWeight.w400,
                                                                    height: 1.7142857143*ffem/fem,
                                                                    color: Color(0xff7e7e7e),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          // yourduelwithalexz3K (78:848)
                                                          constraints: BoxConstraints (
                                                            maxWidth: 198*fem,
                                                          ),
                                                          child: Text(
                                                            'Your surpass 7 kilometer steps\n today 💪',
                                                            style: SafeGoogleFont (
                                                              'DM Sans',
                                                              fontSize: 14*ffem,
                                                              fontWeight: FontWeight.w400,
                                                              height: 1.7142857143*ffem/fem,
                                                              color: Color(0xff040415),
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
                                              // line66M (78:847)
                                              width: double.infinity,
                                              height: 0.98*fem,
                                              decoration: BoxDecoration (
                                                borderRadius: BorderRadius.circular(0.5*fem),
                                                color: Color(0x33bfbfbf),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // itempHF (78:839)
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // autogrouphovfM2H (TMFpKR4XiR4khzBfA6hoVf)
                                              margin: EdgeInsets.fromLTRB(24*fem, 0*fem, 24*fem, 31.39*fem),
                                              width: double.infinity,
                                              height: 61.38*fem,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // avatar4xH (78:845)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 14.51*fem),
                                                    padding: EdgeInsets.fromLTRB(13.28*fem, 14.38*fem, 11.89*fem, 7.7*fem),
                                                    child: Center(
                                                      // iconPzZ (287:1054)
                                                      child: SizedBox(
                                                        width: 22.83*fem,
                                                        height: 24.79*fem,
                                                        child: Image.asset(
                                                          'assets/UI/images/icon-A81.png',
                                                          width: 22.83*fem,
                                                          height: 24.79*fem,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupsmxb8SM (TMFpPuw33CHckHEH1UsMXB)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0.38*fem, 0*fem, 0*fem),
                                                    width: 255*fem,
                                                    height: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          // titleTzR (78:842)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                                                          width: double.infinity,
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                // herbertmartinPNH (78:844)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 145*fem, 2*fem),
                                                                child: Text(
                                                                  'Stretch',
                                                                  style: SafeGoogleFont (
                                                                    'DM Sans',
                                                                    fontSize: 14*ffem,
                                                                    fontWeight: FontWeight.w700,
                                                                    height: 1.7142857143*ffem/fem,
                                                                    color: Color(0xff040415),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                // amtK3 (78:843)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 0*fem, 0*fem),
                                                                child: Text(
                                                                  '10:32 AM',
                                                                  textAlign: TextAlign.right,
                                                                  style: SafeGoogleFont (
                                                                    'DM Sans',
                                                                    fontSize: 14*ffem,
                                                                    fontWeight: FontWeight.w400,
                                                                    height: 1.7142857143*ffem/fem,
                                                                    color: Color(0xff7e7e7e),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                          // startedfollowingyoybP (78:841)
                                                          'You finish your Habits!',
                                                          style: SafeGoogleFont (
                                                            'DM Sans',
                                                            fontSize: 14*ffem,
                                                            fontWeight: FontWeight.w400,
                                                            height: 1.7142857143*ffem/fem,
                                                            color: Color(0xff040415),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // lineWbK (78:840)
                                              width: double.infinity,
                                              height: 0.98*fem,
                                              decoration: BoxDecoration (
                                                borderRadius: BorderRadius.circular(0.5*fem),
                                                color: Color(0x33bfbfbf),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // yesterdayG4h (78:820)
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // yesterdayc8Z (78:837)
                                        margin: EdgeInsets.fromLTRB(24*fem, 0*fem, 0*fem, 36.89*fem),
                                        child: Text(
                                          'Yesterday',
                                          style: SafeGoogleFont (
                                            'DM Sans',
                                            fontSize: 14*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.7142857143*ffem/fem,
                                            color: Color(0xff7e7e7e),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // item8ch (78:830)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23.44*fem),
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // autogroupx3uzsqB (TMFobwFePtgoEPSBR8X3UZ)
                                              margin: EdgeInsets.fromLTRB(24*fem, 0*fem, 24*fem, 26.67*fem),
                                              width: double.infinity,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    // autogroupvc6zcGy (TMFogmSvrWNPeLG6xgvC6Z)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 4*fem),
                                                    padding: EdgeInsets.fromLTRB(0*fem, 14.11*fem, 0*fem, 0*fem),
                                                    width: 48*fem,
                                                    child: Align(
                                                      // ellipseJfb (78:861)
                                                      alignment: Alignment.bottomCenter,
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: 48*fem,
                                                        child: Container(
                                                          decoration: BoxDecoration (
                                                            borderRadius: BorderRadius.circular(24*fem),
                                                            image: DecorationImage (
                                                              fit: BoxFit.cover,
                                                              image: AssetImage (
                                                                'assets/UI/images/ellipse-bg.png',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupwv2z1a1 (TMFop1jrYRtnGFVzH2Wv2Z)
                                                    width: 255*fem,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          // titlexVF (78:833)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                                                          width: double.infinity,
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                // hannahrowehhj (78:835)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 117*fem, 2*fem),
                                                                child: Text(
                                                                  'Monica Kim',
                                                                  style: SafeGoogleFont (
                                                                    'DM Sans',
                                                                    fontSize: 14*ffem,
                                                                    fontWeight: FontWeight.w700,
                                                                    height: 1.7142857143*ffem/fem,
                                                                    color: Color(0xff040415),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                // amQMF (78:834)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 0*fem, 0*fem),
                                                                child: Text(
                                                                  '10:32 AM',
                                                                  textAlign: TextAlign.right,
                                                                  style: SafeGoogleFont (
                                                                    'DM Sans',
                                                                    fontSize: 14*ffem,
                                                                    fontWeight: FontWeight.w400,
                                                                    height: 1.7142857143*ffem/fem,
                                                                    color: Color(0xff7e7e7e),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                          // startedfollowingyoisj (78:832)
                                                          'Started friends with you!',
                                                          style: SafeGoogleFont (
                                                            'DM Sans',
                                                            fontSize: 14*ffem,
                                                            fontWeight: FontWeight.w400,
                                                            height: 1.7142857143*ffem/fem,
                                                            color: Color(0xff040415),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // lineqxM (78:831)
                                              width: double.infinity,
                                              height: 0.98*fem,
                                              decoration: BoxDecoration (
                                                borderRadius: BorderRadius.circular(0.5*fem),
                                                color: Color(0x33bfbfbf),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // itemCH7 (78:821)
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // autogroupx3l9MA1 (TMFoHMxG7ZVZvKdvYnx3L9)
                                              padding: EdgeInsets.fromLTRB(24*fem, 0*fem, 24*fem, 50.48*fem),
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // autogroupmkuwFmB (TMFo9HMPb3pMNGwn11mKuw)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.04*fem),
                                                    width: double.infinity,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          // avatarCAd (78:827)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                                                          width: 48*fem,
                                                          height: 46.88*fem,
                                                          child: Image.asset(
                                                            'assets/UI/images/avatar.png',
                                                            width: 48*fem,
                                                            height: 46.88*fem,
                                                          ),
                                                        ),
                                                        Container(
                                                          // title7YV (78:824)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 10.96*fem, 0*fem, 0*fem),
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                // cafit3h3 (78:826)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 160*fem, 2*fem),
                                                                child: Text(
                                                                  'CaFit',
                                                                  style: SafeGoogleFont (
                                                                    'DM Sans',
                                                                    fontSize: 14*ffem,
                                                                    fontWeight: FontWeight.w700,
                                                                    height: 1.7142857143*ffem/fem,
                                                                    color: Color(0xff040415),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                // pmx3K (78:825)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 0*fem, 0*fem),
                                                                child: Text(
                                                                  '02:01 PM',
                                                                  textAlign: TextAlign.right,
                                                                  style: SafeGoogleFont (
                                                                    'DM Sans',
                                                                    fontSize: 14*ffem,
                                                                    fontWeight: FontWeight.w400,
                                                                    height: 1.7142857143*ffem/fem,
                                                                    color: Color(0xff7e7e7e),
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
                                                    // yourduelwithalexUGZ (78:823)
                                                    margin: EdgeInsets.fromLTRB(66*fem, 0*fem, 0*fem, 0*fem),
                                                    constraints: BoxConstraints (
                                                      maxWidth: 249*fem,
                                                    ),
                                                    child: Text(
                                                      'Your Duel with Alex will start today. Be well prepared to participate 💪',
                                                      style: SafeGoogleFont (
                                                        'DM Sans',
                                                        fontSize: 14*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.7142857143*ffem/fem,
                                                        color: Color(0xff040415),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // lineKny (78:822)
                                              width: double.infinity,
                                              height: 0.98*fem,
                                              decoration: BoxDecoration (
                                                borderRadius: BorderRadius.circular(0.5*fem),
                                                color: Color(0x33bfbfbf),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                    // vectorsZb (82:1460)
                    left: 39*fem,
                    top: 234*fem,
                    child: Align(
                      child: SizedBox(
                        width: 17*fem,
                        height: 15*fem,
                        child: Image.asset(
                          'assets/UI/images/vector-MtM.png',
                          width: 17*fem,
                          height: 15*fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // appbarbEh (234:2680)
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(40*fem),
              ),
              child: Center(
                // autogroup7paugmw (TMEhUhGW3PMiVQq7up7Pau)
                child: SizedBox(
                  width: 428*fem,
                  height: 105*fem,
                  child: Image.asset(
                    'assets/UI/images/auto-group-7pau.png',
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