import 'package:flutter/cupertino.dart';
import 'package:hestia22/screens/events/events.dart';
import 'package:hestia22/screens/schedule/schedule_screen.dart';
import 'package:intl/intl.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<dynamic>? data;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
    return AnimatedPadding(
      duration: const Duration(seconds: 3),
      curve: Curves.fastLinearToSlowEaseIn,
      padding: start
          ? const EdgeInsets.only(left: 15, right: 15)
          : const EdgeInsets.only(left: 0, right: 0),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: widget.data == null
              ? const Center(child: CupertinoActivityIndicator())
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.data!.length,
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      height: size.width * 0.4,
                      child: Row(
                        children: [
                          const TimeLine(),
                          SizedBox(width: size.width * 0.05),
                          EventCard(
                            time: DateFormat('hh:mm a').format(
                                DateTime.parse(widget.data![0]['event_start'])),
                            eventName: widget.data![index]['title'].toString(),
                            description:
                                widget.data![index]['short_desc'].toString(),
                            venue: widget.data![index]['venue']['title']
                                .toString(),
                            route: EventDetails(widget.data![index]),
                          )
                        ],
                      ),
                    );
                  }))),
    );
  }
}
