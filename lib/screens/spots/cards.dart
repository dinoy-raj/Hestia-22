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
  bool _animate = true;
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
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _animate = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: _animate
          ? const EdgeInsets.only(
              top: 20,
              right: 8,
              left: 8,
            )
          : const EdgeInsets.only(
              top: 20,
            ),
      duration: const Duration(milliseconds: 1000),
      child: SizedBox(
        height: 360,
        child: NotificationListener(
          onNotification: (notification) {
            return true;
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                firstChild: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 30,
                    bottom: 30,
                  ),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: AnimatedPadding(
                      padding: _animate
                          ? const EdgeInsets.only(
                              top: 20,
                              right: 20,
                            )
                          : const EdgeInsets.only(
                              top: 20,
                            ),
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
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
                ),
                secondChild: const SizedBox(
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
                                MaterialPageRoute(
                                    builder: (context) => SpotPage(
                                          data: data[index],
                                        )));
                          },
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: _currentPage == index ? 1.0 : 0.5,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: const EdgeInsets.all(20),
                              margin: _currentPage == index
                                  ? EdgeInsets.zero
                                  : const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: Constants.color3.withOpacity(.25),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    opacity: 0.5,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data[index]['image'])),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    index + 1 < 10
                                        ? "0" + (index + 1).toString()
                                        : (index + 1).toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 30,
                                        color:
                                            Constants.color2.withOpacity(.5)),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index]['name'],
                                        style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Constants.color2
                                                .withOpacity(.9)),
                                      ),
                                      Text(
                                        data[index]['caption'],
                                        style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize: 14,
                                            color: Constants.color2
                                                .withOpacity(.65)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        data[index]['description'],
                                        style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize: 12,
                                            color: Constants.color2
                                                .withOpacity(.35)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ],
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
      ),
    );
  }
}
