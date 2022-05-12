import 'package:flutter/material.dart';

import '../../main.dart';
import '../events/events.dart';

class EventCards3 extends StatefulWidget {
  List<dynamic> show;
  int catSelect;
  EventCards3(this.show, this.catSelect, {Key? key}) : super(key: key);

  @override
  State<EventCards3> createState() => _EventCardsState();
}

class _EventCardsState extends State<EventCards3> {
  PageController pageControl =
  PageController(viewportFraction: .80, initialPage: 0);
  int currentPage = 0;

  bool start = false;

  @override
  void initState() {
    super.initState();
    start = false;

    pageControl.addListener(() {
      setState(() {
        currentPage = pageControl.page!.round();
      });
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        start = true;
      });
    });
  }

  @override
  void dispose() {
    pageControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return PageView.builder(
        controller: pageControl,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.show.length,
        itemBuilder: (BuildContext context, index) {
          return Center(
            child: AnimatedPadding(
              duration: const Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              padding: start
                  ? const EdgeInsets.only(
                right: 20,
              )
                  : const EdgeInsets.only(right: 25),
              child: AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: start ? 1 : .10,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 800),
                  // curve: Curves.fastLinearToSlowEaseIn,
                  opacity: index == currentPage ? 1 : .2,
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EventDetails(widget.show[index])));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentPage
                          ? screenHeight * .46
                          : screenHeight * .41,
                      width: index == currentPage
                          ? screenWidth * .9
                          : screenWidth * .8,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: index == currentPage
                                  ? Constants.iconAc.withOpacity(.05)
                                  : Colors.transparent,
                              spreadRadius: 2,
                              blurRadius: 20,
                            )
                          ],
                          image: DecorationImage(
                            fit: index == currentPage
                                ? BoxFit.fill
                                : BoxFit.cover,
                            image: widget.catSelect == 0
                                ? (widget.show[index]['event'] == null
                                ? const NetworkImage(
                                "https://ieeesbtkmce-assets.s3.amazonaws.com/media/events/posters/stomp_yard_org.jpeg",
                                scale: 1.0)
                                : NetworkImage(
                              widget.show[index]['event']['image'],
                            ))
                                : (widget.show[index]['image'] == null
                                ? const NetworkImage(
                                "https://ieeesbtkmce-assets.s3.amazonaws.com/media/events/posters/stomp_yard_org.jpeg",
                                scale: 1.0)
                                : NetworkImage(
                              widget.show[index]['image'],
                            )),
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black26,
                              Colors.transparent,
                              Colors.transparent
                            ],
                          ),
                          border: Border.all(color: Constants.sc),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
