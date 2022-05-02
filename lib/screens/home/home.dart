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

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(
                  height: screenHeight * .1,
                  width: screenWidth,
                ),
                AnimatedContainer(duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                height: notPressed?screenHeight*.6:0,
                  width: screenWidth*.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Constants.iconIn
                  ),
                ),
              ],
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * .1,
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            height: screenHeight * .051,
                            width: screenHeight * .051,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constants.iconAc,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                notPressed = !notPressed;
                              });
                            },
                            child: Container(
                              height: screenHeight * .05,
                              width: screenHeight * .05,
                              color: Constants.bg,
                              child: const Icon(
                                FontAwesomeIcons.bell,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * .7,
                        child: Center(
                          child: AnimatedOpacity(
                            duration: const Duration(seconds: 3),
                            curve: Curves.decelerate,
                            opacity: start ? 1 : 0,
                            child: const Text(
                              "Hestia 22",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'helvetica',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
