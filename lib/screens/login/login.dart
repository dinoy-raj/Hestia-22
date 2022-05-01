import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
              height: screenHeight * 0.6,
              child: Lottie.asset(
                  'assets/animations/75705-welcome-animation.json'),
            ),
            Container(
              //color: Color(0xff121212),
              
              height: screenHeight * 0.2,
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                    
                      child: const Text(
                        
                        'Hello Hestia',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
                    child: Container(
                    
                      child: const Text(
                          'Hestia is the biggest south indian technocultural festival\nin Kerala India',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              child: RoundedButton(
                text: 'Continue with Google',
                color: Color(0xff121212),
                press: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
//rounded button

class RoundedButton extends StatelessWidget {
  final String text;
  final Color? color, textColor;
  final void Function() press;
  const RoundedButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    this.color,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.6,

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlatButton(
          //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //color: Colors.green,
                  //height: 60,
                  // width:60 ,
                  
                  child: Lottie.network(
                      'https://assets6.lottiefiles.com/private_files/lf30_3nvqj06a.json',
                      width: 70,
                      height: 80,
                      
                      ),
                      
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
