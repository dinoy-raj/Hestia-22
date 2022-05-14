import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/schedule/data.dart';
import 'package:hestia22/screens/schedule/date_info.dart';
import 'package:hestia22/screens/schedule/dates/first.dart';
import 'package:hestia22/screens/schedule/dates/fourth.dart';
import 'package:hestia22/screens/schedule/dates/second.dart';
import 'package:hestia22/screens/schedule/dates/third.dart';
import 'package:hestia22/screens/schedule/enums.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen(
      {Key? key,
      required this.data1,
      required this.data2,
      required this.data3,
      required this.data4})
      : super(key: key);
  final List<dynamic>? data1;
  final List<dynamic>? data2;
  final List<dynamic>? data3;
  final List<dynamic>? data4;

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  bool start = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        start = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      opacity: start ? 1 : 0,
      child: Scaffold(
        backgroundColor: Constants.sc,
        body: Column(
          children: [
            SizedBox(
              height: size.width * 0.6,
              child: Stack(children: [
                AnimatedPadding(
                  duration: const Duration(seconds: 3),
                  curve: Curves.fastLinearToSlowEaseIn,
                  padding: start
                      ? const EdgeInsets.symmetric(horizontal: 10)
                      : const EdgeInsets.only(left: 0, right: 0),
                  child: SizedBox(
                    height: size.width * 0.68,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.width * 0.2,
                        ),
                        AnimatedPadding(
                          duration: const Duration(seconds: 1),
                          curve: Curves.decelerate,
                          padding: start
                              ? EdgeInsets.zero
                              : const EdgeInsets.only(
                                  left: 20,
                                ),
                          child: AnimatedOpacity(
                            duration: const Duration(seconds: 3),
                            curve: Curves.decelerate,
                            opacity: start ? 1 : 0.2,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.0),
                              child: Text(
                                'Schedule',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'helvetica',
                                    letterSpacing: 1.4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: dateItems
                              .map((currentDateInfo) =>
                                  buildDateButton(currentDateInfo))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              height: size.height * 0.6,
              color: Constants.sc,
              child: Consumer<DateInfo>(
                  builder: (context, value, child) {
                    if (value.dateType == DateType.a) {
                      return FirstPage(
                        data: widget.data1,
                      );
                    } else if (value.dateType == DateType.b) {
                      return SecondPage(
                        data: widget.data2,
                      );
                    } else if (value.dateType == DateType.c) {
                      return ThirdPage(
                        data: widget.data3,
                      );
                    } else {
                      return FourthPage(
                        data: widget.data4,
                      );
                    }
                  },
                  child: FirstPage(
                    data: widget.data1,
                  )),
            ),
            Expanded(
                child: Container(
              color: Constants.sc,
            ))
          ],
        ),
      ),
    );
  }

  Widget buildDateButton(DateInfo currentDateInfo) {
    return Consumer<DateInfo>(
      builder: (context, value, child) {
        return InkWell(
          onTap: () {
            var dateInfo = Provider.of<DateInfo>(context, listen: false);
            dateInfo.updateDate(currentDateInfo);
          },
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate,
            opacity: start ? 1 : 0,
            child: AnimatedPadding(
              padding: start
                  ? const EdgeInsets.only(right: 8)
                  : const EdgeInsets.only(right: 15),
              curve: Curves.decelerate,
              duration: const Duration(seconds: 1),
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
                width: 60,
                height: 70,
                decoration: BoxDecoration(
                  color: Constants.color1,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: currentDateInfo.dateType == value.dateType
                          ? Constants.iconAc
                          : Colors.transparent),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentDateInfo.date,
                      style: TextStyle(
                        fontWeight: currentDateInfo.dateType == value.dateType
                            ? FontWeight.w800
                            : FontWeight.w500,
                        fontSize: 14,
                        color: currentDateInfo.dateType == value.dateType
                            ? Colors.white
                            : Colors.grey.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      currentDateInfo.day,
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        letterSpacing: 1,
                        color: currentDateInfo.dateType == value.dateType
                            ? Colors.white70
                            : Colors.grey.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class EventCard extends StatefulWidget {
  final String time;
  final String eventName;
  final String description;
  final String venue;
  final Widget route;

  const EventCard({
    Key? key,
    required this.eventName,
    required this.description,
    required this.time,
    required this.route,
    required this.venue,
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool start = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        start = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.time,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => widget.route));
            },
            child: AnimatedOpacity(
              duration: const Duration(seconds: 3),
              curve: Curves.decelerate,
              opacity: start ? 1 : 0,
              child: AnimatedContainer(
                duration: const Duration(seconds: 3),
                curve: Curves.slowMiddle,
                width: size.width * 0.8,
                height: size.width * 0.22,
                decoration: BoxDecoration(
                  color: Constants.iconAc,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.eventName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                        ),
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.35),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                        ),
                        child: Text(
                          widget.venue,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.55),
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
    );
  }
}

class TimeLine extends StatefulWidget {
  const TimeLine({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.width * .03,
            height: size.width * 0.03,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.grey),
          ),
          Container(
            width: size.width * 0.006,
            height: size.width * 0.37,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
