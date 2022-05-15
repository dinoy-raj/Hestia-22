import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class EventDetails extends StatefulWidget {
  Map eventData;
  EventDetails(this.eventData, {Key? key}) : super(key: key);
  @override
  State<EventDetails> createState() => _EventDetailsState();
}

String fee = "";
String prize = "0";

class _EventDetailsState extends State<EventDetails> {
  static const fontfamily = 'Helvetica';
  double letterspace = 0.8;
  double contentspace = 1.2;
  bool modeLandscape = false;
  String imageUrl = "";
  Duration? duration;
  bool isReadmore = false;
  int lines = 4;
  bool start = false;
  int money = 0;
  int prizemoney = 0;
  DateTime? dateFormat;

  @override
  void initState() {
    super.initState();

    if (widget.eventData['fees'] != null) {
      fee = (widget.eventData['fees'] / 100).toString().replaceAll(r".0", '');
    } else {
      fee = "0";
    }
    if (widget.eventData['prize'] != null) {
      money = widget.eventData["prize"].round();
      if (money < 1000) {
        prize = money.toString();
      } else {
        prize = (money / 1000).toString();
      }
    } else {
      prize = "0";
    }
    prizemoney = double.parse(prize).toInt();
    dateFormat = widget.eventData['event_start'] != null
        ? DateFormat("yyyy-mm-ddThh:mm:ss")
            .parse(widget.eventData['event_start'])
        : DateFormat('yyyy-mm-dd').parse("2022-05-26");
    DateTime endDate = DateTime.parse(dateFormat.toString());

    duration = Duration(
        days: endDate.day - DateTime.now().day,
        hours: endDate.hour - DateTime.now().hour,
        minutes: endDate.minute - DateTime.now().minute,
        seconds: endDate.second - DateTime.now().second);
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        start = true;
      });
    });
    if (widget.eventData['image'] != null) {
      imageUrl = widget.eventData['image'];
    } else {
      imageUrl =
          "https://www.hestiatkmce.live/static/media/Hestia%2022-date%20reveal.3f5f2c21ac76b6abdd0e.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.sc,
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        appbar(height, width),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            eventDetails(height, width),
            Divider(
              height: width * 0.03,
              endIndent: width * 0.035,
              indent: width * 0.035,
              thickness: 0.3,
              color: Constants.lightWhite,
            ),
            aboutEvent(height, width),
            widget.eventData['is_file_upload'] &&
                    widget.eventData['guideline_file'] != null
                ? guidelines(height, width)
                : const SizedBox(
                    height: 0,
                  ),
            widget.eventData['coordinator_1'] != null ||
                    widget.eventData['coordinator_2'] == null
                ? contactDetails(height, width)
                : const SizedBox(
                    height: 0,
                  ),
            duration!.inSeconds <= 0
                ? const Text("")
                : floatButton(height, width),
          ],
        ))
      ]),
    );
  }

  Widget appbar(double height, double width) {
    return SliverAppBar(
      forceElevated: false,
      backgroundColor: Constants.sc,
      expandedHeight: height * 0.55,
      leading: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        opacity: start ? 1 : 0.5,
        child: AnimatedPadding(
          padding: start
              ? EdgeInsets.all(width * 0.02)
              : EdgeInsets.all(width * 0.012),
          duration: const Duration(milliseconds: 1000),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      Constants.bg.withOpacity(.6),
                      Constants.bg.withOpacity(.6),
                    ],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                ),
                child: BackButton(
                  color: Constants.color2.withOpacity(.5),
                ),
              ),
            ),
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCubicEmphasized,
            opacity: start ? 1 : 0,
            child: Hero(
              tag: widget.eventData['title'],
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeOutQuad,
                child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeInCurve: Curves.decelerate,
                    imageUrl: imageUrl,
                    errorWidget: (BuildContext context, url, error) =>
                        const Text(
                          "Error Loading",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget eventDetails(double height, double width) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      opacity: start ? 1 : 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                width * 0.035, width * 0.06, width * 0.035, 0),
            child: Stack(
              children: [
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  curve: Curves.slowMiddle,
                  opacity: start ? 1 : 0.3,
                  child: SizedBox(
                    height: width * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.57,
                              child: Text(
                                widget.eventData['title'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily: fontfamily,
                                  letterSpacing: letterspace,
                                  height: 1.2,
                                  fontSize: 24,
                                  color: Constants.pureWhite.withOpacity(0.85),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        widget.eventData['venue']['title'] != null
                            ? AnimatedOpacity(
                                duration: const Duration(seconds: 1),
                                curve: Curves.slowMiddle,
                                opacity: start ? 1 : 0.5,
                                child: Padding(
                                  padding: EdgeInsets.only(top: width * 0.06),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.locationDot,
                                        color: Constants.lightWhite
                                            .withOpacity(0.4),
                                        size: 14,
                                      ),
                                      Text(
                                        "  " +
                                            widget.eventData['venue']['title']
                                                .toString(),
                                        style: TextStyle(
                                          letterSpacing: letterspace,
                                          decoration: TextDecoration.none,
                                          fontSize: 14,
                                          fontFamily: fontfamily,
                                          overflow: TextOverflow.clip,
                                          color: Constants.textColor
                                              .withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : AnimatedOpacity(
                                duration: const Duration(seconds: 1),
                                curve: Curves.slowMiddle,
                                opacity: start ? 1 : 0.5,
                                child: Padding(
                                  padding: EdgeInsets.only(top: width * 0.06),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.locationDot,
                                        color: Constants.lightWhite
                                            .withOpacity(0.4),
                                        size: 14,
                                      ),
                                      Text(
                                        "  " + "TKMCE".toString().toUpperCase(),
                                        style: TextStyle(
                                          letterSpacing: letterspace,
                                          decoration: TextDecoration.none,
                                          fontSize: 14,
                                          fontFamily: fontfamily,
                                          overflow: TextOverflow.clip,
                                          color: Constants.textColor
                                              .withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        widget.eventData['fees'] != null
                            ? AnimatedOpacity(
                                duration: const Duration(seconds: 1),
                                curve: Curves.slowMiddle,
                                opacity: start ? 1 : 0.5,
                                child: Padding(
                                  padding: EdgeInsets.only(top: width * 0.034),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.indianRupeeSign,
                                        color: Constants.lightWhite
                                            .withOpacity(0.4),
                                        size: 14,
                                      ),
                                      Text(
                                        widget.eventData['fees'] == 0
                                            ? "  Free"
                                            : widget.eventData['fees'] < 100
                                                ? "  " +
                                                    widget.eventData['fees']
                                                        .toString() +
                                                    "P"
                                                : "  " + fee,
                                        style: TextStyle(
                                          letterSpacing: letterspace,
                                          decoration: TextDecoration.none,
                                          fontSize: 14,
                                          fontFamily: fontfamily,
                                          overflow: TextOverflow.clip,
                                          color: Constants.textColor
                                              .withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : AnimatedOpacity(
                                duration: const Duration(seconds: 1),
                                curve: Curves.slowMiddle,
                                opacity: start ? 1 : 0.5,
                                child: Padding(
                                  padding: EdgeInsets.only(top: width * 0.034),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.indianRupeeSign,
                                        color: Constants.lightWhite
                                            .withOpacity(0.4),
                                        size: 14,
                                      ),
                                      Text(
                                        "  Free",
                                        style: TextStyle(
                                          letterSpacing: letterspace,
                                          decoration: TextDecoration.none,
                                          fontSize: 15,
                                          fontFamily: fontfamily,
                                          overflow: TextOverflow.clip,
                                          color: Constants.textColor
                                              .withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                      opacity: start ? 1 : 0.6,
                      child: Container(
                        width: width * 0.32,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Container(
                              width: width * 0.32,
                              height: width * 0.14,
                              padding: EdgeInsets.only(
                                  top: width * 0.03,
                                  left: width * 0.003,
                                  right: width * 0.003),
                              decoration: const BoxDecoration(
                                color: Constants.iconAc,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: AnimatedOpacity(
                                duration: const Duration(seconds: 1),
                                curve: Curves.linear,
                                opacity: start ? 1 : 0.3,
                                child: Text(
                                  "May " + dateFormat!.day.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      letterSpacing: contentspace,
                                      overflow: TextOverflow.clip,
                                      color: Constants.textColor.shade100,
                                      fontFamily: fontfamily,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.32,
                              height: width * 0.14,
                              margin: EdgeInsets.only(top: width * .085),
                              padding: EdgeInsets.only(
                                  top: width * 0.01,
                                  bottom: width * 0.01,
                                  right: width * 0.0001,
                                  left: width * 0.0001),
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                              ),
                              child: Center(
                                  child: AnimatedOpacity(
                                duration: const Duration(seconds: 1),
                                curve: Curves.linear,
                                opacity: start ? 1 : 0.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.ticket,
                                      color: Constants.iconAc,
                                      size: 18,
                                    ),
                                    const Text("   "),
                                    Row(
                                      children: [
                                        widget.eventData['prize'] == null
                                            ? Text(
                                                "0K",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    letterSpacing: contentspace,
                                                    overflow: TextOverflow.clip,
                                                    color: Constants.iconAc,
                                                    fontFamily: fontfamily,
                                                    fontSize: 14),
                                              )
                                            : Text(
                                                widget.eventData["prize"] < 1000
                                                    ? prizemoney.toString()
                                                    : prizemoney.toString() +
                                                        "K",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    letterSpacing: contentspace,
                                                    overflow: TextOverflow.clip,
                                                    color: Constants.iconAc,
                                                    fontFamily: fontfamily,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutEvent(double height, double width) {
    final lines = isReadmore ? null : 4;
    return widget.eventData['desc'] != null
        ? AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            opacity: start ? 1 : 0.3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(width * 0.035, 0, width * 0.035, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(""),
                  Text(
                    'About Event',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      letterSpacing: 0.8,
                      fontFamily: fontfamily,
                      overflow: TextOverflow.clip,
                      color: Constants.pureWhite.withOpacity(0.65),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.eventData['desc'],
                    overflow: isReadmore
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    maxLines: lines,
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      fontSize: 15,
                      height: 1.5,
                      fontFamily: fontfamily,
                      color: Constants.textColor.withOpacity(.8),
                      inherit: true,
                      wordSpacing: 1.2,
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(0),
                    animationDuration: const Duration(seconds: 0),
                    onPressed: () {
                      setState(() {
                        // toggle the bool variable true or false
                        isReadmore = !isReadmore;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          (isReadmore ? 'Read Less\n' : 'Read More\n'),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            overflow: TextOverflow.clip,
                            fontSize: 12,
                            fontFamily: fontfamily,
                            color: Constants.lightWhite.withOpacity(0.2),
                            inherit: true,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Text(""),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox(
            height: 0,
          );
  }

  Widget guidelines(double height, double width) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      opacity: start ? 1 : 0.5,
      child: MaterialButton(
          color: Colors.grey[900],
          onPressed: () async {
            String url = widget.eventData['guideline_file'];
            final _url = Uri.parse(url);
            if (url != null && url.isNotEmpty) {
              if (await launchUrl(_url, mode: LaunchMode.externalApplication)) {
              } else {
                throw 'Could not launch $url';
              }
            }
          },
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: Colors.white10)),
          child: Center(
            child: Text(
              "View Guidelines",
              style: TextStyle(
                letterSpacing: letterspace,
                decoration: TextDecoration.none,
                fontSize: 16,
                fontFamily: fontfamily,
                overflow: TextOverflow.clip,
                color: Constants.textColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          )),
    );
  }

  Widget contactDetails(double height, double width) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      opacity: start ? 1 : 0.5,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
        padding: start
            ? EdgeInsets.fromLTRB(width * 0.035, 0, width * 0.035, 0)
            : const EdgeInsets.only(left: 0),
        child: Column(
          children: [
            widget.eventData['coordinator_1'] != null
                ? Row(
                    children: [
                      /*widget.eventData['coordinator_1']['name'] == null
                    ? const SizedBox(
                        height: 0,
                      )
                    : */
                      SizedBox(
                        width: width * 0.32,
                        child: Text(
                          widget.eventData['coordinator_1'] != null
                              ? widget.eventData['coordinator_1']['name']
                                  .toString()
                              : "No Name",
                          style: TextStyle(
                            letterSpacing: letterspace,
                            fontSize: 16,
                            fontFamily: fontfamily,
                            overflow: TextOverflow.ellipsis,
                            color: Constants.textColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      /*widget.eventData['coordinator_1']['phone_number'] == null
                    ? const SizedBox(
                        height: 0,
                      )
                    : */
                      MaterialButton(
                        onPressed: () async {
                          if (widget.eventData['coordinator_1'] != null) {
                            if (await canLaunchUrl(Uri(
                                scheme: 'tel',
                                path: widget.eventData['coordinator_1']
                                    ['phone_number']))) {
                              await launchUrl(Uri(
                                  scheme: 'tel',
                                  path: widget.eventData['coordinator_1']
                                      ['phone_number']));
                            }
                          }
                        },
                        child: const Icon(
                          FontAwesomeIcons.phoneFlip,
                          size: 17,
                          color: Colors.green,
                        ),
                      )
                    ],
                  )
                : const SizedBox(
                    height: 0,
                  ),
            widget.eventData['coordinator_2'] != null
                ? Row(
                    children: [
                      // widget.eventData['coordinator_2']['name'] == null
                      //     ? const SizedBox(
                      //         height: 0,
                      //       )
                      //     :
                      SizedBox(
                        width: width * 0.32,
                        child: Text(
                          widget.eventData['coordinator_2'] != null
                              ? widget.eventData['coordinator_2']['name']
                                  .toString()
                              : "No Name",
                          style: TextStyle(
                            letterSpacing: letterspace,
                            fontSize: 16,
                            fontFamily: fontfamily,
                            overflow: TextOverflow.ellipsis,
                            color: Constants.textColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (widget.eventData['coordinator_1'] != null) {
                            if (await canLaunchUrl(Uri(
                                scheme: 'tel',
                                path: widget.eventData['coordinator_2']
                                    ['phone_number']))) {
                              await launchUrl(Uri(
                                  scheme: 'tel',
                                  path: widget.eventData['coordinator_2']
                                      ['phone_number']));
                            }
                          }
                        },
                        child: const Icon(
                          FontAwesomeIcons.phoneFlip,
                          size: 17,
                          color: Colors.green,
                        ),
                      )
                    ],
                  )
                : const SizedBox(
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }

  Widget floatButton(double height, double width) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      opacity: start ? 1 : 0.5,
      child: Container(
        height: width * 0.18,
        padding: EdgeInsets.fromLTRB(
            width * .035, width * .03, width * .035, width * .03),
        child: MaterialButton(
          autofocus: true,
          highlightColor: Colors.grey[900],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsets.fromLTRB(
              width * .0, width * .03, width * .03, width * .03),
          onPressed: () async {
            Uri _url = Uri.parse("https://www.hestiatkmce.live/events/" +
                widget.eventData['event_category'] +
                "/" +
                widget.eventData['slug']);
            if (await launchUrl(_url, mode: LaunchMode.externalApplication)) {}
          },
          color: Constants.iconAc,
          child: Text(
            "Book Now",
            style: TextStyle(
              letterSpacing: contentspace,
              overflow: TextOverflow.ellipsis,
              color: Constants.pureWhite,
              fontFamily: fontfamily,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
