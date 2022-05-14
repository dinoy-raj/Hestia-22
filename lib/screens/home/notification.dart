import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';
import 'package:intl/intl.dart';

import 'home.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key, required this.notifications})
      : super(key: key);
  final List<dynamic>? notifications;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool start = false;

  @override
  void initState() {
    super.initState();

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

    return widget.notifications == null
        ? Center(
            child: SizedBox(
            height: 10,
            width: 10,
            child: HomeState.notificationPressed
                ? const CircularProgressIndicator(
                    strokeWidth: 1,
                  )
                : null,
          ))
        : widget.notifications!.isEmpty
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
                    itemCount: widget.notifications?.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return widget.notifications?[index]['type'] == "S"
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //title
                                            AnimatedContainer(
                                              duration:
                                                  const Duration(seconds: 1),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color:
                                                          Constants.pureBlack,
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
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      widget.notifications?[
                                                          index]['title'],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "Helvetica",
                                                          color: Constants
                                                              .pureWhite,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //time
                                            Text(
                                              DateFormat('MMMM d, y').format(
                                                  DateTime.parse(widget
                                                          .notifications![index]
                                                      ["created_at"])),
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: "Helvetica",
                                                color: Constants.pureWhite,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            widget.notifications?[index]
                                                ["description"],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //title
                                            AnimatedContainer(
                                              duration:
                                                  const Duration(seconds: 1),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color:
                                                          Constants.pureBlack,
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
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      widget.notifications?[
                                                          index]['title'],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "Helvetica",
                                                          color: Constants
                                                              .pureWhite,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //time
                                            Text(
                                              DateFormat('MMMM d, y').format(
                                                  DateTime.parse(widget
                                                          .notifications![index]
                                                      ["created_at"])),
                                              style: const TextStyle(
                                                fontSize: 10,
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
                                            widget.notifications?[index]
                                                ['description'],
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
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
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
                                                        BorderRadius.circular(
                                                            7),
                                                  ),
                                                  height: screenHeight * .04,
                                                  width: screenWidth * .32,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        if (mounted) {
                                                          setState(() {
                                                            auth.rejectNotification(
                                                                widget.notifications?[
                                                                        index]
                                                                    ['link2'],
                                                                (widget.notifications?[
                                                                            index]
                                                                        ['id'])
                                                                    .toString());
                                                            widget.notifications
                                                                ?.removeAt(
                                                                    index);
                                                          });
                                                        }
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
                                                                .all(Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .2)),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          "Decline",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "Helvetica",
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ))),
                                              Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                  ),
                                                  height: screenHeight * .04,
                                                  width: screenWidth * .32,
                                                  child: ElevatedButton(
                                                      onPressed: () async {
                                                        if (await auth.acceptNotification(
                                                            widget.notifications?[
                                                                index]['link1'],
                                                            (widget.notifications?[
                                                                        index]
                                                                    ['id'])
                                                                .toString())) {
                                                          if (mounted) {
                                                            setState(() {
                                                              widget
                                                                  .notifications
                                                                  ?.removeAt(
                                                                      index);
                                                            });
                                                          }
                                                        }
                                                      },
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .black),
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
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "Helvetica",
                                                              color:
                                                                  Colors.white),
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
