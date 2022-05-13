import 'package:flutter/material.dart';
import 'package:hestia22/screens/schedule/schedule_screen.dart';

class FirstPage extends StatefulWidget {

  // final List<dynamic> data;


  const FirstPage({Key? key, 
  // required this.data
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
      padding: start ? const EdgeInsets.only(left: 15, right: 15) 
      : const EdgeInsets.only(left: 0, right: 0),
      
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          itemCount: 2,
          // widget.data.length,
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
                    eventName: 'Team Event',
                    description: 'f',
                  ),
                ],
              ),
            );
        }))
        
      ),
    );
  }
}
