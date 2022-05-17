import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Center(
          child: SizedBox(
              height: screenHeight * .3,
              width: screenWidth * .3,
              child: Image.asset("assets/applogo.gif")),
        ),
      ),
    );
  }
}
