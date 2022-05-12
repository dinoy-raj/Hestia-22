import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';

class RegisteredEvents extends StatefulWidget {
  const RegisteredEvents({Key? key}) : super(key: key);

  @override
  State<RegisteredEvents> createState() => _RegisteredEventsState();
}

class _RegisteredEventsState extends State<RegisteredEvents> {
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
    return Scaffold(
      backgroundColor: Constants.sc,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.width*0.06,),
            AnimatedOpacity(
            duration: const Duration(seconds: 3),
            curve: Curves.decelerate,
            opacity: start ? 1 : 0,
            child: Text(
              'Registered Events',
              style: const TextStyle(
                  overflow: TextOverflow.fade,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'helvetica',
                  color: Colors.white),
            ),
          ),
          SizedBox(height: size.width*0.06,),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: start ? 1 : 0.2,
                    child: AnimatedContainer(
                      height: size.width*0.5,
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(20),
                      margin: start ? EdgeInsets.zero : const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Constants.color3.withOpacity(.25),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          opacity: 0.5,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://images.pexels.com/photos/2747449/pexels-photo-2747449.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
                              ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Robo War',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                                color: Constants.color2.withOpacity(.5)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'May 26, 2022',
                                style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Constants.color2.withOpacity(.9)),
                              ),
                              Text(
                                '4:30 PM',
                                style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Constants.color2.withOpacity(.9)),
                              ),
                              Text(
                                'Apj Park',
                                style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Constants.color2.withOpacity(.9)),
                              ),
                          
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 30,
                );
              },
              itemCount: 2,
            ),
          ],
        ),
      ),
    );
  }
}
