import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/events/events.dart';

class RegisteredEvents extends StatefulWidget {
  const RegisteredEvents({Key? key}) : super(key: key);

  @override
  State<RegisteredEvents> createState() => _RegisteredEventsState();
}

class _RegisteredEventsState extends State<RegisteredEvents> {
  bool start = false;
  List<Map>? data;

  @override
  void initState() {
    super.initState();

    auth.getRegisteredEvents().then((value) {
      setState(() {
        data = value;
      });
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        start = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.sc,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.width * 0.06,
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 3),
                curve: Curves.decelerate,
                opacity: start ? 1 : 0,
                child: Text(
                  'Registered Events',
                  style: TextStyle(
                      overflow: TextOverflow.fade,
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica',
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(
                height: size.width * 0.06,
              ),
              data == null
                  ? const Center(
                      child: SizedBox(
                          height: 50, child: CupertinoActivityIndicator()))
                  : data!.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: Text(
                            "No events",
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EventDetails(data![index])));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: start ? 1 : 0.2,
                                  child: AnimatedContainer(
                                    height: size.width * 0.5,
                                    duration: const Duration(milliseconds: 300),
                                    padding: const EdgeInsets.all(20),
                                    margin: start
                                        ? EdgeInsets.zero
                                        : const EdgeInsets.all(30),
                                    decoration: BoxDecoration(
                                      color: Constants.iconAc.withOpacity(.25),
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        opacity: 0.5,
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(data![index]['image']),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data![index]['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Constants.color2
                                                  .withOpacity(.65)),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                data![index]['start_date'] ??
                                                    "May 26-29",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    overflow: TextOverflow.clip,
                                                    fontSize: 15,
                                                    color: Constants.color2
                                                        .withOpacity(.5)),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                data![index]['short_desc']
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    overflow: TextOverflow.clip,
                                                    fontSize: 15,
                                                    color: Constants.color2
                                                        .withOpacity(.75)),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                data![index]['venue']['title']
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    overflow: TextOverflow.clip,
                                                    fontSize: 15,
                                                    color: Constants.color2
                                                        .withOpacity(.5)),
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
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 30,
                            );
                          },
                          itemCount: data!.length,
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
