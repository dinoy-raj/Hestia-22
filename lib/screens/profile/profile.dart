import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hestia22/main.dart';
import 'package:hestia22/screens/profile/certificates.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool start = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        start = true;
      });
    });
  }

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
            AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              curve: Curves.decelerate,
              opacity: start ? 1 : 0,
              child: AnimatedPadding(
                padding: start
                    ? const EdgeInsets.only(left: 20)
                    : const EdgeInsets.only(right: 20),
                curve: Curves.decelerate,
                duration: Duration(seconds: 2),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.decelerate,
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
                            backgroundImage: NetworkImage(
                                'https://pbs.twimg.com/profile_images/1357908101198880769/HjvF0yWs_400x400.jpg'),
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
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              curve: Curves.decelerate,
              opacity: start ? 1 : 0,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Registred Events',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CertificatesPage()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Center(
                                child: IconButton(
                                  icon: Image.asset(
                                      'assets/icons/Certificate.png'),
                                  onPressed: () {},
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Constants.bg,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              height: 70,
                              width: 140,
                              //color: const Color(0xff121212)
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Certificates',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
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
            AnimatedOpacity(
              duration: Duration(milliseconds: 1000),
              curve: Curves.decelerate,
              opacity: start ? 1 : 0,
              child: AnimatedPadding(
                padding: start
                    ? const EdgeInsets.only(left: 40)
                    : const EdgeInsets.only(right: 40),
                curve: Curves.decelerate,
                duration: Duration(seconds: 1),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.decelerate,

                  height: screenHeight * 0.45,
                  //color: Colors.green,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 5),
                      curve: Curves.decelerate,
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
                                    'Karthik Sunil K',
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
                                        FontAwesomeIcons.school,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const Flexible(
                                  child: Text(
                                    'electronics and communication',
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
                            curve: Curves.decelerate,
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
                                  '8606683287',
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
                        ],
                      ),
                    ),
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
