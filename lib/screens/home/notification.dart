import 'dart:developer';

import 'package:flutter/material.dart';
import '../../main.dart';
import '../../services/django/google_auth.dart';
import 'home.dart';

import 'package:hestia22/services/django/google_auth.dart' as ga;

GoogleAuth auth = GoogleAuth();

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool start = false;
  List<dynamic>? not;
  @override
  void initState() {
    super.initState();

    auth.getNotifications().then((value) {
      setState(() {
        not = value;
      });
    });

    start = false;
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          start = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    log(not.toString());
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: 1,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          return true
              ? AnimatedPadding(
                  duration: const Duration(seconds: 1),
                  curve: Curves.decelerate,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    decoration: BoxDecoration(
                      color: Constants.iconIn.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Constants.pureBlack,
                                    blurRadius: 100,
                                    spreadRadius: 20,
                                  ),
                                ],
                                color: Colors.black),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "General",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Helvetica",
                                        color: Constants.pureWhite,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "from today on wards  the updates regarding your project should be updated in this file. If you havent done anything mention that. Dont leave it blank",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica',
                                fontSize: 12,
                                height: 2,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : AnimatedPadding(
                  duration: const Duration(seconds: 1),
                  curve: Curves.decelerate,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    decoration: BoxDecoration(
                      color: Constants.iconAc.withOpacity(.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Constants.pureBlack,
                                    blurRadius: 100,
                                    spreadRadius: 20,
                                  ),
                                ],
                                color: Colors.black),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Invitation",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Helvetica",
                                        color: Constants.pureWhite,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Do you want to join with @amal for workshop?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica',
                                fontSize: 12,
                                height: 2,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    height: screenHeight * .04,
                                    width: screenWidth * .32,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          elevation:
                                              MaterialStateProperty.all(0),
                                          shadowColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.black.withOpacity(.2)),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Decline",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                fontFamily: "Helvetica",
                                                color: Colors.black),
                                          ),
                                        ))),
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    height: screenHeight * .04,
                                    width: screenWidth * .32,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                          elevation:
                                              MaterialStateProperty.all(5),
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.grey.withOpacity(.5)),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Accept",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                fontFamily: "Helvetica",
                                                color: Colors.white),
                                          ),
                                        ))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
        });
  }
}
