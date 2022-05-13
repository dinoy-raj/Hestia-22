import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import '../../main.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool start = false;
  List<dynamic>? not;

  List Months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return not == null
        ? const Center(
            child: Text(
              "No Notifications",
              style: TextStyle(
                color: Constants.iconAc,
                fontFamily: "Helvetica",
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white.withOpacity(0.05)],
                stops: const [0.8, 1],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(bottom: 40, top: 30),
                itemCount: not?.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return not?[index]['type'] == "S"
                      ? AnimatedOpacity(
                          opacity: 1,
                          duration: const Duration(seconds: 1),
                          child: AnimatedPadding(
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //title
                                        AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Constants.pureBlack,
                                                  blurRadius: 100,
                                                  spreadRadius: 20,
                                                ),
                                              ],
                                              color: Colors.black),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  not?[index]['title'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Helvetica",
                                                      color:
                                                          Constants.pureWhite,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //time
                                        Text(
                                          (Months[(DateTime.parse(
                                                          not![0]["created_at"])
                                                      .month) -
                                                  1]) +
                                              " " +
                                              (DateTime.parse(not![index]
                                                          ["created_at"])
                                                      .day)
                                                  .toString() +
                                              "   " +
                                              (DateTime.parse(not![index]
                                                          ["created_at"])
                                                      .toLocal()
                                                      .hour)
                                                  .toString() +
                                              ":" +
                                              (DateTime.parse(not![index]
                                                          ["created_at"])
                                                      .toLocal()
                                                      .minute)
                                                  .toString(),
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontFamily: "Helvetica",
                                            color: Constants.pureWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        not?[index]["description"],
                                        style: const TextStyle(
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
                          ),
                        )
                      : AnimatedOpacity(
                          opacity: 1,
                          duration: const Duration(seconds: 1),
                          child: AnimatedPadding(
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //title
                                        AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Constants.pureBlack,
                                                  blurRadius: 100,
                                                  spreadRadius: 20,
                                                ),
                                              ],
                                              color: Colors.black),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  not?[index]['title'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Helvetica",
                                                      color:
                                                          Constants.pureWhite,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //time
                                        Text(
                                          (Months[(DateTime.parse(not![index]
                                                          ["created_at"])
                                                      .month) -
                                                  1]) +
                                              " " +
                                              (DateTime.parse(not![index]
                                                          ["created_at"])
                                                      .day)
                                                  .toString() +
                                              "   " +
                                              (DateTime.parse(not![index]
                                                          ["created_at"])
                                                      .toLocal()
                                                      .hour)
                                                  .toString() +
                                              ":" +
                                              (DateTime.parse(not![index]
                                                          ["created_at"])
                                                      .toLocal()
                                                      .minute)
                                                  .toString(),
                                          style: const TextStyle(
                                            fontSize: 8,
                                            fontFamily: "Helvetica",
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        not?[index]['description'],
                                        style: const TextStyle(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              height: screenHeight * .04,
                                              width: screenWidth * .32,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      auth.rejectNotification(
                                                          not?[index]['link2'],
                                                          (not?[index]['id'])
                                                              .toString());
                                                      not?.removeAt(index);
                                                    });
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                    elevation:
                                                        MaterialStateProperty
                                                            .all(0),
                                                    shadowColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                    overlayColor:
                                                        MaterialStateProperty
                                                            .all(Colors.black
                                                                .withOpacity(
                                                                    .2)),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      "Decline",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "Helvetica",
                                                          color: Colors.black),
                                                    ),
                                                  ))),
                                          Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              height: screenHeight * .04,
                                              width: screenWidth * .32,
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    if (await auth
                                                        .acceptNotification(
                                                            not?[index]
                                                                ['link1'],
                                                            (not?[index]['id'])
                                                                .toString())) {
                                                      setState(() {
                                                        print("YES");
                                                        not?.removeAt(index);
                                                      });
                                                    } else
                                                      print("NO");
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.black),
                                                    elevation:
                                                        MaterialStateProperty
                                                            .all(5),
                                                    overlayColor:
                                                        MaterialStateProperty
                                                            .all(Colors.grey
                                                                .withOpacity(
                                                                    .5)),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      "Accept",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "Helvetica",
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
                          ),
                        );
                }),
          );
  }
}
