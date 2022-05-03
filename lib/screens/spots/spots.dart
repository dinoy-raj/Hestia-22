import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/spots/cards.dart';
import 'package:map_launcher/map_launcher.dart';

class Spots extends StatefulWidget {
  const Spots({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SpotsState();
  }
}

class SpotsState extends State<Spots> {
  Future<List<String>> _getSuggestions(String pattern) async {
    return [pattern, pattern + 'aa', pattern + 'bb'];
  }

  Future<void> _goToCoordinates(String title) async {
    // Get coordinates using title
    Coords coordinates = Coords(1, 2);

    if ((await MapLauncher.isMapAvailable(MapType.google))!) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: coordinates,
        title: title,
      );
    }
  }

  @override
  void initState() {
    super.initState();
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
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Center(
                child: Text(
                  "Explore",
                  style: TextStyle(
                    letterSpacing: 7,
                    color: Constants.color2,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    RotateAnimatedText(
                      "TKMCE",
                      textStyle: TextStyle(
                        color: Constants.color3,
                        letterSpacing: 3,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RotateAnimatedText(
                      "HESTIA'22",
                      textStyle: TextStyle(
                        color: Constants.color3,
                        letterSpacing: 1,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RotateAnimatedText(
                      "UTOPIA",
                      textStyle: TextStyle(
                        color: Constants.color3,
                        letterSpacing: 1,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Constants.color3.withOpacity(.2),
                            Constants.color3.withOpacity(.5),
                          ],
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 1.5,
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            style: TextStyle(color: Colors.grey),
                            cursorColor: Colors.grey,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Where do you wanna go?",
                                hintStyle: TextStyle(
                                  color: Colors.white24,
                                ),
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                )),
                          ),
                          suggestionsCallback: (pattern) async {
                            return await _getSuggestions(pattern);
                          },
                          suggestionsBoxDecoration: SuggestionsBoxDecoration(
                              color: Constants.color3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              onTap: () {
                                _goToCoordinates(suggestion.toString());
                              },
                              leading: Icon(
                                Icons.location_on_outlined,
                                color: Constants.color2.withOpacity(.40),
                              ),
                              title: Text(
                                suggestion.toString(),
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
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              const Cards(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
