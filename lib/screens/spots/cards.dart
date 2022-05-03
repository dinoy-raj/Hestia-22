import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/spots/spot_page.dart';
import 'package:map_launcher/map_launcher.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final _pageController = PageController(
    viewportFraction: 0.75,
    initialPage: 0,
  );
  int _currentPage = 0;
  double _scroll = 0;
  List<Map> data = [
    {
      'name': 'APJ Park',
      'caption': 'A place to rejoice',
      'image':
          'https://lh5.googleusercontent.com/p/AF1QipPvmyaURyUViNzksGMeVfIvvwfPDGnT__M5HVzq=w400-h300-k-no',
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
      'coordinates': Coords(8.91529279156957, 76.63208092627158),
    },
    {
      'name': 'Auditorium',
      'caption': 'Those damn big ceiling fans',
      'image': 'https://www.frametechsteels.com/admin/pic/tkm.jpg',
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
      'coordinates': Coords(8.913917697612797, 76.63223907846609),
    },
    {
      'name': 'Central Portico',
      'caption': 'The heart of TKM',
      'image':
          'https://fastly.4sqi.net/img/general/600x600/zbqkILofkVpcC8tzgeUeUmHciyBbhFa65jLzdpu2tdo.jpg',
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
      'coordinates': Coords(8.91422034502311, 76.63194505582268),
    },
    {
      'name': 'Central Library',
      'caption': 'The place for nerds and couples',
      'image': 'https://www.tkmce.ac.in/images/arch/lib.png',
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
      'coordinates': Coords(8.914290104514944, 76.63293813972732),
    },
    {
      'name': 'College Ground',
      'caption': 'Where things get fierce',
      'image': 'https://www.tkmce.ac.in/images/pe/FOOTBALL%20COURT.jpg',
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
      'coordinates': Coords(8.913235656865478, 76.63269614956816),
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _scroll = _pageController.page!;
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
            AnimatedCrossFade(
              duration: Duration(milliseconds: 300),
              firstChild: const Padding(
                padding: EdgeInsets.only(
                  left: 15,
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
              secondChild: SizedBox(
                height: 0,
              ),
              crossFadeState: _scroll <= 0.2
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: data[index]['name'],
                    child: Material(
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          SpotPage(
                                            data: data[index],
                                          )));
                        },
                        child: ClipRRect(
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
                                        image:
                                            NetworkImage(data[index]['image'])),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        index + 1 < 10
                                            ? "0" + (index + 1).toString()
                                            : (index + 1).toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 40,
                                            color: Constants.color2
                                                .withOpacity(.5)),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                color: Constants.color2
                                                    .withOpacity(.5)),
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
                        ),
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