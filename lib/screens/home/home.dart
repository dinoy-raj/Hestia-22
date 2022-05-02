import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * .1,
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  const Text(
                    "Hestia 22",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'helvetica',
                        color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: screenHeight * .05,
                      width: screenHeight * .05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(8),
                      //     child: Image.network("https://lh3.googleusercontent.com/a-/AOh14Gh1eSdScUiYA2M3Sar5xU_J5kHiuAMS6mMYhc9_8w=s360-p-rw-no",fit: BoxFit.cover,)),
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
