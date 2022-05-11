import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/main.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height - 24;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.sc,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: screenHeight * 0.09,
              //color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   alignment: Alignment.topLeft,

                  Container(
                    //color: Colors.red,
                    // width: screenWidth * 0.8,
                    child: const Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.18,
              //color: Colors.orange,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 95,
                      width: 95,
                      //color: Colors.black,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/icons/face.png'),
                      ),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Constants.iconAc),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Karthik K',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.18,
              //color: Colors.yellow,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Constants.bg,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          height: 70,
                          width: 140,
                          child: Center(
                            child: IconButton(
                              icon: Image.asset('assets/icons/Todayy.png'),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Registred Events',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Center(
                            child: IconButton(
                              icon: Image.asset('assets/icons/Certificate.png'),
                              onPressed: () {},
                            ),
                          ),
                          decoration: const BoxDecoration(
                            color: Constants.bg,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          height: 70,
                          width: 140,
                          //color: const Color(0xff121212)
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Certificates',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.45,
              //color: Colors.green,
              child: Center(
                child: Container(
                  height: 300,
                  width: 350,
                  decoration: const BoxDecoration(
                    color: Color(0xff121212),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          //color: Color.fromARGB(255, 212, 23, 23),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 10),
                              child: Container(
                                alignment: Alignment.topLeft,
                                width: screenWidth * 0.1,
                                height: screenWidth * 0.1,
                                decoration: const BoxDecoration(
                                  color: Constants.bg,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    FontAwesomeIcons.user,
                                    color: Colors.white,
                                    // Image.asset('assets/icons/person.png'),
                                  ),
                                ),
                              ),
                            ),
                            const Flexible(
                              child: Text(
                                'Karthik Sunil',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 10),
                              child: Container(
                                alignment: Alignment.topLeft,
                                width: screenWidth * 0.1,
                                height: screenWidth * 0.1,
                                decoration: const BoxDecoration(
                                  color: Constants.bg,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    FontAwesomeIcons.envelope,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const Flexible(
                              child: Text(
                                'karthiksunilhhhhhhh.me@gmail.com',
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.bounceIn,
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 10),
                              child: Container(
                                alignment: Alignment.topLeft,
                                width: screenWidth * 0.1,
                                height: screenWidth * 0.1,
                                decoration: const BoxDecoration(
                                  color: Constants.bg,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    FontAwesomeIcons.phone,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Contact Admin',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.normal),
                            ),
                            // const Spacer(),
                            // Container(
                            //   alignment: Alignment.centerRight,
                            //   width: screenWidth * 0.1,
                            //   //color: Colors.green,
                            //   child: Center(
                            //     child: IconButton(
                            //       icon: Image.asset('assets/icons/logout.png'),
                            //       onPressed: () {},
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 10),
                              child: Container(
                                alignment: Alignment.topLeft,
                                width: screenWidth * 0.1,
                                height: screenWidth * 0.1,
                                decoration: const BoxDecoration(
                                  color: Constants.bg,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    FontAwesomeIcons.arrowRightFromBracket,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Logout',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.normal),
                            ),
                         
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
