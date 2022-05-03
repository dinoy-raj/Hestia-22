import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';
import 'package:map_launcher/map_launcher.dart';

class SpotPage extends StatefulWidget {
  const SpotPage({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  _SpotPageState createState() => _SpotPageState();
}

class _SpotPageState extends State<SpotPage> {
  bool _animate = true;
  double _opacity = 0.75;
  List<Map> data1 = [
    {
      'name': 'Almanac',
      'category': 'Quiz',
      'datetime': DateTime.now(),
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
    },
    {
      'name': 'Web Crawler',
      'category': 'Competition',
      'datetime': DateTime.now(),
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
    },
    {
      'name': 'NFT and BlockChain',
      'category': 'Workshop',
      'datetime': DateTime.now(),
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
    },
  ];

  Future<void> _goToCoordinates(Coords coordinates, String title) async {
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
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _animate = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _animate = true;
          _opacity = 0;
        });
        await Future.delayed(const Duration(milliseconds: 300));
        return true;
      },
      child: Material(
        color: Constants.sc,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: widget.data['name'],
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: _opacity,
                      child: Image.network(
                        widget.data['image'],
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        color: Constants.color3.withOpacity(.5),
                        colorBlendMode: BlendMode.overlay,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AnimatedPadding(
                          padding: _animate
                              ? const EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                  left: 5.0,
                                  right: 5.0,
                                )
                              : const EdgeInsets.all(8.0),
                          duration: const Duration(milliseconds: 500),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    colors: [
                                      Constants.bg.withOpacity(.3),
                                      Constants.bg.withOpacity(.6),
                                    ],
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  ),
                                ),
                                child: BackButton(
                                  color: Constants.color2.withOpacity(.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedPadding(
                          padding: _animate
                              ? const EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                  left: 5.0,
                                  right: 5.0,
                                )
                              : const EdgeInsets.all(8.0),
                          duration: const Duration(milliseconds: 500),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    colors: [
                                      Constants.bg.withOpacity(.3),
                                      Constants.bg.withOpacity(.6),
                                    ],
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  ),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Constants.color2.withOpacity(.5),
                                  ),
                                  onPressed: () async {
                                    await _goToCoordinates(
                                        widget.data['coordinates'],
                                        widget.data['name']);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AnimatedPadding(
                          padding: _animate
                              ? const EdgeInsets.only(
                                  right: 20,
                                )
                              : EdgeInsets.zero,
                          duration: const Duration(milliseconds: 500),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Constants.bg,
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [
                                      Constants.bg.withOpacity(.8),
                                      Constants.bg.withOpacity(.4),
                                    ],
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  ),
                                ),
                                child: AnimatedOpacity(
                                  opacity: _animate ? 0 : 1,
                                  duration: const Duration(milliseconds: 500),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          widget.data['name'],
                                          style: TextStyle(
                                              overflow: TextOverflow.clip,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Constants.color2
                                                  .withOpacity(.75)),
                                        ),
                                        Text(
                                          widget.data['caption'],
                                          style: TextStyle(
                                              overflow: TextOverflow.clip,
                                              fontSize: 18,
                                              color: Constants.color2
                                                  .withOpacity(.5)),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          widget.data['description'],
                                          style: TextStyle(
                                              overflow: TextOverflow.clip,
                                              fontSize: 14,
                                              color: Constants.color2
                                                  .withOpacity(.25)),
                                        ),
                                        const SizedBox(
                                          height: 10,
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
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 1,
                  ),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        height: 400,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Constants.color3.withOpacity(.1),
                              Constants.color3.withOpacity(.3),
                            ],
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: data1.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => AnimatedOpacity(
                            opacity: _animate ? 0 : 1,
                            duration: const Duration(milliseconds: 500),
                            child: AnimatedPadding(
                              duration: const Duration(milliseconds: 500),
                              padding: _animate
                                  ? const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                      bottom: 10,
                                    )
                                  : const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                    ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      data1[index]['name'],
                                      style: const TextStyle(
                                        color: Constants.color2,
                                      ),
                                    ),
                                    subtitle: Text(
                                      data1[index]['category'],
                                      style: TextStyle(
                                        color: Constants.color2.withOpacity(.5),
                                      ),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          DateFormat.MMMMEEEEd().format(
                                              (data1[index]['datetime'])),
                                          style: TextStyle(
                                            color: Constants.color2
                                                .withOpacity(.25),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 12,
                                          color:
                                              Constants.color2.withOpacity(.5),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Divider(
                                      color: Constants.color2.withOpacity(.25),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AnimatedPadding(
                    padding: _animate
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(
                            top: 20,
                          ),
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedOpacity(
                      opacity: _animate ? 0 : 1,
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        height: 400,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            "Events held at " + widget.data['name'],
                            style: const TextStyle(
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
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
