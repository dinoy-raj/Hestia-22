import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/profile/certificates.dart';
import 'package:hestia22/screens/profile/profile_registration.dart';
import 'package:hestia22/screens/profile/registered_events.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.data}) : super(key: key);
  final Map? data;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool det = false;
  bool con = false;

  final Uri _terms =
      Uri.parse('https://www.hestiatkmce.live/termsandcondition');
  final Uri _policy = Uri.parse('https://www.hestiatkmce.live/privacypolicy');
  final Uri _site = Uri.parse('https://www.hestiatkmce.live/');
  final Uri _tkm = Uri.parse('https://www.tkmce.ac.in/');
  final Uri _mail = Uri.parse('mailto:support@hestiatkmce.live');

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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimatedPadding(
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate,
            padding: start
                ? const EdgeInsets.only(
                    left: 15, right: 15, top: 45, bottom: 20)
                : const EdgeInsets.only(left: 8, right: 8, top: 45, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //header image
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
                                  image: NetworkImage(
                                      auth.googleSignIn.currentUser!.photoUrl!),
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

                //name and email
                SizedBox(
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

                //events and certificates
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisteredEvents()));
                        },
                        hoverColor: Constants.iconIn,
                        child: Container(
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
                      ),
                      Container(
                        height: screenHeight * .07,
                        width: screenWidth * .40,
                        decoration: BoxDecoration(
                            color: Constants.bg,
                            border:
                                Border.all(color: Constants.iconAc, width: .2),
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
                  height: 5,
                ),

                //menu tiles
                Container(
                  height: screenHeight * .4,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: screenHeight * .35,
                        width: screenWidth * .85,
                        child: Stack(
                          children: [
                            Container(
                              height: screenHeight * .35,
                              width: screenWidth * .85,
                              decoration: BoxDecoration(
                                color: Constants.bg,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //personal details
                                    Container(
                                      height: screenHeight * .075,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              det = true;
                                            });
                                          },
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            shadowColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: screenHeight * .05,
                                                width: screenHeight * .05,
                                                decoration: BoxDecoration(
                                                  color: Constants.sc,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Center(
                                                  child: Icon(
                                                    FontAwesomeIcons.userLarge,
                                                    color: Constants.iconAc,
                                                    size: 10,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: screenWidth * .1,
                                              ),
                                              const Text(
                                                "Personal details",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "Helvetica",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )),
                                    ),

                                    //terms and conditions
                                    Container(
                                      height: screenHeight * .075,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ElevatedButton(
                                          onPressed: _launchTerms,
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            shadowColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: screenHeight * .05,
                                                width: screenHeight * .05,
                                                decoration: BoxDecoration(
                                                  color: Constants.sc,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Center(
                                                  child: Icon(
                                                    FontAwesomeIcons.alignLeft,
                                                    color: Constants.iconAc,
                                                    size: 10,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: screenWidth * .1,
                                              ),
                                              const Text(
                                                "Terms & Conditions",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "Helvetica",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )),
                                    ),

                                    //privacy policy
                                    Container(
                                      height: screenHeight * .075,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ElevatedButton(
                                          onPressed: _launchPolicy,
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            shadowColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: screenHeight * .05,
                                                width: screenHeight * .05,
                                                decoration: BoxDecoration(
                                                  color: Constants.sc,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Center(
                                                  child: Icon(
                                                    FontAwesomeIcons.copyright,
                                                    color: Constants.iconAc,
                                                    size: 10,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: screenWidth * .1,
                                              ),
                                              const Text(
                                                "Privacy Policy",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "Helvetica",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )),
                                    ),

                                    //contact us
                                    Container(
                                      height: screenHeight * .075,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              con = true;
                                            });
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            shadowColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: screenHeight * .05,
                                                width: screenHeight * .05,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Constants.sc),
                                                child: const Center(
                                                  child: Icon(
                                                    FontAwesomeIcons.headset,
                                                    color: Constants.iconAc,
                                                    size: 10,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: screenWidth * .1,
                                              ),
                                              const Text(
                                                "Contact Us",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "Helvetica",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //personal details drop down
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.decelerate,
                              height: det ? screenHeight * .35 : 0,
                              width: screenWidth * .85,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SingleChildScrollView(
                                child: AnimatedPadding(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.decelerate,
                                  padding: det
                                      ? const EdgeInsets.only(
                                          top: 8.0, left: 20, right: 20)
                                      : const EdgeInsets.only(
                                          top: 8.0, left: 10, right: 10),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: screenHeight * .05,
                                        width: screenWidth,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //title : personal details
                                            AnimatedOpacity(
                                              duration:
                                                  const Duration(seconds: 3),
                                              curve: Curves.decelerate,
                                              opacity: det ? 1 : 0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: screenHeight * .015,
                                                    width: screenWidth * .004,
                                                    decoration: BoxDecoration(
                                                        color: Constants.iconAc,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                  ),
                                                  Container(
                                                    width: screenWidth * .02,
                                                  ),
                                                  const Text(
                                                    "personal Details",
                                                    style: TextStyle(
                                                      color: Constants.iconAc,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Helvetica",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            //close button
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  det = false;
                                                });
                                              },
                                              child: AnimatedOpacity(
                                                duration:
                                                    const Duration(seconds: 3),
                                                curve: Curves.decelerate,
                                                opacity: det ? 1 : 0,
                                                child: Container(
                                                  height: screenHeight * .03,
                                                  width: screenHeight * .03,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      border: Border.all(
                                                          color: Constants
                                                              .iconAc
                                                              .withOpacity(
                                                                  .1))),
                                                  child: const Icon(
                                                    Icons.close_rounded,
                                                    size: 20,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      //details container
                                      AnimatedOpacity(
                                        duration: const Duration(seconds: 3),
                                        curve: Curves.decelerate,
                                        opacity: det ? 1 : 0,
                                        child: Container(
                                          height: screenHeight * .2,
                                          width: screenWidth,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //phone number
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  SizedBox(
                                                    height: screenHeight * .05,
                                                    width: screenWidth * .3,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Phone",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Helvetica",
                                                              fontSize: 13,
                                                              color: Constants
                                                                  .iconIn),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: screenHeight * .01,
                                                    width: screenWidth * .003,
                                                    decoration: BoxDecoration(
                                                        color: Constants.iconAc,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
                                                  ),
                                                  Container(
                                                    height: screenHeight * .05,
                                                    width: screenWidth * .4,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          widget.data == null
                                                              ? ""
                                                              : "+91 " +
                                                                  widget.data![
                                                                          'phone_number']
                                                                      .toString()
                                                                      .substring(
                                                                          3),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Helvetica",
                                                              fontSize: 13,
                                                              color: Constants
                                                                  .iconIn),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              //department
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  SizedBox(
                                                    height: screenHeight * .05,
                                                    width: screenWidth * .3,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Department",
                                                          style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Helvetica",
                                                              fontSize: 13,
                                                              color: Constants
                                                                  .iconIn),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: screenHeight * .01,
                                                    width: screenWidth * .003,
                                                    decoration: BoxDecoration(
                                                        color: Constants.iconAc,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
                                                  ),
                                                  Container(
                                                    height: screenHeight * .05,
                                                    width: screenWidth * .4,
                                                    child: Center(
                                                      child: Text(
                                                        widget.data == null
                                                            ? ""
                                                            : widget.data ==
                                                                    null
                                                                ? ""
                                                                : widget.data![
                                                                        'dept_name']
                                                                    .toString(),
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                "Helvetica",
                                                            fontSize: 13,
                                                            color: Constants
                                                                .iconIn),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              //college
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    height: screenHeight * .05,
                                                    width: screenWidth * .7,
                                                    child: Center(
                                                      child: Text(
                                                        widget.data == null
                                                            ? ""
                                                            : widget.data ==
                                                                    null
                                                                ? ""
                                                                : widget.data ==
                                                                        null
                                                                    ? ""
                                                                    : widget
                                                                        .data![
                                                                            'college_name']
                                                                        .toString(),
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                "Helvetica",
                                                            fontSize: 13,
                                                            color: Constants
                                                                .iconIn),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      //edit profile button
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * .02),
                                        child: AnimatedOpacity(
                                          duration: const Duration(seconds: 3),
                                          curve: Curves.decelerate,
                                          opacity: det ? 1 : 0,
                                          child: Container(
                                            height: screenHeight * .04,
                                            width: screenWidth,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ProfileRegistration()));
                                              },
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Constants.iconAc)),
                                              child: const Text(
                                                "Edit Profile",
                                                style: TextStyle(
                                                  fontFamily: "Helvetica",
                                                  fontWeight: FontWeight.bold,
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
                            ),

                            //contact us
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.decelerate,
                              height: con ? screenHeight * .35 : 0,
                              width: screenWidth * .85,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SingleChildScrollView(
                                child: AnimatedPadding(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.decelerate,
                                  padding: con
                                      ? const EdgeInsets.only(
                                          top: 8.0, left: 20, right: 20)
                                      : const EdgeInsets.only(
                                          top: 8.0, left: 10, right: 10),
                                  child: AnimatedOpacity(
                                    duration: const Duration(seconds: 4),
                                    curve: Curves.decelerate,
                                    opacity: con ? 1 : 0,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: screenHeight * .05,
                                          width: screenWidth,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              //close button
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    con = false;
                                                  });
                                                },
                                                child: Container(
                                                  height: screenHeight * .03,
                                                  width: screenHeight * .03,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      border: Border.all(
                                                          color: Constants
                                                              .iconAc
                                                              .withOpacity(
                                                                  .1))),
                                                  child: const Icon(
                                                    Icons.close_rounded,
                                                    size: 20,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),

                                        AnimatedOpacity(
                                          duration: const Duration(seconds: 4),
                                          curve: Curves.decelerate,
                                          opacity: con ? 1 : 0,
                                          child: SizedBox(
                                            height: screenHeight * .06,
                                            width: screenWidth,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: screenHeight * .06,
                                                  width: screenHeight * .06,
                                                  decoration: BoxDecoration(
                                                      image: const DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: AssetImage(
                                                              "assets/logo/app-icon.png")),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Constants
                                                              .iconAc)),
                                                ),
                                                Container(
                                                  width: screenWidth * .05,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      "Hestia'22",
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontFamily:
                                                              "Helvetica",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                    Container(
                                                      height:
                                                          screenHeight * .005,
                                                    ),
                                                    const Text(
                                                      "Spirit of Tomorrow",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontFamily:
                                                              "Helvetica",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: screenHeight * .05,
                                        ),

                                        //college site
                                        AnimatedOpacity(
                                          duration: Duration(seconds: 4),
                                          curve: Curves.decelerate,
                                          opacity: con ? 1 : 0,
                                          child: Container(
                                            height: screenHeight * .04,
                                            width: screenWidth,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                    color: Constants.iconAc,
                                                    width: 1)),
                                            child: ElevatedButton(
                                              onPressed: _launchHestia,
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Constants
                                                              .transparent)),
                                              child: const Text(
                                                "Official Website",
                                                style: TextStyle(
                                                  fontFamily: "Helvetica",
                                                  color: Constants.iconAc,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        //email
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * .02),
                                          child: AnimatedOpacity(
                                            duration:
                                                const Duration(seconds: 4),
                                            curve: Curves.decelerate,
                                            opacity: con ? 1 : 0,
                                            child: Container(
                                              height: screenHeight * .04,
                                              width: screenWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ElevatedButton(
                                                onPressed: _launchMail,
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Constants
                                                                .iconAc)),
                                                child: const Text(
                                                  "Mail Us",
                                                  style: TextStyle(
                                                    fontFamily: "Helvetica",
                                                    fontWeight: FontWeight.bold,
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //logout button
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Constants.iconAc, width: 1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    height: screenHeight * .05,
                    width: screenWidth * .85,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.black45),
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
    );
  }

  void _launchTerms() async {
    if (!await launchUrl(_terms)) throw 'Could not launch $_terms';
  }

  void _launchPolicy() async {
    if (!await launchUrl(_policy)) throw 'Could not launch $_policy';
  }

  void _launchHestia() async {
    if (!await launchUrl(_site)) throw 'Could not launch $_site';
  }

  void _launchMail() async {
    if (!await launchUrl(_mail)) throw 'Could not launch $_mail';
  }

  void _launchTkm() async {
    if (!await launchUrl(_tkm)) throw 'Could not launch $_tkm';
  }
}
