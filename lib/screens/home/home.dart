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
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastLinearToSlowEaseIn,
                              height: notPressed?screenHeight * .048:screenHeight * .05,
                              width:  notPressed?screenHeight * .048:screenHeight * .05,
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
                      ],
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
