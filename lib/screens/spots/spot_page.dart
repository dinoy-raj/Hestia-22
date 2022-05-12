import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';

class SpotPage extends StatefulWidget {
  const SpotPage({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  _SpotPageState createState() => _SpotPageState();
}

class _SpotPageState extends State<SpotPage> {
  bool _animate = true;
  double _opacity = 0.75;

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
                    tag: widget.data['title'].toString(),
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 800),
                        opacity: _opacity,
                        child: Image.network(
                          widget.data['picture'] != null
                              ? widget.data['picture'].toString()
                              : "https://img.collegepravesh.com/2018/10/TKMCE-Kollam.jpg",
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          color: Constants.color3.withOpacity(.5),
                          colorBlendMode: BlendMode.overlay,
                        )),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 800),
                    top: 70,
                    left: _animate ? 15 : 25,
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
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 800),
                    right: _animate ? 20 : 30,
                    top: 70,
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
                            duration: const Duration(milliseconds: 800),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    widget.data['title'].toString(),
                                    style: TextStyle(
                                        overflow: TextOverflow.clip,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color:
                                            Constants.color2.withOpacity(.75)),
                                  ),
                                  Text(
                                    widget.data['short_desc'].toString(),
                                    style: TextStyle(
                                        overflow: TextOverflow.clip,
                                        fontSize: 18,
                                        color:
                                            Constants.color2.withOpacity(.5)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    widget.data['desc'].toString(),
                                    style: TextStyle(
                                        overflow: TextOverflow.clip,
                                        fontSize: 14,
                                        color:
                                            Constants.color2.withOpacity(.25)),
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
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        height: 400,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
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
                          itemCount: widget.data['events'].length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => AnimatedOpacity(
                            opacity: _animate ? 0 : 1,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.decelerate,
                            child: AnimatedPadding(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.decelerate,
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
                                      widget.data['events'][index]
                                              ['short_title']
                                          .toString(),
                                      style: const TextStyle(
                                        color: Constants.color2,
                                      ),
                                    ),
                                    subtitle: Text(
                                      widget.data['events'][index]['desc']
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Constants.color2.withOpacity(.5),
                                      ),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          child: Text(
                                            widget.data['events'][index]
                                                    ['short_desc']
                                                .toString(),
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Constants.color2
                                                  .withOpacity(.25),
                                            ),
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  AnimatedPadding(
                    padding: _animate
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(
                            top: 20,
                          ),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: AnimatedOpacity(
                      opacity: _animate ? 0 : 1,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: SizedBox(
                        height: 400,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            "Events held at " + widget.data['title'].toString(),
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
                    width: 20,
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
