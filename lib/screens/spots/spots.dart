import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/spots/cards.dart';

class SpotPage extends StatefulWidget {
  const SpotPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SpotPageState();
  }
}

class SpotPageState extends State<SpotPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.color1,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Center(
              child: Text(
                "Explore",
                style: TextStyle(
                  letterSpacing: 7,
                  color: Constants.color2,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText(
                    "TKMCE",
                    textStyle: TextStyle(
                      color: Constants.color3,
                      letterSpacing: 3,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RotateAnimatedText(
                    "HESTIA'22",
                    textStyle: TextStyle(
                      color: Constants.color3,
                      letterSpacing: 1,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RotateAnimatedText(
                    "UTOPIA",
                    textStyle: TextStyle(
                      color: Constants.color3,
                      letterSpacing: 1,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Constants.color3.withOpacity(.2),
                          Constants.color3.withOpacity(.5),
                        ],
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.grey),
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Where do you wanna go?",
                            hintStyle: TextStyle(
                              color: Colors.white24,
                            ),
                            icon: Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            const Cards(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
