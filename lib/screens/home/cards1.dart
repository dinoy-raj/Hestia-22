import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../events/events.dart';

class EventCards1 extends StatefulWidget {
  final List<dynamic>? show;
  final int catSelect;
  const EventCards1(this.show, this.catSelect, {Key? key}) : super(key: key);

  @override
  State<EventCards1> createState() => _EventCardsState();
}

class _EventCardsState extends State<EventCards1> {
  PageController pageControl =
      PageController(viewportFraction: .80, initialPage: 0);
  int currentPage = 0;

  bool start = false;

  @override
  void initState() {
    super.initState();
    start = false;

    pageControl.addListener(() {
      if (mounted) {
        setState(() {
          currentPage = pageControl.page!.round();
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          start = true;
        });
      }
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
    return widget.show == null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CupertinoActivityIndicator(),
            ],
          )
        : widget.show!.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(seconds: 3),
                    opacity: start ? 1 : 0,
                    child: const Text(
                      "Coming Soon...",
                      style: TextStyle(
                        fontFamily: "Helvetica",
                        color: Constants.iconAc,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            : PageView.builder(
                controller: pageControl,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.show?.length,
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
                                      builder: (context) => EventDetails(
                                          widget.show![index]['event'])));
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Hero(
                                  tag: widget.show![index]['event']['title'],
                                  child: CachedNetworkImage(
                                    fadeInDuration:
                                        const Duration(milliseconds: 500),
                                    fadeInCurve: Curves.fastLinearToSlowEaseIn,
                                    fit: index == currentPage
                                        ? BoxFit.fill
                                        : BoxFit.cover,
                                    imageUrl: widget.show![index]['event']
                                        ['image'],
                                    errorWidget:
                                        (BuildContext context, url, error) =>
                                            const Text(
                                      "Error In Loading",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
  }
}
