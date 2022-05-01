import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.5,
              
              child:Lottie.asset('assets/animations/75705-welcome-animation.json'),
            ),
            Container(
              height: screenHeight * 0.3,
              child: Column(children: const [Text('Hello Hestia', style: TextStyle(fontFamily:'Helvetica',fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,))]),
            ),
            Container(
              height: screenHeight * 0.2,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
