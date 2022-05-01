import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final _pageController = PageController(
    viewportFraction: 0.7,
    initialPage: 0,
  );
  int _currentPage = 0;
  List<Map> data = [
    {
      'name': 'APJ Park',
      'caption': 'A place to rejoice',
      'image':
          'https://lh5.googleusercontent.com/p/AF1QipPvmyaURyUViNzksGMeVfIvvwfPDGnT__M5HVzq=w400-h300-k-no'
    },
    {
      'name': 'Auditorium',
      'caption': 'Those damn big ceiling fans',
      'image': 'https://www.frametechsteels.com/admin/pic/tkm.jpg'
    },
    {
      'name': 'Central Portico',
      'caption': 'The heart of TKM',
      'image':
          'https://fastly.4sqi.net/img/general/600x600/zbqkILofkVpcC8tzgeUeUmHciyBbhFa65jLzdpu2tdo.jpg'
    },
    {
      'name': 'Central Library',
      'caption': 'The place for nerds and couples',
      'image': 'https://www.tkmce.ac.in/images/arch/lib.png'
    },
    {
      'name': 'College Ground',
      'caption': 'Where things get fierce',
      'image': 'https://www.tkmce.ac.in/images/pe/FOOTBALL%20COURT.jpg'
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: NotificationListener(
        onNotification: (notification) {
          return true;
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_currentPage == 0)
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 10,
                  top: 30,
                  bottom: 30,
                ),
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    "The Hotspots",
                    style: TextStyle(
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white24,
                    ),
                  ),
                ),
              ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _currentPage == index ? 1.0 : 0.5,
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: Constants.color3,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  opacity: 0.25,
                                  image: NetworkImage(data[index]['image'])),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.color3.withOpacity(.4),
                                  Constants.color3.withOpacity(.8),
                                ],
                                begin: AlignmentDirectional.topStart,
                                end: AlignmentDirectional.bottomEnd,
                              ),
                            ),
                            padding: const EdgeInsets.all(20),
                            margin: _currentPage == index
                                ? const EdgeInsets.all(5)
                                : const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  index + 1 < 10
                                      ? "0" + (index + 1).toString()
                                      : (index + 1).toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 40,
                                      color: Constants.color2.withOpacity(.5)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Constants.color2
                                              .withOpacity(.75)),
                                    ),
                                    Text(
                                      data[index]['caption'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Constants.color2.withOpacity(.5)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Click to see what happens at " +
                                          data[index]['name'] +
                                          " during Hestia'22",
                                      style: TextStyle(
                                          overflow: TextOverflow.clip,
                                          fontSize: 12,
                                          color: Constants.color2
                                              .withOpacity(.25)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
