import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/main.dart';
import 'package:flutter/material.dart';
import 'package:hestia22/screens/home/tab.dart';

import 'notification.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  //for initial animations future delayed
  static bool start = false;
  //notification icon
  static bool notPressed = false;

  //filter icon
  static bool filPressed = false;

  //category list
  static int catSelect = 10;
  static List category = [
    "Proshows",
    "Culturals",
    "Workshops",
    "Technical",
    "Lectures",
    "Informals",
  ];

  //Proshow list data

  List<Map> show = [
    {
      'name': 'Diego miranda',
      'date': '26',
      'remain': '120',
      'price': '1500',
      'image':
          'https://img.freepik.com/free-photo/vertical-picture-male-dj-working_181624-19913.jpg?t=st=1651607900~exp=1651608500~hmac=bd97bc8d7ad76584255bf9c1fddb4711059a1b5e8ab65d2ee73f13780e57ad1b&w=360',
    },
    {
      'name': 'Club banditz',
      'date': '27',
      'remain': '10',
      'price': '700',
      'image':
          'https://img.freepik.com/free-photo/young-caucasian-female-musician-performer-singing-dancing-neon-light-gradient_155003-44335.jpg?t=st=1651607959~exp=1651608559~hmac=f554832ef41c853ed8b05414ba9bbce9a93ee95a31d0201b3fd3daca6ebb186d&w=360',
    },
    {
      'name': 'Pineapple express',
      'date': '28',
      'remain': '67',
      'price': '1000',
      'image':
          'https://img.freepik.com/free-photo/front-view-young-female-dj-entertaining-crowd_23-2148325470.jpg?t=st=1651607959~exp=1651608559~hmac=aef81b2e61633c74b2a17941df04b3411b0aef93ffb75f052f7af2a298d29093&w=740',
    },
    {
      'name': 'Aron chupa',
      'date': '28',
      'remain': '20',
      'price': '2000',
      'image':
          'https://img.freepik.com/free-photo/long-hair-guitar-guy-singing-low-view_23-2148751621.jpg?t=st=1651608075~exp=1651608675~hmac=590784e3a1ef7441c6bd3b757085ce0802e2b65c90d53ac776aecaa32ecf982c&w=740',
    },
    {
      'name': 'Neeraj',
      'date': '29',
      'remain': '100',
      'price': '900',
      'image':
          'https://img.freepik.com/free-photo/silhouette-young-lady-crowd-during-concert_181624-27673.jpg?t=st=1651608300~exp=1651608900~hmac=9a52e83e60ea919dd09f93181dea28dd25657fa78845a1f5aacc7428b21efcc3&w=996',
    }
  ];

  List Sort1 = ["name", "price", "date"];
  int showIndex = 0;

  //workshop list data

  List<Map> workshop = [
    {
      'name': '',
      'date': '',
      'remain': '',
      'price': '',
    }
  ];

  List Sort2 = ["name", "price", "date"];

  //culturals list data

  List<Map> cultural = [
    {
      'name': '',
      'short': '',
      'date': '',
      'prize': '',
    }
  ];
  List Sort3 = [];

  PageController pageControl =
      PageController(viewportFraction: .80, initialPage: 0);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    notPressed = false;
    start = false;
    // catSelect = 10;
    pageControl.addListener(() {
      setState(() {
        currentPage = pageControl.page!.round();
      });
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        start = true;
        catSelect = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Constants.sc,
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Stack(
              children: [
                //homepage body part
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //header section
                      AnimatedPadding(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        padding: start
                            ? const EdgeInsets.only(left: 20, right: 20)
                            : const EdgeInsets.only(left: 0, right: 0),
                        child: SizedBox(
                          height: screenHeight * .1,
                          width: screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //welcome note
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AnimatedOpacity(
                                    duration: const Duration(seconds: 3),
                                    curve: Curves.decelerate,
                                    opacity: start ? 1 : 0,
                                    child: const Text(
                                      "Hi, Dinoy Raj 👋",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'helvetica',
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * .005,
                                  ),
                                  AnimatedOpacity(
                                    duration: const Duration(seconds: 3),
                                    curve: Curves.decelerate,
                                    opacity: start ? 1 : 0,
                                    child: Text(
                                      "Explore Events",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          fontFamily: 'helvetica',
                                          color: Constants.iconIn),
                                    ),
                                  ),
                                ],
                              ),

                              //notification bell
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    notPressed = !notPressed;
                                  });
                                },
                                child: AnimatedOpacity(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  opacity: start ? 1 : 0,
                                  child: Badge(
                                    badgeColor: Constants.iconAc,
                                    badgeContent: const Text(
                                      "1",
                                      style: TextStyle(
                                        fontFamily: 'Helvetica',
                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    animationDuration:
                                        const Duration(milliseconds: 700),
                                    animationType: BadgeAnimationType.scale,
                                    child: AnimatedContainer(
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      height: notPressed
                                          ? screenHeight * .048
                                          : screenHeight * .05,
                                      width: notPressed
                                          ? screenHeight * .048
                                          : screenHeight * .05,
                                      decoration: BoxDecoration(
                                          border: notPressed
                                              ? Border.all(
                                                  color: Constants.iconAc)
                                              : Border.all(
                                                  color: Colors.transparent),
                                          color: Colors.grey.withOpacity(.1),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: AnimatedOpacity(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        opacity: start ? 1 : 0,
                                        child: Icon(
                                          FontAwesomeIcons.bell,
                                          size: screenHeight * .025,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //search & sort part
                      AnimatedPadding(
                        duration: const Duration(seconds: 1),
                        curve: Curves.decelerate,
                        padding: start
                            ? const EdgeInsets.only(left: 20, right: 20)
                            : const EdgeInsets.only(left: 10, right: 10),
                        child: AnimatedOpacity(
                          duration: const Duration(seconds: 1),
                          curve: Curves.decelerate,
                          opacity: start ? 1 : 0,
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            height: screenHeight * .065,
                            width: screenWidth * .92,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.05),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //search icon
                                SizedBox(
                                  height: screenHeight * .05,
                                  width: screenHeight * .05,
                                  child: Icon(
                                    FontAwesomeIcons.magnifyingGlass,
                                    size: 17,
                                    color: Constants.iconIn,
                                  ),
                                ),

                                //
                                AnimatedPadding(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.decelerate,
                                  padding: start
                                      ? const EdgeInsets.only(left: 0)
                                      : const EdgeInsets.only(left: 10),
                                  child: SizedBox(
                                    height: screenHeight * .065,
                                    width: screenWidth * .65,
                                    child: TextField(
                                      scrollPhysics:
                                          const BouncingScrollPhysics(),
                                      cursorColor: Constants.iconIn,
                                      cursorRadius: const Radius.circular(10),
                                      style: const TextStyle(
                                        fontFamily: 'Helvetica',
                                        color: Constants.iconAc,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        hintText: "Discover new event",
                                        hintStyle: TextStyle(
                                          fontFamily: 'Helvetica',
                                          color: Constants.iconIn,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w100,
                                        ),
                                        hoverColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        border: InputBorder.none,
                                        contentPadding: const EdgeInsets.all(0),
                                      ),
                                    ),
                                  ),
                                ),

                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 1800),
                                  curve: Curves.decelerate,
                                  opacity: start ? 1 : 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        filPressed = !filPressed;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.decelerate,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: filPressed
                                                ? Constants.iconAc
                                                : Colors.transparent),
                                      ),
                                      height: screenHeight * .05,
                                      width: screenHeight * .05,
                                      child: Icon(
                                        FontAwesomeIcons.sliders,
                                        color: filPressed
                                            ? Colors.grey
                                            : Constants.iconIn,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // category section
                      AnimatedPadding(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        padding: start
                            ? const EdgeInsets.only(left: 20, right: 20)
                            : const EdgeInsets.only(left: 0, right: 0),
                        child: AnimatedOpacity(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          opacity: start ? 1 : 0,
                          child: Container(
                            height: screenHeight * .1,
                            width: screenWidth,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 13.0, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Categories",
                                        style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold,
                                          color: Constants.iconIn,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * .045,
                                  width: screenWidth,
                                  child: ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0.05)
                                        ],
                                        stops: const [0.8, 1],
                                        tileMode: TileMode.mirror,
                                      ).createShader(bounds);
                                    },
                                    child: ListView.builder(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: category.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                catSelect = index;
                                              });
                                            },
                                            child: AnimatedOpacity(
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve:
                                                  Curves.fastLinearToSlowEaseIn,
                                              opacity: start ? 1 : 0,
                                              child: AnimatedPadding(
                                                padding: start
                                                    ? const EdgeInsets.only(
                                                        right: 12)
                                                    : const EdgeInsets.only(
                                                        right: 16),
                                                curve: Curves.decelerate,
                                                duration:
                                                    const Duration(seconds: 1),
                                                child: AnimatedContainer(
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  curve: Curves.decelerate,
                                                  height: screenHeight * .02,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: catSelect == index
                                                        ? Constants.color1
                                                        : Colors.grey
                                                            .withOpacity(.1),
                                                    border: Border.all(
                                                        color: catSelect ==
                                                                index
                                                            ? Constants.iconAc
                                                            : Colors
                                                                .transparent),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      category[index],
                                                      style: TextStyle(
                                                        color: catSelect ==
                                                                index
                                                            ? Colors.white
                                                            : Constants.iconIn,
                                                        fontFamily: 'Helvetica',
                                                        fontWeight: catSelect ==
                                                                index
                                                            ? FontWeight.bold
                                                            : FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // event list
                      SizedBox(
                        height: screenHeight * .6,
                        width: screenWidth,
                        // decoration: BoxDecoration(),
                        child: PageView.builder(
                            controller: pageControl,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: show.length,
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
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    opacity: index == currentPage ? 1 : .50,
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 800),
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
                                                  ? Constants.iconAc
                                                      .withOpacity(.05)
                                                  : Colors.transparent,
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  show[index]['image'])),
                                          gradient: const LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Colors.black26,
                                              Colors.transparent,
                                              Colors.transparent
                                            ],
                                          ),
                                          border:
                                              Border.all(color: Constants.sc),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.grey),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //date of event
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 3, sigmaY: 3),
                                                      child: AnimatedOpacity(
                                                        duration:
                                                            const Duration(
                                                                seconds: 1),
                                                        curve:
                                                            Curves.decelerate,
                                                        opacity:
                                                            index == currentPage
                                                                ? 1
                                                                : .5,
                                                        child:
                                                            AnimatedContainer(
                                                          curve:
                                                              Curves.decelerate,
                                                          duration:
                                                              const Duration(
                                                                  seconds: 1),
                                                          height: screenHeight *
                                                              .055,
                                                          width: screenHeight *
                                                              .055,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  gradient: LinearGradient(
                                                                      begin: Alignment
                                                                          .bottomLeft,
                                                                      end: Alignment
                                                                          .topRight,
                                                                      colors: [
                                                                        Colors
                                                                            .white
                                                                            .withOpacity(.1),
                                                                        Colors
                                                                            .white
                                                                            .withOpacity(.03),
                                                                        Colors
                                                                            .black26
                                                                            .withOpacity(.1)
                                                                      ])),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                show[index]
                                                                    ['date'],
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Helvetica',
                                                                    fontSize:
                                                                        screenHeight *
                                                                            .023,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "May",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Helvetica',
                                                                  fontSize:
                                                                      screenHeight *
                                                                          .012,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          //bottom (name+prize+)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                        sigmaX: 10, sigmaY: 10),
                                                    child: AnimatedOpacity(
                                                      duration: const Duration(
                                                          seconds: 1),
                                                      curve: Curves.decelerate,
                                                      opacity:
                                                          index == currentPage
                                                              ? 1
                                                              : .5,
                                                      child: AnimatedContainer(
                                                        curve:
                                                            Curves.decelerate,
                                                        duration:
                                                            const Duration(
                                                                seconds: 1),
                                                        height:
                                                            screenHeight * .08,
                                                        width: index ==
                                                                currentPage
                                                            ? screenWidth * .6
                                                            : screenWidth * .5,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        // child: Column(
                                                        //   mainAxisAlignment:
                                                        //       MainAxisAlignment
                                                        //           .spaceAround,
                                                        //   children: [
                                                        //     Text(
                                                        //       show[index]
                                                        //           ['name'],
                                                        //       style: const TextStyle(
                                                        //           fontSize: 30,
                                                        //           color: Colors
                                                        //               .white,
                                                        //           fontFamily:
                                                        //               "Helvetica",
                                                        //           fontWeight:
                                                        //               FontWeight
                                                        //                   .bold),
                                                        //     ),
                                                        //     Container(
                                                        //       child: ClipRRect(
                                                        //         borderRadius:
                                                        //             BorderRadius
                                                        //                 .circular(
                                                        //                     10),
                                                        //         child:
                                                        //             BackdropFilter(
                                                        //           filter: ImageFilter
                                                        //               .blur(
                                                        //                   sigmaX:
                                                        //                       3,
                                                        //                   sigmaY:
                                                        //                       3),
                                                        //           child:
                                                        //               AnimatedContainer(
                                                        //               curve: Curves
                                                        //                 .decelerate,
                                                        //               duration: const Duration(
                                                        //                 milliseconds:
                                                        //                     100),
                                                        //               height:
                                                        //                 screenHeight *
                                                        //                     .04,
                                                        //               width:
                                                        //                 screenWidth *
                                                        //                     .4,
                                                        //               decoration:
                                                        //                 BoxDecoration(
                                                        //               // border: Border.all(color: Colors.white,width: .1),
                                                        //               color: Colors
                                                        //                   .white
                                                        //                   .withOpacity(.1),
                                                        //               borderRadius:
                                                        //                   BorderRadius.circular(10),
                                                        //               ),
                                                        //               child:
                                                        //                 Row(
                                                        //               mainAxisAlignment:
                                                        //                   MainAxisAlignment.spaceAround,
                                                        //               children: [
                                                        //                 Text(
                                                        //                   '\u{20B9}' +
                                                        //                       show[index]['price'],
                                                        //                   style: TextStyle(
                                                        //                       fontSize: 15,
                                                        //                       color: Colors.white.withOpacity(.4),
                                                        //                       fontFamily: 'Helvetica',
                                                        //                       fontWeight: FontWeight.bold),
                                                        //                 ),
                                                        //                 Container(
                                                        //                   height:
                                                        //                       screenHeight * .02,
                                                        //                   width:
                                                        //                       2,
                                                        //                   decoration:
                                                        //                       BoxDecoration(color: Constants.iconIn, borderRadius: BorderRadius.circular(10)),
                                                        //                 ),
                                                        //                 Text(
                                                        //                   show[index]['remain'] +
                                                        //                       " 🎫",
                                                        //                   style:
                                                        //                       TextStyle(
                                                        //                     fontSize: 15,
                                                        //                     fontFamily: 'Helvetica',
                                                        //                     fontWeight: FontWeight.bold,
                                                        //                     color: Colors.white.withOpacity(.4),
                                                        //                   ),
                                                        //                 ),
                                                        //               ],
                                                        //               ),
                                                        //             ),
                                                        //         ),
                                                        //       ),
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),

                //filter page
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * .07),
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: filPressed ? screenHeight * .35 : 0,
                          width: screenWidth * .85,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                height: filPressed ? screenHeight * .4 : 0,
                                width: screenWidth * .85,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black.withOpacity(.8)),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: AnimatedPadding(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.decelerate,
                                    padding: filPressed
                                        ? EdgeInsets.all(screenHeight * .025)
                                        : const EdgeInsets.all(0),
                                    child: AnimatedOpacity(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.decelerate,
                                      opacity: filPressed ? 1 : 0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: screenHeight * .05,
                                            width: screenWidth * .85,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AnimatedOpacity(
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  curve: Curves.decelerate,
                                                  opacity: filPressed ? 1 : 0,
                                                  child: Container(
                                                      height:
                                                          screenHeight * .04,
                                                      width: screenWidth * .34,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Constants
                                                                  .iconAc),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              filPressed =
                                                                  false;
                                                            });
                                                          },
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .transparent),
                                                          ),
                                                          child: const Text(
                                                            "Clear",
                                                            style: TextStyle(
                                                                color: Constants
                                                                    .color2,
                                                                fontFamily:
                                                                    'Helvetica',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))),
                                                ),
                                                AnimatedOpacity(
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  curve: Curves.decelerate,
                                                  opacity: filPressed ? 1 : 0,
                                                  child: SizedBox(
                                                      height:
                                                          screenHeight * .04,
                                                      width: screenWidth * .34,
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              filPressed =
                                                                  false;
                                                              if (showIndex ==
                                                                  0) {
                                                                show.sort((a, b) => a[
                                                                        'name']
                                                                    .compareTo(b[
                                                                        'name']));
                                                              } else if (showIndex ==
                                                                  1) {
                                                                show.sort((a, b) => int
                                                                        .parse(b[
                                                                            'price'])
                                                                    .compareTo(int
                                                                        .parse(a[
                                                                            'price'])));
                                                              } else {
                                                                show.sort((a, b) => int
                                                                        .parse(a[
                                                                            'date'])
                                                                    .compareTo(int
                                                                        .parse(b[
                                                                            'date'])));
                                                              }
                                                            });
                                                          },
                                                          style: ButtonStyle(
                                                              overlayColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              .5)),
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Constants
                                                                          .iconAc)),
                                                          child: const Text(
                                                            "Apply",
                                                            style: TextStyle(
                                                                color: Constants
                                                                    .color2,
                                                                fontFamily:
                                                                    'Helvetica',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * .25,
                                            width: screenWidth * .85,
                                            child: ListView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemCount: Sort1.length,
                                                scrollDirection: Axis.vertical,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return AnimatedPadding(
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.decelerate,
                                                    padding: EdgeInsets.only(
                                                      top: filPressed
                                                          ? (screenHeight * .01)
                                                          : 0,
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          showIndex = index;
                                                        });
                                                      },
                                                      child: AnimatedContainer(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    700),
                                                        curve:
                                                            Curves.decelerate,
                                                        height:
                                                            screenHeight * .055,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: showIndex ==
                                                                  index
                                                              ? Constants.iconAc
                                                              : Colors.grey
                                                                  .withOpacity(
                                                                      .1),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              Sort1[index],
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Helvetica',
                                                                  fontSize: 15
                                                                  //fontWeight: FontWeight.bold
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
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
                  ],
                ),

                notificationPage(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
