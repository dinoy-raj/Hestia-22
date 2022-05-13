import 'package:hestia22/services/django/django.dart' as django;
import 'package:flutter/material.dart';
import 'package:hestia22/screens/schedule/schedule_screen.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  bool start = false;
  List<dynamic>? data;

  @override
  void initState() {
    super.initState();
    django.getSchedule("2022-05-27").then((value) {
      setState(() {
        
      data = value;
      });});

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
      padding: start ? const EdgeInsets.only(left: 15, right: 15) 
      : const EdgeInsets.only(left: 0, right: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: data==null? Center(child: CircularProgressIndicator()): 
        ListView.builder(
          itemCount:  data!.length,
          itemBuilder: ((context, index) {
          return SizedBox(
              height: size.width * 0.39,
              child: Row(
                children: [
                  const TimeLine(),
                   SizedBox(
                    width: size.width * 0.05
                  ),
                  EventCard(
                    time: '08:00 - 10:00',
                    eventName: data![index]['title'].toString(),
                    description: data![index]['venue']['title'].toString(),
              )],
              ),
            );
        }))
      ),
    );
  }
}
