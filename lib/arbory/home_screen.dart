import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0 * fem),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25 * fem),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                width: 35.12 * fem,
                height: 40 * fem,
                child: Image.asset(
                  'assets/images/menu.png',
                  width: screenWidth * fem,
                  height: screenWidth * fem,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 66 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8 * fem),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 46 * fem,
                            top: 21 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 270 * fem,
                                height: 35 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(8 * fem),
                                    color: const Color(0xfff0c83c),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
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
                                    fontFamily: 'BungeeShade',
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 80.5 * fem,
                        vertical: 50.5 * fem,
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 32.5 * fem),
                            width: double.infinity,
                            height: 53 * fem,
                            child: Stack(
                              children: [
                                Positioned(
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
                                                  color:
                                                      const Color(0xff141946),
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
                                                  color:
                                                      const Color(0xff141946),
                                                  decorationColor:
                                                      const Color(0xfff0c83c),
                                                  decorationThickness: 2,
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
                                                  color:
                                                      const Color(0xff141946),
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
                                                  color:
                                                      const Color(0xff141946),
                                                  decorationColor:
                                                      const Color(0xfff0c83c),
                                                  decorationThickness: 2,
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
                                  left: 107.5 * fem,
                                  top: 34 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 81 * fem,
                                      height: 0.5 * fem,
                                      child: Image.asset(
                                        'assets/images/menu.png',
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
                            width: 140 * fem,
                            height: 120 * fem,
                            child: Image.asset('assets/images/menu.png'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                width: double.infinity,
                height: 62 * fem,
                decoration: BoxDecoration(
                  color: const Color(0xfffcda5e),
                  borderRadius: BorderRadius.circular(16 * fem),
                ),
                child: Center(
                  child: Text(
                    'Get started',
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
              Container(
                padding: EdgeInsets.fromLTRB(
                    131 * fem, 14 * fem, 129.05 * fem, 13 * fem),
                width: double.infinity,
                height: 47 * fem,
                decoration: BoxDecoration(
                  color: const Color(0xfffcda5e),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff141946),
                      offset: Offset(0 * fem, 0 * fem),
                      blurRadius: 4 * fem,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 20 * fem,
                        child: IconButton(
                          icon: const Icon(Icons.question_mark),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Container(
                        height: 20 * fem,
                        child: IconButton(
                          icon: const Icon(Icons.manage_search),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Container(
                        height: 20 * fem,
                        child: IconButton(
                          icon: const Icon(Icons.bug_report),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ],
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
