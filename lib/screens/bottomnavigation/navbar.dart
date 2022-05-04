import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/home/home.dart';
import 'package:hestia22/screens/spots/spots.dart';

import '../profile/profile.dart';
import '../schedule/schedule.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PageController pageControl = PageController();

  //index of page selected
  int index = 8;

  double opaC = 0;
  bool start = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        opaC = 1;
        start = true;
        index = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.bg,
      // backgroundColor: const Color.fromRGBO(31, 29, 43, 100),
      body: Stack(
        children: [
          PageView(
            controller: pageControl,
            physics: const NeverScrollableScrollPhysics(),
            children: const [Home(), Schedule(), Spots(), Profile()],
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
                        child: AnimatedOpacity(
                          opacity: opaC,
                          duration: const Duration(seconds: 2),
                          curve: Curves.decelerate,
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastLinearToSlowEaseIn,
                            height: screenHeight * .07,
                            width: screenWidth * .85,
                            decoration: BoxDecoration(
                              // color: Colors.white.withOpacity(.05),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Constants.navBorder),
                              gradient: LinearGradient(
                                colors: [
                                  index == 0
                                      ? Constants.grad1
                                      : Constants.grad2,
                                  index == 1
                                      ? Constants.grad1
                                      : Constants.grad2,
                                  index == 2
                                      ? Constants.grad1
                                      : Constants.grad2,
                                  index == 3
                                      ? Constants.grad1
                                      : Constants.grad2,
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
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.decelerate,
                                        height: screenHeight * .07,
                                        width: start
                                            ? screenWidth * .21
                                            : screenWidth * .05,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Icon(
                                                FontAwesomeIcons.house,
                                                size: 17,
                                                color: index == 0
                                                    ? Constants.iconAc
                                                    : Constants.iconIn,
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
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Constants.iconAc),
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
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Icon(
                                                FontAwesomeIcons.list,
                                                size: 18,
                                                color: index == 1
                                                    ? Constants.iconAc
                                                    : Constants.iconIn,
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
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Constants.iconAc),
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
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Icon(
                                                FontAwesomeIcons.signsPost,
                                                size: 18,
                                                color: index == 2
                                                    ? Constants.iconAc
                                                    : Constants.iconIn,
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
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Constants.iconAc),
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
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.decelerate,
                                        height: screenHeight * .07,
                                        width: start
                                            ? screenWidth * .21
                                            : screenWidth * .05,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Icon(
                                                FontAwesomeIcons.user,
                                                size: 18,
                                                color: index == 3
                                                    ? Constants.iconAc
                                                    : Constants.iconIn,
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
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Constants.iconAc),
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


