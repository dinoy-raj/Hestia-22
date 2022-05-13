import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/profile/certificates.dart';
import 'package:hestia22/screens/profile/profile_registration.dart';
import 'package:hestia22/screens/profile/registered_events.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.data}) : super(key: key);
  final Map? data;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool start = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        start = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      curve: Curves.decelerate,
      opacity: start ? 1 : 0,
      child: Scaffold(
        backgroundColor: Constants.sc,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AnimatedPadding(
              duration: const Duration(seconds: 1),
              curve: Curves.decelerate,
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 30, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * .2,
                    child: Stack(
                      children: [
                        Container(
                          height: screenHeight * .13,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: Constants.iconIn,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * .06),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: screenHeight * .12,
                                width: screenHeight * .13,
                                decoration: BoxDecoration(
                                  color: Constants.iconAc,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(auth
                                        .googleSignIn.currentUser!.photoUrl!),
                                  ),
                                  border: Border.all(color: Constants.iconAc),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: screenHeight * .05,
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.data == null
                              ? ""
                              : widget.data!['name'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1,
                            color: Colors.white,
                            fontFamily: "Helvetica",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          auth.googleSignIn.currentUser!.email,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Constants.iconIn,
                            fontFamily: "Helvetica",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: screenHeight * .1,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: screenHeight * .07,
                          width: screenWidth * .40,
                          decoration: BoxDecoration(
                              color: Constants.iconAc,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Registered Events",
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: screenHeight * .07,
                          width: screenWidth * .40,
                          decoration: BoxDecoration(
                              color: Constants.bg,
                              border: Border.all(
                                  color: Constants.iconAc, width: .2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Certificates",
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Constants.iconIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: screenHeight * .25,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.bg,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * .04,
                          width: screenWidth * .8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [],
                          ),
                        ),
                        Container(
                          height: screenHeight * .0005,
                          width: screenWidth * .8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constants.iconIn),
                        ),
                        SizedBox(
                          height: screenHeight * .04,
                          width: screenWidth * .8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [],
                          ),
                        ),
                        Container(
                          height: screenHeight * .0005,
                          width: screenWidth * .8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constants.iconIn),
                        ),
                        Container(
                          height: screenHeight * .04,
                          width: screenWidth * .8,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Constants.iconAc, width: 1),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      height: screenHeight * .05,
                      width: screenWidth,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                          overlayColor:
                              MaterialStateProperty.all(Colors.black45),
                          elevation: MaterialStateProperty.all(5),
                        ),
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 800),
                              () async {
                            await auth.logOut();
                          });
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Logout',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Constants.iconAc,
                                    fontSize: 16,
                                    fontFamily: 'Helvetica',
                                  )),
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
        ),
      ),
    );
  }
}
