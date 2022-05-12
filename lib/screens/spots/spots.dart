import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/spots/cards.dart';
import 'package:hestia22/screens/spots/spot_page.dart';
import 'package:hestia22/services/django/django.dart' as django;

class Spots extends StatefulWidget {
  const Spots({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SpotsState();
  }
}

class SpotsState extends State<Spots> {
  bool _animate = true;
  List<dynamic>? data;

  List<String> _getSuggestions(String pattern) {
    List<String> list = [];

    if (data != null) {
      for (var element in data!) {
        if (list.length < 4) {
          if (element['title'].toLowerCase().contains(pattern.toLowerCase())) {
            list.add("%l%" + element['title']);

            if (list.length == 4) {
              break;
            }
          }
        }

        if (list.length < 4) {
          for (var event in element['events']) {
            if (event['title'].toLowerCase().contains(pattern.toLowerCase())) {
              list.add("%e%" + event['title']);

              if (list.length == 4) {
                break;
              }
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
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _animate = false;
      });
    });
    django.getSpots().then((value) {
      if (mounted) {
        setState(() {
          data = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Constants.sc,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: _animate ? 0 : 1,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                AnimatedPadding(
                  padding: _animate
                      ? const EdgeInsets.only(
                          right: 20,
                        )
                      : EdgeInsets.zero,
                  duration: const Duration(milliseconds: 1000),
                  child: Center(
                    child: Text(
                      "Explore",
                      style: TextStyle(
                        letterSpacing: 7,
                        color: Constants.color2.withOpacity(.75),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: AnimatedTextKit(
                    pause: const Duration(milliseconds: 300),
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText(
                        "TKMCE",
                        textStyle: TextStyle(
                          color: Constants.color3,
                          letterSpacing: 3,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RotateAnimatedText(
                        "HESTIA'22",
                        textStyle: TextStyle(
                          color: Constants.color3,
                          letterSpacing: 1,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RotateAnimatedText(
                        "UTOPIA",
                        textStyle: TextStyle(
                          color: Constants.color3,
                          letterSpacing: 1,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constants.color1,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        style: const TextStyle(color: Colors.grey),
                        cursorColor: Colors.grey,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search for an event or hotspot",
                          hintStyle: const TextStyle(
                            color: Colors.white24,
                            fontSize: 15,
                          ),
                          icon: AnimatedPadding(
                              padding: _animate
                                  ? const EdgeInsets.only(
                                      left: 10,
                                      right: 15,
                                    )
                                  : const EdgeInsets.only(
                                      left: 15,
                                      right: 0,
                                    ),
                              duration: const Duration(milliseconds: 800),
                              child: const Icon(
                                CupertinoIcons.search,
                                color: Colors.grey,
                              )),
                        ),
                      ),
                      suggestionsCallback: (pattern) async {
                        return _getSuggestions(pattern);
                      },
                      minCharsForSuggestions: 1,
                      suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          onTap: () {
                            for (var element in data!) {
                              if (element['title'] ==
                                  suggestion.toString().replaceAll("%l%", "")) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SpotPage(data: element)));
                              }

                              for (var event in element['events']) {
                                if (event['title'] ==
                                    suggestion
                                        .toString()
                                        .replaceAll("%e%", "")) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SpotPage(data: element)));
                                }
                              }
                            }
                          },
                          leading: Icon(
                            suggestion.toString().contains("%e%")
                                ? CupertinoIcons.star
                                : CupertinoIcons.location,
                            color: Constants.color2.withOpacity(.40),
                          ),
                          title: Text(
                            suggestion
                                .toString()
                                .replaceAll("%l%", "")
                                .replaceAll("%e%", ""),
                            style: TextStyle(
                                color: Constants.color2.withOpacity(.40)),
                          ),
                        );
                      },
                      hideOnError: true,
                      hideOnEmpty: true,
                      hideOnLoading: true,
                      hideSuggestionsOnKeyboardHide: true,
                      onSuggestionSelected: (suggestion) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                data == null
                    ? const CupertinoActivityIndicator()
                    : Cards(
                        data: data!,
                      ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
