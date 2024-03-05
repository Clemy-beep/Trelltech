import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'auth_service.dart';

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // iphone81rW2 (4:95)
        padding: EdgeInsets.fromLTRB(0 * fem, 25 * fem, 0 * fem, 0 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // log1JWS (3:2)
              margin:
                  EdgeInsets.fromLTRB(28.44 * fem, 0 * fem, 0 * fem, 79 * fem),
              width: 35.12 * fem,
              height: 40 * fem,
              child: Image.asset(
                'assets/images/assets/images/a1152233d056776b063f2a0726983f0a.png',
                width: 35.12 * fem,
                height: 40 * fem,
              ),
            ),
            Container(
              // frame1aD4 (4:93)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 36 * fem),
              width: 376 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group13cS (3:37)
                    width: double.infinity,
                    height: 66 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle2Md8 (1:7)
                          left: 46 * fem,
                          top: 21 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 270 * fem,
                              height: 35 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8 * fem),
                                  color: const Color(0xfff0c83c),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // trelltechkHt (1:5)
                          left: 48.5 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 279 * fem,
                              height: 48 * fem,
                              child: Text(
                                'TrellTech',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'BungeeShade-Regular',
                                  fontSize: 40 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2 * ffem / fem,
                                  color: const Color(0xff141946),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupvk4sYzS (83NdM84SnRhaS3ne2YvK4S)
                    padding: EdgeInsets.fromLTRB(
                        80.5 * fem, 32.5 * fem, 80.5 * fem, 0 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group25Ua (4:92)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 32.5 * fem),
                          width: double.infinity,
                          height: 53 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // manageyourteamsprojectsanytime (1:6)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Center(
                                  child: Align(
                                    child: SizedBox(
                                      width: 215 * fem,
                                      height: 53 * fem,
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'Lexend Exa',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.25 * ffem / fem,
                                            letterSpacing: 1.4 * fem,
                                            color: const Color(0xff141946),
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  'manage your teams & projects ',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Exa',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.25 * ffem / fem,
                                                letterSpacing: 1.4 * fem,
                                                color: const Color(0xff141946),
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'anytime',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Exa',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.25 * ffem / fem,
                                                letterSpacing: 1.4 * fem,
                                                decoration:
                                                    TextDecoration.underline,
                                                color: const Color(0xff141946),
                                                decorationColor:
                                                    const Color(0xff141946),
                                              ),
                                            ),
                                            TextSpan(
                                              text: ', ',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Exa',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.25 * ffem / fem,
                                                letterSpacing: 1.4 * fem,
                                                color: const Color(0xff141946),
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'anywhere',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Exa',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.25 * ffem / fem,
                                                letterSpacing: 1.4 * fem,
                                                decoration:
                                                    TextDecoration.underline,
                                                color: const Color(0xff141946),
                                                decorationColor:
                                                    const Color(0xff141946),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // line36Ce (9:71)
                                left: 107.5 * fem,
                                top: 34 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 81 * fem,
                                    height: 0.5 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/line-3.png',
                                      width: 81 * fem,
                                      height: 0.5 * fem,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          // mange1PxS (4:90)
                          width: 140 * fem,
                          height: 120 * fem,
                          child: Image.asset(
                            'assets/page-1/images/mange-1.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group38QE (4:99)
              margin:
                  EdgeInsets.fromLTRB(61 * fem, 0 * fem, 61 * fem, 74 * fem),
              width: double.infinity,
              height: 62 * fem,
              decoration: BoxDecoration(
                color: const Color(0xfffcda5e),
                borderRadius: BorderRadius.circular(16 * fem),
              ),
              child: Center(
                child: Center(
                  child: Text(
                    'get started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lexend Exa',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      letterSpacing: 1.6 * fem,
                      color: const Color(0xff141946),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // autogroupjj6eMnn (83NczxyN7NpNr92gcsjj6E)
              padding: EdgeInsets.fromLTRB(
                  131 * fem, 14 * fem, 129.05 * fem, 13 * fem),
              width: double.infinity,
              height: 47 * fem,
              decoration: BoxDecoration(
                color: const Color(0xfffcda5e),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x3f000000),
                    offset: Offset(0 * fem, 0 * fem),
                    blurRadius: 4 * fem,
                  ),
                ],
              ),
              child: SizedBox(
                // frame2F7U (4:114)
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // contactsupportPjU (4:119)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 31 * fem, 0 * fem),
                      width: 17.37 * fem,
                      height: 20 * fem,
                      child: Image.asset(
                        'assets/page-1/images/contactsupport.png',
                        width: 17.37 * fem,
                        height: 20 * fem,
                      ),
                    ),
                    Container(
                      // policytw8 (4:125)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 31 * fem, 0 * fem),
                      width: 15.66 * fem,
                      height: 20 * fem,
                      child: Image.asset(
                        'assets/page-1/images/policy.png',
                        width: 15.66 * fem,
                        height: 20 * fem,
                      ),
                    ),
                    SizedBox(
                      // vectord82 (4:113)
                      width: 19.92 * fem,
                      height: 20 * fem,
                      child: Image.asset(
                        'assets/page-1/images/vector.png',
                        width: 19.92 * fem,
                        height: 20 * fem,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
