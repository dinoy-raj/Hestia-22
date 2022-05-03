import 'package:flutter/material.dart';
import 'package:hestia22/screens/schedule/data.dart';
import 'package:hestia22/screens/schedule/date_info.dart';
import 'package:hestia22/screens/schedule/dates/first.dart';
import 'package:hestia22/screens/schedule/dates/fourth.dart';
import 'package:hestia22/screens/schedule/dates/second.dart';
import 'package:hestia22/screens/schedule/dates/third.dart';
import 'package:hestia22/screens/schedule/enums.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var isSelected = true;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 250,
                  color: Colors.black,
                  // child: ListView.separated(
                  //   scrollDirection: Axis.horizontal,
                  //     itemBuilder: (ctx, index) {
                  //       return Container(
                  //         width: 40,
                  //         height: 10,
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //       );
                  //     },
                  //     separatorBuilder: (ctx, index) => const SizedBox(
                  //           width: 10,
                  //         ),
                  //     itemCount: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          children: const [
                            Text(
                              'May 26-29',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Helvetica',
                                  letterSpacing: 1),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: dateItems
                            .map((currentMenuInfo) =>
                                buildDateButton(currentMenuInfo))
                            .toList(),
                        // [
                        //   buildDateButton('26','Thu'),
                        //   buildDateButton('27','Fri'),
                        //   buildDateButton('28','Sat'),
                        //   buildDateButton('29','Sun'),
                        // ]
                      ),
                    ],
                  ),
                ),
                Container(
                    width: size.width,
                    height: 30,
                    margin: EdgeInsets.only(top: 220),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    )),
              ]),
              Consumer<DateInfo>(
                builder: (context,value,child) {
                  if (value.dateType == DateType.a)
                return FirstPage();
              else if (value.dateType == DateType.b)
                return SecondPage();
              else if(value.dateType == DateType.c)
                return ThirdPage();
              else 
              return FourthPage();
                
                },
                child: FirstPage()),
              

            ],
          ),
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
          child: Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
                color: currentDateInfo.dateType == value.dateType
                    ? Color.fromARGB(255, 253, 255, 162)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    // offset: Offset(1, 1.5),
                    color: Colors.yellow,
                    blurRadius: 7.0,
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentDateInfo.date,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  currentDateInfo.day,
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    letterSpacing: 1,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class EventCard extends StatelessWidget {
  final String time;
  final String eventName;
  final String description;
  EventCard({
    Key? key,
    required this.eventName,
    required this.description,
    required this.time,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: size.width * 0.8,
            height: size.width * 0.22,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 12,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(eventName,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20)),
                    Text(description,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.grey[400]))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeLine extends StatelessWidget {
  const TimeLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.grey[350]),
        ),
        Container(
          width: 3,
          height: size.width * 0.359,
          color: Colors.grey[350],
        ),
      ],
    );
  }
}
