import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/main.dart';

class CertificatesPage extends StatefulWidget {
  const CertificatesPage({Key? key}) : super(key: key);

  @override
  State<CertificatesPage> createState() => _CertificatesPageState();
}

class _CertificatesPageState extends State<CertificatesPage> {
  bool start = false;

  @override
  void initState() {
    super.initState();

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
        child: Column(
          children: [
            SizedBox(
              height: size.width * 0.06,
            ),
            AnimatedOpacity(
              duration: const Duration(seconds: 3),
              curve: Curves.decelerate,
              opacity: start ? 1 : 0,
              child: Text(
                'Certificates',
                style: const TextStyle(
                    overflow: TextOverflow.fade,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Helvetica',
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: size.width * 0.06,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: start ? 1 : 0.2,
                    child: AnimatedContainer(
                      height: size.width * 0.45,
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(20),
                      margin:
                          start ? EdgeInsets.zero : const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Constants.color3.withOpacity(.25),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          opacity: 0.5,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://s.tmimgcdn.com/scr/800x500/181900/new-award-certificate-template_181954-original.jpg'),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Certificate Name',
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.w400,
                          //       fontSize: 25,
                          //       color: Constants.color2.withOpacity(.5)),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Event Name',
                                style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Constants.color2.withOpacity(.9)),
                              ),
                              // Text(
                              //   '4:30 PM',
                              //   style: TextStyle(
                              //       overflow: TextOverflow.clip,
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 15,
                              //       color: Constants.color2.withOpacity(.9)),
                              // ),
                              const Icon(
                                
                                FontAwesomeIcons.fileArrowDown,
                                size:30,
                                color: Colors.white
                              ),
                            ],
                          ),
                        ],
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
              itemCount: 2,
            ),
          ],
        ),
      ),
    );
  }
}
