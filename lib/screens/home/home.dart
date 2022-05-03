import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //for initial animations future delayed
  bool start = false;
  //notification icon
  bool notPressed = false;

  //notification icon
  bool filPressed = false;

  //category list
  int catSelect = 10;
  List category = [
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
      'image': '',
    },
    {
      'name': 'Club banditz',
      'date': '27',
      'remain': '10',
      'price': '700',
      'image': '',
    },
    {
      'name': 'pineapple express',
      'date': '28',
      'remain': '67',
      'price': '1000',
      'image': '',
    },
    {
      'name': 'aron chupa',
      'date': '28',
      'remain': '20',
      'price': '2000',
      'image': '',
    },
    {
      'name': 'dino',
      'date': '29',
      'remain': '100',
      'price': '900',
      'image': '',
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

  PageController pageControl = new PageController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
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
            padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
            child: Stack(
              children: [
                //homepage body part
                AnimatedPadding(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  padding: start
                      ? const EdgeInsets.only(left: 10, right: 10)
                      : const EdgeInsets.only(left: 0, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //header section
                      SizedBox(
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
                                      child: const Icon(
                                        FontAwesomeIcons.bell,
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

                      //search & sort part
                      AnimatedOpacity(
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
                              SizedBox(
                                height: screenHeight * .05,
                                width: screenHeight * .05,
                                child: Icon(
                                  FontAwesomeIcons.magnifyingGlass,
                                  size: 17,
                                  color: Constants.iconIn,
                                ),
                              ),
                              AnimatedPadding(
                                duration: const Duration(seconds: 1),
                                curve: Curves.decelerate,
                                padding: start
                                    ? const EdgeInsets.only(left: 0)
                                    : const EdgeInsets.only(left: 20),
                                child: SizedBox(
                                  height: screenHeight * .05,
                                  width: screenWidth * .65,
                                  child: TextFormField(
                                    scrollPhysics:
                                        const BouncingScrollPhysics(),
                                    cursorColor: Constants.iconIn,
                                    cursorRadius: const Radius.circular(10),
                                    style: const TextStyle(
                                      fontFamily: 'Helvetica',
                                      color: Constants.iconAc,
                                      fontSize: 16,
                                    ),
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
                                      fillColor: Colors.transparent,
                                      border: InputBorder.none,
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

                      //category section
                      Container(
                        height: screenHeight * .1,
                        width: screenWidth,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 13.0, bottom: 10),
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
                            Container(
                              height: screenHeight * .045,
                              width: screenWidth,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: category.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          catSelect = index;
                                        });
                                      },
                                      child: AnimatedOpacity(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.decelerate,
                                        opacity: start ? 1 : 0,
                                        child: AnimatedPadding(
                                          padding: start
                                              ? EdgeInsets.only(right: 8)
                                              : EdgeInsets.only(right: 15),
                                          curve: Curves.decelerate,
                                          duration: Duration(seconds: 1),
                                          child: AnimatedContainer(
                                            duration: Duration(seconds: 1),
                                            curve: Curves.decelerate,
                                            height: screenHeight * .02,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: catSelect == index
                                                  ? Constants.color1
                                                  : Colors.grey.withOpacity(.1),
                                              border: Border.all(
                                                  color: catSelect == index
                                                      ? Constants.iconAc
                                                      : Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                category[index],
                                                style: TextStyle(
                                                  color: catSelect == index
                                                      ? Colors.white
                                                      : Constants.iconIn,
                                                  fontFamily: 'Helvetica',
                                                  fontWeight: catSelect == index
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
                          ],
                        ),
                      ),

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
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedPadding(
                                    duration: const Duration(seconds: 1),
                                    padding: start
                                        ? EdgeInsets.only(
                                            left: 0,
                                          )
                                        : EdgeInsets.only(left: 0),
                                    child: AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      height: screenHeight * .45,
                                      width: screenWidth * .7,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
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
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: filPressed ? screenHeight * .4 : 0,
                          width: screenWidth * .85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Constants.color1),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: AnimatedPadding(
                              duration: Duration(seconds: 3),
                              curve: Curves.decelerate,
                              padding: filPressed
                                  ? EdgeInsets.all(15)
                                  : EdgeInsets.all(0),
                              child: AnimatedOpacity(
                                duration: Duration(seconds: 2),
                                curve: Curves.decelerate,
                                opacity: filPressed ? 1 : 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: screenHeight * .05,
                                      width: screenWidth * .85,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          AnimatedOpacity(
                                            duration:
                                                const Duration(seconds: 3),
                                            curve: Curves.decelerate,
                                            opacity: filPressed ? 1 : 0,
                                            child: Container(
                                                height: screenHeight * .04,
                                                width: screenWidth * .34,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            Constants.iconAc),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        filPressed = false;
                                                      });
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                    ),
                                                    child: Text(
                                                      "Clear",
                                                      style: TextStyle(
                                                          color:
                                                              Constants.color2,
                                                          fontFamily:
                                                              'Helvetica',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                          ),
                                          AnimatedOpacity(
                                            duration:
                                                const Duration(seconds: 3),
                                            curve: Curves.decelerate,
                                            opacity: filPressed ? 1 : 0,
                                            child: Container(
                                                height: screenHeight * .04,
                                                width: screenWidth * .34,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        filPressed = false;
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
                                                    child: Text(
                                                      "Apply",
                                                      style: TextStyle(
                                                          color:
                                                              Constants.color2,
                                                          fontFamily:
                                                              'Helvetica',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: screenHeight * .3,
                                      width: screenWidth * .85,
                                      child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: Sort1.length,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return AnimatedPadding(
                                              duration: Duration(seconds: 2),
                                              curve: Curves.decelerate,
                                              padding: EdgeInsets.only(
                                                top: filPressed
                                                    ? (screenHeight * .02)
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
                                                      Duration(seconds: 1),
                                                  curve: Curves.decelerate,
                                                  height: screenHeight * .06,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: showIndex == index
                                                        ? Constants.iconAc
                                                        : Colors.grey
                                                            .withOpacity(.1),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        Sort1[index],
                                                        style: TextStyle(
                                                            color: Colors.white,
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
                  ],
                ),

                //notification page
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * .1,
                      width: screenWidth,
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: notPressed ? screenHeight * .6 : 0,
                      width: screenWidth * .91,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
