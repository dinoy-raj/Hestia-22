import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/events/events.dart';
import 'package:hestia22/screens/home/card2.dart';
import 'package:hestia22/screens/home/cards1.dart';
import 'card3.dart';
import 'card4.dart';
import 'card5.dart';
import 'card6.dart';
import 'notification.dart';

class Home extends StatefulWidget {
  final List<dynamic>? event0;
  final List<dynamic>? event1;
  final List<dynamic>? event2;
  final List<dynamic>? event3;
  final List<dynamic>? event4;
  final List<dynamic>? event5;
  final List<dynamic>? event6;
  final List<dynamic>? a;
  final Map? profile;

  const Home(this.event0, this.event1, this.event2, this.event3, this.event4,
      this.event5, this.event6, this.profile, this.a,
      {Key? key})
      : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  //for initial animations future delayed
  static bool start = false;
  //notification icon
  static bool notificationPressed = false;

  //filter icon
  static bool filterPressed = false;

  //category list
  static int catSelect = 10;
  static List category = [
    "Trending",
    "Culturals",
    "Technical",
    "General",
    "Workshops",
    "Lectures",
    "Proshows",
  ];

  late Map eDetails;

  List sortFields = ["Title", "Prize", "Date", "Fees"];
  int showIndex = 0;
  List<dynamic>? all;
  late List name;

  List<dynamic>? show;
  List<dynamic>? unreadNotifications;
  List<dynamic>? allNotifications;

  List<String> _getSuggestions(String pattern) {
    List<String> list = [];

    if (widget.a != null) {
      for (var map in widget.a!) {
        if (list.length < 4) {
          if (map['title'].toLowerCase().contains(pattern.toLowerCase())) {
            list.add(map['title']);
            if (list.length == 4) {
              break;
            }
          }
        }
      }
      return list;
    } else {
      return list;
    }
  }

  @override
  void initState() {
    super.initState();
    notificationPressed = false;
    start = false;
    catSelect = 10;
    show = widget.event0;

    auth.getNotifications().then((value) async {
      allNotifications = List<dynamic>.from(value);

      List toRemove = [];

      for (Map notification in value) {
        if (await const FlutterSecureStorage().read(
                key: 'read_notification' + notification['id'].toString()) !=
            null) {
          for (var element in value) {
            if (element['id'] == notification['id']) {
              toRemove.add(element);
            }
          }
        }
      }

      value.removeWhere((element) => toRemove.contains(element));

      if (mounted) {
        setState(() {
          unreadNotifications = value;
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          start = true;
          catSelect = 0;
        });
      }
    });
  }

  void sort(String field, bool reverse) {
    setState(() {
      filterPressed = false;
      switch (catSelect) {
        case 0:
          widget.event0?.sort((a, b) {
            if (a['event'][field] == null) {
              return 1;
            } else if (b['event'][field] == null) {
              return -1;
            }

            return reverse
                ? -a['event'][field].compareTo(b['event'][field])
                : a['event'][field].compareTo(b['event'][field]);
          });
          break;
        case 1:
          widget.event1?.sort((a, b) {
            if (a[field] == null) {
              return 1;
            } else if (b[field] == null) {
              return -1;
            }

            return reverse
                ? -a[field].compareTo(b[field])
                : a[field].compareTo(b[field]);
          });
          break;
        case 2:
          widget.event2?.sort((a, b) {
            if (a[field] == null) {
              return 1;
            } else if (b[field] == null) {
              return -1;
            }

            return reverse
                ? -a[field].compareTo(b[field])
                : a[field].compareTo(b[field]);
          });
          break;
        case 3:
          widget.event3?.sort((a, b) {
            if (a[field] == null) {
              return 1;
            } else if (b[field] == null) {
              return -1;
            }

            return reverse
                ? -a[field].compareTo(b[field])
                : a[field].compareTo(b[field]);
          });
          break;
        case 4:
          widget.event4?.sort((a, b) {
            if (a[field] == null) {
              return 1;
            } else if (b[field] == null) {
              return -1;
            }

            return reverse
                ? -a[field].compareTo(b[field])
                : a[field].compareTo(b[field]);
          });
          break;
        case 5:
          widget.event5?.sort((a, b) {
            if (a[field] == null) {
              return 1;
            } else if (b[field] == null) {
              return -1;
            }

            return reverse
                ? -a[field].compareTo(b[field])
                : a[field].compareTo(b[field]);
          });
          break;
        case 6:
          widget.event6?.sort((a, b) {
            if (a[field] == null) {
              return 1;
            } else if (b[field] == null) {
              return -1;
            }

            return reverse
                ? -a[field].compareTo(b[field])
                : a[field].compareTo(b[field]);
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () async {
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
                                  //expanded removed
                                  AnimatedOpacity(
                                    duration: const Duration(seconds: 3),
                                    curve: Curves.decelerate,
                                    opacity: start ? 1 : 0,
                                    child: SizedBox(
                                      width: screenWidth * .7,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "Hi, ${widget.profile == null ? "" : widget.profile!['name'].split(' ').first} ",
                                              style: const TextStyle(
                                                overflow: TextOverflow.fade,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                fontFamily: 'helvetica',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: screenWidth * .01,
                                          ),
                                          Image.network(
                                            "https://raw.githubusercontent.com/MartinHeinz/MartinHeinz/master/wave.gif",
                                            height: screenHeight * .025,
                                            alignment: Alignment.centerLeft,
                                            width: screenHeight * .025,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * .01,
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
                                  SizedBox(
                                    height: screenHeight * .01,
                                  ),
                                ],
                              ),

                              //notification bell
                              GestureDetector(
                                onTap: () {
                                  if (unreadNotifications != null) {
                                    for (Map notification
                                        in unreadNotifications!) {
                                      const FlutterSecureStorage().write(
                                          key: 'read_notification' +
                                              notification['id'].toString(),
                                          value: 'true');
                                    }
                                  }

                                  if (mounted) {
                                    setState(() {
                                      unreadNotifications = [];
                                      notificationPressed =
                                          !notificationPressed;
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    });
                                  }
                                },
                                child: AnimatedOpacity(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  opacity: start ? 1 : 0,
                                  child: Badge(
                                    elevation: unreadNotifications == null ||
                                            unreadNotifications!.isEmpty
                                        ? 0
                                        : 5,
                                    position: BadgePosition.topEnd(end: -5),
                                    badgeColor: unreadNotifications == null ||
                                            unreadNotifications!.isEmpty
                                        ? Colors.transparent
                                        : Constants.iconAc,
                                    badgeContent: Text(
                                      unreadNotifications != null
                                          ? " "
                                          : (unreadNotifications?.length)
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 9,
                                          color: Colors.transparent,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    animationDuration:
                                        const Duration(milliseconds: 800),
                                    animationType: BadgeAnimationType.scale,
                                    child: AnimatedContainer(
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      height: notificationPressed
                                          ? screenHeight * .048
                                          : screenHeight * .05,
                                      width: notificationPressed
                                          ? screenHeight * .048
                                          : screenHeight * .05,
                                      decoration: BoxDecoration(
                                          border: notificationPressed
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
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: AnimatedPadding(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.decelerate,
                                      padding: start
                                          ? const EdgeInsets.only(left: 0)
                                          : const EdgeInsets.only(left: 10),
                                      child: TypeAheadField(
                                        textFieldConfiguration:
                                            TextFieldConfiguration(
                                          onTap: () {
                                            if (mounted) {
                                              setState(() {
                                                filterPressed = false;
                                              });
                                            }
                                          },
                                          style: const TextStyle(
                                              color: Colors.grey),
                                          cursorColor: Constants.iconIn,
                                          cursorRadius:
                                              const Radius.circular(10),
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          decoration: InputDecoration(
                                            icon: AnimatedPadding(
                                              duration:
                                                  const Duration(seconds: 1),
                                              curve: Curves.decelerate,
                                              padding: start
                                                  ? const EdgeInsets.only(
                                                      left: 0)
                                                  : const EdgeInsets.only(
                                                      left: 20),
                                              child: Icon(
                                                FontAwesomeIcons
                                                    .magnifyingGlass,
                                                size: 17,
                                                color: Constants.iconIn,
                                              ),
                                            ),
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
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                          ),
                                        ),
                                        suggestionsBoxDecoration:
                                            SuggestionsBoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        itemBuilder:
                                            (BuildContext context, suggestion) {
                                          return ListTile(
                                            onTap: () {
                                              for (var map in widget.a!) {
                                                if (map['title'] ==
                                                    suggestion.toString()) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EventDetails(
                                                                  map)));
                                                }
                                              }
                                            },
                                            title: Text(
                                              suggestion.toString(),
                                              style: const TextStyle(
                                                color: Constants.iconAc,
                                                fontFamily: "Helvetica",
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        },
                                        suggestionsCallback:
                                            (String pattern) async {
                                          return _getSuggestions(pattern);
                                        },
                                        hideOnError: true,
                                        hideOnEmpty: true,
                                        hideOnLoading: true,
                                        hideSuggestionsOnKeyboardHide: true,
                                        onSuggestionSelected:
                                            (String suggestion) {},
                                      ),
                                    ),
                                  ),
                                  AnimatedOpacity(
                                    duration:
                                        const Duration(milliseconds: 1800),
                                    curve: Curves.decelerate,
                                    opacity: start ? 1 : 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (mounted) {
                                          setState(() {
                                            filterPressed = !filterPressed;
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          });
                                        }
                                      },
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.decelerate,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: filterPressed
                                                  ? Constants.iconAc
                                                  : Colors.transparent),
                                        ),
                                        height: screenHeight * .05,
                                        width: screenHeight * .05,
                                        child: Icon(
                                          FontAwesomeIcons.sliders,
                                          color: filterPressed
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
                        child: catSelect == 0
                            ? EventCards1(widget.event0, catSelect)
                            : catSelect == 1
                                ? EventCards2(widget.event1, catSelect)
                                : catSelect == 2
                                    ? EventCards3(widget.event2, catSelect)
                                    : catSelect == 3
                                        ? EventCards4(widget.event3, catSelect)
                                        : catSelect == 4
                                            ? EventCards5(
                                                widget.event4, catSelect)
                                            : catSelect == 5
                                                ? EventCards6(
                                                    widget.event5, catSelect)
                                                : EventCards6(
                                                    widget.event6, catSelect),
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
                      padding: EdgeInsets.only(bottom: screenHeight * .09),
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: filterPressed ? screenHeight * .4 : 0,
                          width: screenWidth * .85,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                height: filterPressed ? screenHeight * .4 : 0,
                                width: screenWidth * .85,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black.withOpacity(.9)),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: AnimatedPadding(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.decelerate,
                                    padding: filterPressed
                                        ? EdgeInsets.all(screenHeight * .025)
                                        : const EdgeInsets.all(0),
                                    child: AnimatedOpacity(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.decelerate,
                                      opacity: filterPressed ? 1 : 0,
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
                                                  opacity:
                                                      filterPressed ? 1 : 0,
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
                                                              filterPressed =
                                                                  false;

                                                              sort('prize',
                                                                  true);
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
                                                  opacity:
                                                      filterPressed ? 1 : 0,
                                                  child: SizedBox(
                                                      height:
                                                          screenHeight * .04,
                                                      width: screenWidth * .34,
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            if (showIndex ==
                                                                0) {
                                                              sort('title',
                                                                  false);
                                                            } else if (showIndex ==
                                                                1) {
                                                              sort('prize',
                                                                  true);
                                                            } else if (showIndex ==
                                                                2) {
                                                              sort(
                                                                  'event_start',
                                                                  false);
                                                            } else {
                                                              sort('fees',
                                                                  false);
                                                            }
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
                                            height: screenHeight * .3,
                                            width: screenWidth * .85,
                                            child: ListView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemCount: sortFields.length,
                                                scrollDirection: Axis.vertical,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        index) {
                                                  return AnimatedPadding(
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    curve: Curves.decelerate,
                                                    padding: EdgeInsets.only(
                                                      top: filterPressed
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
                                                              sortFields[index],
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
                      height: notificationPressed ? screenHeight * .7 : 0,
                      width: screenWidth * .91,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black),
                      child: NotificationPage(
                        notifications: allNotifications,
                      ),
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
