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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.sc,
      body: SafeArea(
        child: AnimatedPadding(
          duration: const Duration(seconds: 1),
          curve: Curves.decelerate,
          padding: start
              ? const EdgeInsets.only(
                  left: 15.0, top: 30, right: 15, bottom: 20)
              : const EdgeInsets.only(
                  left: 10.0, top: 29, right: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
                opacity: start ? 1 : 0,
                child: SizedBox(
                  height: screenHeight * .05,
                  width: screenWidth,
                  child: Stack(
                    children: [
                      //title
                      SizedBox(
                        height: screenHeight * .05,
                        width: screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Registered Events',
                              style: TextStyle(
                                  overflow: TextOverflow.fade,
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'helvetica',
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),

                      //back button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                height: screenHeight * .05,
                                width: screenHeight * .05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Constants.bg,
                                ),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 17,
                                  color: Colors.grey,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              data == null
                  ? SizedBox(
                      height: screenHeight * .8,
                      width: screenWidth,
                      child: const Center(child: CupertinoActivityIndicator()))
                  : data!.isEmpty
                      ? SizedBox(
                          height: screenHeight * .8,
                          width: screenWidth,
                          child: Center(
                            child: Text(
                              "No events",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                            ),
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
                                    height: screenWidth * 0.5,
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
