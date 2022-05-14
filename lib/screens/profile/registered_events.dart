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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
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
              ),
              data == null
                  ? SizedBox(
                      height: screenHeight * .8,
                      width: screenWidth,
                      child: const Center(
                          child: CupertinoActivityIndicator(
                        color: Colors.white,
                      )))
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
                          physics: const BouncingScrollPhysics(),
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
                                  duration: const Duration(milliseconds: 500),
                                  opacity: start ? 1 : 0.2,
                                  child: AnimatedContainer(
                                    height: screenHeight * 0.15,
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
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          data![index]['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              fontFamily: "Helvetica",
                                              color: Constants.color2
                                                  .withOpacity(.65)),
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
