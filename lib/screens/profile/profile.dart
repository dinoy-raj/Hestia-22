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
                children: [
                  Container(
                    height: screenHeight * .13,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Constants.iconIn,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.18,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisteredEvents()));
                            },
                            child: AnimatedPadding(
                              padding: start
                                  ? const EdgeInsets.only(right: 5)
                                  : const EdgeInsets.only(right: 10),
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.decelerate,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Constants.bg,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    height: 70,
                                    width: 140,
                                    child: Center(
                                      child: Icon(
                                        Icons.event_available_outlined,
                                        color: Colors.white.withOpacity(0.5),
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Registered Events',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 16,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const CertificatesPage()));
                            },
                            child: AnimatedPadding(
                              padding: start
                                  ? const EdgeInsets.only(left: 5)
                                  : const EdgeInsets.only(left: 10),
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.decelerate,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Icon(
                                        Icons.badge_outlined,
                                        size: 30,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Constants.bg,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    height: 70,
                                    width: 140,
                                    //color: const Color(0xff121212)
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Certificates',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.2),
                                        fontSize: 16,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 800),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Constants.iconAc.withOpacity(0.1),
                            ),
                            child: AnimatedPadding(
                              padding: start
                                  ? const EdgeInsets.only(
                                      left: 10,
                                    )
                                  : EdgeInsets.zero,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.decelerate,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    height: 60,
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Icon(
                                            Icons.person_outline,
                                            color: Colors.white.withOpacity(.5),
                                            size: 20,
                                            // Image.asset('assets/icons/person.png'),
                                          ),
                                        ),
                                        Expanded(
                                          child: AnimatedPadding(
                                            padding: start
                                                ? const EdgeInsets.only(
                                                    left: 20)
                                                : const EdgeInsets.only(
                                                    left: 35),
                                            duration: const Duration(
                                                milliseconds: 800),
                                            curve: Curves.decelerate,
                                            child: Text(
                                              widget.data == null
                                                  ? ""
                                                  : widget.data!['name']
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.5),
                                                  fontSize: 16,
                                                  fontFamily: 'Helvetica',
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Icon(
                                            CupertinoIcons.phone,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            size: 20,
                                          ),
                                        ),
                                        Expanded(
                                          child: AnimatedPadding(
                                            padding: start
                                                ? const EdgeInsets.only(
                                                    left: 20)
                                                : const EdgeInsets.only(
                                                    left: 35),
                                            duration: const Duration(
                                                milliseconds: 800),
                                            curve: Curves.decelerate,
                                            child: Text(
                                              widget.data == null
                                                  ? ""
                                                  : "+91 " +
                                                      widget
                                                          .data!['phone_number']
                                                          .toString()
                                                          .substring(3),
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.5),
                                                  fontSize: 16,
                                                  fontFamily: 'Helvetica',
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Icon(
                                            CupertinoIcons.building_2_fill,
                                            color: Colors.white.withOpacity(.5),
                                            size: 20,
                                          ),
                                        ),
                                        Expanded(
                                          child: AnimatedPadding(
                                            padding: start
                                                ? const EdgeInsets.only(
                                                    left: 20)
                                                : const EdgeInsets.only(
                                                    left: 35),
                                            duration: const Duration(
                                                milliseconds: 800),
                                            curve: Curves.decelerate,
                                            child: Text(
                                              widget.data == null
                                                  ? ""
                                                  : widget.data!['dept_name']
                                                          .toString() +
                                                      ", " +
                                                      widget
                                                          .data!['college_name']
                                                          .toString(),
                                              style: TextStyle(
                                                  overflow: TextOverflow.clip,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                  fontSize: 16,
                                                  fontFamily: 'Helvetica',
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileRegistration()));
                          },
                          child: const Text(
                            "Update profile",
                            style: TextStyle(
                              color: Constants.iconAc,
                            ),
                          )),
                    ),
                  ),
                  AnimatedPadding(
                    padding: start
                        ? const EdgeInsets.only(left: 20, right: 20)
                        : const EdgeInsets.only(left: 10, right: 10),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.decelerate,
                    child: Center(
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
