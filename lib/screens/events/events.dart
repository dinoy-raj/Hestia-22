import 'dart:math';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../main.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  static const fontfamily = 'Helvetica';
  Map eventData = {
    'image': 'assets/images/spotlight.png',
    'name': 'SPOTLIGHT',
    'description':
        "Lights, camera, ACTION!Are you ready to be in the limelight and instigate the true actor in you? Do you think you have the power to influence the crowd, and weave magic on screen? If yes, wait not! Act your heart out as the spotlight shines bright and all eyes veer to you.Hestia'22 presents SPOTLIGHT, to unravel the performer in you. Enter the showbiz with your prowess in fine blending emotions and art. Unleash your flair by revitalising characters on screen.",
    'date': "2021-05-29 12:30",
    'registrationfee': "₹150",
    'prize': "₹7000",
    'coordinator1': "Ajay",
    "phone_no_cord1": "8301916909",
    'coordinator2': "Jyothi",
    "phone_no_cord2": "9447480943",
    'location': "APJ Park"
  };
  final double start = 0;
  final double end = 0;
  bool _animate = true;
  double _opacity = 0.75;
  Duration? duration;
  @override
  void initState() {
    // TODO: implement initState
    DateTime endDate = DateTime.parse(eventData['date']);
    duration = Duration(
        days: endDate.day - DateTime.now().day,
        hours: endDate.hour - DateTime.now().hour,
        minutes: endDate.minute - DateTime.now().minute,
        seconds: endDate.second - DateTime.now().second);
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          _animate = false;
        });
      });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.sc,
      body: CustomScrollView(slivers: [
        appbar(height, width),
        SliverList(
            delegate: SliverChildListDelegate([
          eventDetails(height, width),
          Divider(
            height: width * 0.03,
            endIndent: width * 0.05,
            indent: width * 0.05,
            thickness: 0.5,
            color: Constants.lightWhite,
          ),
          aboutEvent(height, width),
          contactDetails(height, width)
        ]))
      ]),
      floatingActionButton: floatButton(height, width),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget eventDetails(double height, double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              width * 0.04, width * 0.04, width * 0.04, width * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Icon(
                Icons.schedule,
                color: Constants.lightWhite.withOpacity(0.4),
              ),
              Text(
                "  " + eventData['date'],
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontFamily: fontfamily,
                  color: Constants.pureWhite.withOpacity(0.84),
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(
              width * 0.04, width * 0.02, width * 0.04, width * 0.01),
          child: Row(
            children: [
               Icon(
                Icons.currency_rupee,
                color: Constants.lightWhite.withOpacity(0.4),
              ),
              Text(
                "  " +
                    eventData['registrationfee'] +
                    " Reg. Fee /  " +
                    eventData['prize'] +
                    " Prize",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontFamily: fontfamily,
                  overflow: TextOverflow.clip,
                  color: Constants.pureWhite.withOpacity(0.84),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        /*Container(
          padding: EdgeInsets.fromLTRB(
              width * 0.04, width * 0.02, width * 0.04, width * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.currency_rupee_outlined,
                color: AppColors.pureWhite,
              ),
              Text(
                '  Prize : ' + eventData['prize'],
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 18,
                  fontFamily: 'Helvetica',
                  color: AppColors.pureWhite,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),*/
      ],
    );
  }

  Widget contactDetails(double height, double width) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              width * 0.04, width * 0.02, width * 0.04, width * 0.0005),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                   Icon(
                    Icons.person,
                    color: Constants.lightWhite.withOpacity(0.4),
                  ),
                  Text(
                    "  " + eventData['coordinator1'],
                    style:  TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontFamily: fontfamily,
                      overflow: TextOverflow.clip,
                      color: Constants.lightWhite.withOpacity(0.8),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Constants.phoneIcon.withOpacity(0.8),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (await canLaunchUrl(
                          Uri(scheme: 'tel', path: eventData['phone_no_cord1']))) {
                        await launchUrl(
                            Uri(scheme: 'tel', path: eventData['phone_no_cord1']));
                      }
                    },
                    child: Text(
                      eventData['phone_no_cord1'],
                      style: TextStyle(
                          color: Constants.pureWhite.withOpacity(0.8),
                          fontSize: 16,
                          overflow: TextOverflow.clip,
                          fontWeight: FontWeight.normal,
                          fontFamily: fontfamily),
                    ),
                  )
                ],
              )


            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(
              width * 0.04, width * 0.0005, width * 0.04, width * 0.0005),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                   Icon(
                    Icons.person,
                    color: Constants.lightWhite.withOpacity(0.4),
                  ),
                  Text(
                    "  " + eventData['coordinator2'],
                    style:  TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontFamily: fontfamily,
                      overflow: TextOverflow.clip,
                      color: Constants.lightWhite.withOpacity(0.8),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Constants.phoneIcon,
                  ),
                  TextButton(
                    onPressed: () async {
                      if (await canLaunchUrl(
                          Uri(scheme: 'tel', path: eventData['phone_no_cord2']))) {
                        await launchUrl(
                            Uri(scheme: 'tel', path: eventData['phone_no_cord2']));
                      }
                    },
                    child: Text(
                      eventData['phone_no_cord2'],
                      style:  TextStyle(
                          color: Constants.pureWhite.withOpacity(0.8),
                          fontSize: 16,
                          overflow: TextOverflow.clip,
                          fontWeight: FontWeight.normal,
                          fontFamily: fontfamily),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget aboutEvent(double height, double width) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.04, width * 0.04, width * 0.04, width * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'About Event',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 24,
              fontFamily: fontfamily,
              overflow: TextOverflow.clip,
              color: Constants.pureWhite.withOpacity(0.75),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(""),
          Text(
            eventData['description'],
            style: TextStyle( overflow: TextOverflow.clip,
              fontSize: 16,
              fontFamily: fontfamily,
              color: Constants.lightWhite.withOpacity(0.6),
              inherit: true,
              letterSpacing: 1,
              wordSpacing: 2,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget appbar(double height, double width) {
    return SliverAppBar(
      leading: AnimatedPadding(
        padding: _animate
            ? const EdgeInsets.only(
          top: 10.0,
          bottom: 8.0,
          left: 10.0,
          right: 5.0,
        )
            : const EdgeInsets.all(8.0),
        duration: const Duration(milliseconds: 500),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    Constants.bg.withOpacity(.3),
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
      floating: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      expandedHeight: height * .5,
      backgroundColor: Constants.pureBlack,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              image: DecorationImage(
                  image: AssetImage(eventData['image']),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8), BlendMode.dstIn),
                  fit: BoxFit.cover)),
        ),
        title: Container(
          padding: EdgeInsets.only(left: width*0.1,right: width*0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          Constants.bg.withOpacity(.3),
                          Constants.bg.withOpacity(.6),
                        ],
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                      ),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: width*0.005,right:  width*0.005,top: height*0.01,bottom: height*0.003),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [
                              Text(
                                "Day",
                                style: TextStyle(
                                    color: Constants.pureWhite.withOpacity(0.7),
                                    fontSize: 16,
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: fontfamily),
                              ),
                              Text(
                                "Hrs",
                                style: TextStyle(
                                    color: Constants.pureWhite.withOpacity(0.7),
                                    fontSize: 16,
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: fontfamily),
                              ),
                              Text(
                                "Min",
                                style: TextStyle(
                                    color: Constants.pureWhite.withOpacity(0.7),
                                    fontSize: 16,
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: fontfamily),
                              ),
                              Text(
                                "Sec",
                                style: TextStyle(
                                    color: Constants.pureWhite.withOpacity(0.7),
                                    fontSize: 16,
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: fontfamily),
                              ),
                            ],
                          ),
                          SlideCountdownSeparated(
                            width: width * .05,
                            separator: " : ",
                            fade: true,
                            separatorStyle: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                overflow: TextOverflow.clip,
                                decorationStyle: TextDecorationStyle.double),
                            showZeroValue: false,
                            textStyle:  TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              decorationColor: Constants.transaparent,
                              overflow: TextOverflow.clip,
                              color: Constants.pureWhite.withOpacity(0.9),
                              fontFamily: fontfamily,
                            ),
                            decoration:
                            const BoxDecoration(color: Constants.transaparent),
                            slideDirection: SlideDirection.down,
                            duration: duration == null
                                ? const Duration(
                                seconds: 0, minutes: 0, hours: 0, days: 0)
                                : duration!,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.my_location_sharp,
                        color: Constants.lightWhite,
                        size: 16,
                      ),
                      Text(
                        "   " + eventData['location'],
                        style: TextStyle(
                            overflow: TextOverflow.clip,
                            color: Constants.pureWhite.withOpacity(0.8),
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: fontfamily),
                      )
                    ],
                  )),
              Text(
                eventData['name'],
                style:  TextStyle(
                  fontFamily: fontfamily,
                  fontSize: 28,
                  color: Constants.pureWhite.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  Widget floatButton(double height, double width) {
    return MaterialButton(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: EdgeInsets.fromLTRB(
          width * .06, width * .03, width * .06, width * .03),
      onPressed: () {},
      color: Constants.buttonPink,
      child: const Text(
        "Book Now",
        style: TextStyle(
            overflow: TextOverflow.clip,
            color: Constants.lightWhite, fontFamily: fontfamily, fontSize: 16),
      ),
    );
  }
}
