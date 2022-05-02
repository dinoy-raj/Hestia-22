import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/screens/home/home.dart';
import 'package:hestia22/screens/map/map.dart';

import '../profile/profile.dart';
import '../schedule/schedule.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PageController pageControl = PageController();

  //boolean variables to control nav item selection ( on tap )
  bool selectHome = true;
  bool selectSchedule = false;
  bool selectMap = false;
  bool selectProfile = false;

  //index of page selected
  int index = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Colors.black,
      backgroundColor: const Color.fromRGBO(27, 28, 33, 100),
      // backgroundColor: const Color.fromRGBO(31, 29, 43, 100),
      body: Stack(
        children: [
          PageView(
            controller: pageControl,
            physics: const NeverScrollableScrollPhysics(),
            children: const [Home(), Schedule(), MapPage(), Profile()],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * .03),
              child: Stack(
                children: [
                  SizedBox(
                    height: screenHeight * .07,
                    width: screenWidth * .85,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 20,
                          sigmaY: 20,
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: screenHeight * .07,
                          width: screenWidth * .85,
                          decoration: BoxDecoration(
                            // color: Colors.white.withOpacity(.05),
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Colors.black.withOpacity(.1)),
                            gradient: LinearGradient(
                              colors: [
                                index == 0 ? Colors.black12 : Colors.black,
                                index == 1 ? Colors.black12 : Colors.black,
                                index == 2 ? Colors.black12 : Colors.black,
                                index == 3 ? Colors.black12 : Colors.black,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        index = 0;
                                        switchPage(index);
                                      });
                                    },
                                    child: SizedBox(
                                      height: screenHeight * .07,
                                      width: screenWidth * .21,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Icon(
                                              FontAwesomeIcons.house,
                                              size: 17,
                                              color: index == 0
                                                  ? Color.fromRGBO(
                                                      224, 212, 254, 100)
                                                  : Colors.grey
                                                      .withOpacity(.35),
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration:
                                                const Duration(seconds: 2),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn,
                                            height: index == 0
                                                ? screenHeight * .0035
                                                : 0,
                                            width: index == 0
                                                ? screenHeight * .0035
                                                : 0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    224, 212, 254, 100)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        index = 1;
                                        switchPage(index);
                                      });
                                    },
                                    child: SizedBox(
                                      height: screenHeight * .07,
                                      width: screenWidth * .21,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Icon(
                                              FontAwesomeIcons.list,
                                              size: 18,
                                              color: index == 1
                                                  ? Color.fromRGBO(
                                                      224, 212, 254, 100)
                                                  : Colors.grey
                                                      .withOpacity(.35),
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration:
                                                const Duration(seconds: 2),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn,
                                            height: index == 1
                                                ? screenHeight * .0035
                                                : 0,
                                            width: index == 1
                                                ? screenHeight * .0035
                                                : 0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    224, 212, 254, 100)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        index = 2;
                                        switchPage(index);
                                      });
                                    },
                                    child: SizedBox(
                                      height: screenHeight * .07,
                                      width: screenWidth * .21,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Icon(
                                              FontAwesomeIcons.signsPost,
                                              size: 18,
                                              color: index == 2
                                                  ? Color.fromRGBO(
                                                      224, 212, 254, 100)
                                                  : Colors.grey
                                                      .withOpacity(.35),
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration:
                                                const Duration(seconds: 2),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn,
                                            height: index == 2
                                                ? screenHeight * .0035
                                                : 0,
                                            width: index == 2
                                                ? screenHeight * .0035
                                                : 0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    224, 212, 254, 100)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        index = 3;
                                        switchPage(index);
                                      });
                                    },
                                    child: SizedBox(
                                      height: screenHeight * .07,
                                      width: screenWidth * .21,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Icon(
                                              FontAwesomeIcons.user,
                                              size: 18,
                                              color: index == 3
                                                  ? Color.fromRGBO(
                                                      224, 212, 254, 100)
                                                  : Colors.grey
                                                      .withOpacity(.35),
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration:
                                                const Duration(seconds: 2),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn,
                                            height: index == 3
                                                ? screenHeight * .0035
                                                : 0,
                                            width: index == 3
                                                ? screenHeight * .0035
                                                : 0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    224, 212, 254, 100)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
    );
  }

  void switchPage(int index) {
    pageControl.animateToPage(index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
  }
}
