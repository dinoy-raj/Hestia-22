import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool start = false;
  bool notPressed = false;
  bool proTap = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      proTap = false;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        start = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
        child: Stack(
          children: [
            //notification page
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * .1,
                  width: screenWidth,
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: notPressed ? screenHeight * .6 : 0,
                  width: screenWidth * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Constants.iconIn),
                ),
              ],
            ),
            //homepage body part
            AnimatedPadding(
              duration: const Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              padding: start
                  ? const EdgeInsets.only(left: 10, right: 10)
                  : const EdgeInsets.only(left: 0, right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //header section
                  SizedBox(
                    height: screenHeight * .1,
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //welcome note
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(seconds: 3),
                              curve: Curves.decelerate,
                              opacity: start ? 1 : 0,
                              child: const Text(
                                "Hi, Dinoy Raj 👋",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'helvetica',
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * .005,
                            ),
                            AnimatedOpacity(
                              duration: const Duration(seconds: 3),
                              curve: Curves.decelerate,
                              opacity: start ? 1 : 0,
                              child: Text(
                                "Explore Events",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    fontFamily: 'helvetica',
                                    color: Constants.iconIn),
                              ),
                            ),
                          ],
                        ),

                        //notification bell
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              notPressed = !notPressed;
                            });
                          },
                          child: AnimatedOpacity(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            opacity: start ? 1 : 0,
                            child: Badge(
                              badgeColor: Constants.iconAc,
                              badgeContent: const Text(
                                "1",
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 700),
                              animationType: BadgeAnimationType.scale,
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 2),
                                curve: Curves.fastLinearToSlowEaseIn,
                                height: notPressed
                                    ? screenHeight * .048
                                    : screenHeight * .05,
                                width: notPressed
                                    ? screenHeight * .048
                                    : screenHeight * .05,
                                decoration: BoxDecoration(
                                    border: notPressed
                                        ? Border.all(color: Constants.iconAc)
                                        : Border.all(color: Colors.transparent),
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(12)),
                                child: AnimatedOpacity(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  opacity: start ? 1 : 0,
                                  child: const Icon(
                                    FontAwesomeIcons.bell,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //search & sort part
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate,
                    opacity: start ? 1 : 0,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: screenHeight * .065,
                      width: screenWidth * .92,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight * .05,
                            width: screenHeight * .05,
                            child: Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              size: 17,
                              color: Constants.iconIn,
                            ),
                          ),
                          AnimatedPadding(
                            duration: const Duration(seconds: 1),
                            curve: Curves.decelerate,
                            padding: start
                                ? const EdgeInsets.only(left: 0)
                                : const EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: screenHeight * .05,
                              width: screenWidth * .65,
                              child: TextFormField(
                                scrollPhysics: const BouncingScrollPhysics(),
                                cursorColor: Constants.iconIn,
                                cursorRadius: const Radius.circular(10),
                                style: const TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Constants.iconAc,
                                  fontSize: 16,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Discover new event",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Helvetica',
                                    color: Constants.iconIn,
                                    fontSize: 14,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  fillColor: Colors.transparent,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 1800),
                            curve: Curves.decelerate,
                            opacity: start ? 1 : 0,
                            child: SizedBox(
                              height: screenHeight * .05,
                              width: screenHeight * .05,
                              child: Icon(
                                FontAwesomeIcons.sliders,
                                color: Constants.iconIn,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
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
