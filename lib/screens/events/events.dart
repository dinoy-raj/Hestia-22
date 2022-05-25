import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class EventDetails extends StatefulWidget {
  final Map eventData;
  const EventDetails(this.eventData, {Key? key}) : super(key: key);
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
    print(widget.eventData["reg_end"]);
    return Scaffold(
      backgroundColor: Constants.sc,
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        appbar(height, width),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            eventDetails(height, width),
            aboutEvent(height, width),
            widget.eventData['coordinator_1'] != null ||
                    widget.eventData['coordinator_2'] != null
                ? Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.01,
                          height: height * 0.015,
                          decoration: const BoxDecoration(
                              color: Constants.iconAc,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        Text(
                          '  Coordinators',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: height * 0.0185,
                            letterSpacing: 0.8,
                            fontFamily: fontfamily,
                            overflow: TextOverflow.clip,
                            color: Constants.pureWhite.withOpacity(0.65),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(
                    height: 0,
                  ),
            widget.eventData['coordinator_1'] != null ||
                    widget.eventData['coordinator_2'] != null
                ? SizedBox(height: height * 0.015)
                : const SizedBox(
                    height: 0,
                  ),
            widget.eventData['coordinator_1'] != null ||
                    widget.eventData['coordinator_2'] == null
                ? contactDetails(height, width)
                : const SizedBox(
                    height: 0,
                  ),
            widget.eventData['guideline_file'] != null
                ? SizedBox(
                    height: height * 0.013,
                  )
                : const SizedBox(
                    height: 0,
                  ),
            widget.eventData['guideline_file'] != null
                ? guidelines(height, width)
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
      floating: true,
      pinned: true,
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
    return AnimatedPadding(
      padding: start
          ? EdgeInsets.fromLTRB(width * 0.035, height * 0.01, width * 0.035, 0)
          : EdgeInsets.fromLTRB(width * 0.0, height * 0.01, width * 0.0, 0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.decelerate,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.decelerate,
        opacity: start ? 1 : 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height * 0.12,
              width: width,
              padding: EdgeInsets.fromLTRB(
                  width * 0.035, height * 0.01, width * 0.035, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.slowMiddle,
                    opacity: start ? 1 : 0,
                    child: SizedBox(
                      width: width * 0.93,
                      child: Center(
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
                    ),
                  ),
                  widget.eventData['venue']['title'] != null
                      ? Center(
                          child: AnimatedOpacity(
                            duration: const Duration(seconds: 1),
                            curve: Curves.slowMiddle,
                            opacity: start ? 1 : 0,
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.locationDot,
                                    color: Constants.iconIn,
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
                                      color: Constants.iconIn,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: AnimatedOpacity(
                            duration: const Duration(seconds: 1),
                            curve: Curves.slowMiddle,
                            opacity: start ? 1 : 0,
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.locationDot,
                                    color:
                                        Constants.lightWhite.withOpacity(0.4),
                                    size: 14,
                                  ),
                                  Text(
                                    "  TKMCE",
                                    style: TextStyle(
                                      letterSpacing: letterspace,
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                      fontFamily: fontfamily,
                                      overflow: TextOverflow.clip,
                                      color:
                                          Constants.textColor.withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Container(
              width: width,
              height: height * 0.15,
              padding:
                  EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                curve: Curves.linear,
                opacity: start ? 1 : 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Constants.iconAc, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Date",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  color: Constants.iconAc,
                                  fontFamily: fontfamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            Text(
                              "May " + dateFormat!.day.toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  color: Constants.pureWhite,
                                  fontFamily: fontfamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   height: height*0.05,
                      //   width:width*0.004,
                      //   decoration: BoxDecoration(
                      //
                      //     color: Constants.iconIn,
                      //     borderRadius: BorderRadius.all(Radius.circular(10))
                      //   ),
                      // ),
                      Container(
                        width: width * 0.31,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Constants.iconAc,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Prize",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  color: Colors.black,
                                  fontFamily: fontfamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            widget.eventData['prize'] == null
                                ? const Text(
                                    "0K",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        overflow: TextOverflow.clip,
                                        color: Colors.black,
                                        fontFamily: fontfamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  )
                                : Text(
                                    widget.eventData["prize"] < 1000
                                        ? prizemoney.toString()
                                        : prizemoney.toString() + "K",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        overflow: TextOverflow.clip,
                                        color: Colors.black,
                                        fontFamily: fontfamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                          ],
                        ),
                      ),
                      // Container(
                      //   height: height*0.05,
                      //   width:width*0.004,
                      //   decoration: BoxDecoration(
                      //
                      //       color: Constants.iconIn,
                      //       borderRadius: BorderRadius.all(Radius.circular(10))
                      //   ),
                      // ),
                      SizedBox(
                        width: width * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Fee",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  color: Constants.iconAc,
                                  fontFamily: fontfamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            widget.eventData['fees'] != null
                                ? Text(
                                    widget.eventData['fees'] == 0
                                        ? "Free"
                                        : widget.eventData['fees'] < 100
                                            ? widget.eventData['fees']
                                                    .toString() +
                                                "P"
                                            : fee,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        letterSpacing: contentspace,
                                        overflow: TextOverflow.clip,
                                        color: Constants.pureWhite,
                                        fontFamily: fontfamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                : Text(
                                    "0",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        letterSpacing: contentspace,
                                        overflow: TextOverflow.clip,
                                        color: Constants.pureWhite,
                                        fontFamily: fontfamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget aboutEvent(double height, double width) {
    final lines = isReadmore ? null : 4;
    return widget.eventData['desc'] != null
        ? Container(
            padding: EdgeInsets.only(top: height * 0.02),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              opacity: start ? 1 : 0.3,
              child: Padding(
                padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: width * 0.01,
                          height: height * 0.015,
                          decoration: const BoxDecoration(
                              color: Constants.iconAc,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        Text(
                          '  About Event',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: height * 0.0185,
                            letterSpacing: 0.8,
                            fontFamily: fontfamily,
                            overflow: TextOverflow.clip,
                            color: Constants.pureWhite.withOpacity(0.65),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
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
      child: Container(
        height: height * 0.06,
        padding: EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, 0),
        child: ElevatedButton(
            onPressed: () async {
              String url = widget.eventData['guideline_file'];
              final _url = Uri.parse(url);
              if (url.isNotEmpty) {
                if (await launchUrl(_url,
                    mode: LaunchMode.externalApplication)) {
                } else {
                  throw 'Could not launch $url';
                }
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                overlayColor: MaterialStateProperty.all(Constants.iconIn),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(
                          color: Constants.iconAc.withOpacity(0.8),
                          width: 0.5)),
                )),
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
      ),
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
            ? EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.05, height * 0.012)
            : const EdgeInsets.only(left: 0),
        child: Row(
          children: [
            widget.eventData['coordinator_1'] != null
                ? SizedBox(
                    width: width * 0.44,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Constants.bg)),
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
                      child: Text(
                        widget.eventData['coordinator_1'] != null
                            ? widget.eventData['coordinator_1']['name']
                                .toString()
                            : "No Name",
                        style: TextStyle(
                          letterSpacing: letterspace,
                          fontSize: 14,
                          fontFamily: fontfamily,
                          overflow: TextOverflow.ellipsis,
                          color: Constants.textColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 0,
                  ),
            widget.eventData['coordinator_2'] != null
                ? Container(
                    height: height * 0.033,
                    width: width * 0.003,
                    decoration: BoxDecoration(
                        color: Constants.iconIn,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                  )
                : const SizedBox(
                    height: 0,
                  ),
            widget.eventData['coordinator_2'] != null
                ? SizedBox(
                    width: width * 0.44,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Constants.bg)),
                      onPressed: () async {
                        if (widget.eventData['coordinator_2'] != null) {
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
                      child: Text(
                        widget.eventData['coordinator_2'] != null
                            ? widget.eventData['coordinator_2']['name']
                                .toString()
                            : "No Name",
                        style: TextStyle(
                          letterSpacing: letterspace,
                          fontSize: 14,
                          fontFamily: fontfamily,
                          overflow: TextOverflow.ellipsis,
                          color: Constants.textColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
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
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            width * .05, height * 0.02, width * .05, height * .05),
        child: Container(
          height: height * 0.06,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(Colors.black.withOpacity(0.4)),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))))),
            autofocus: true,
            onPressed: () async {
              Uri _url = Uri.parse("https://www.hestiatkmce.live/events/" +
                  widget.eventData['event_category'] +
                  "/" +
                  widget.eventData['slug']);
              if (await launchUrl(_url,
                  mode: LaunchMode.externalApplication)) {}
            },
            child: const Text(
              "Book Now",
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontFamily: fontfamily,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
