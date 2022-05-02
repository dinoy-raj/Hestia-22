import 'package:flutter/material.dart';

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
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(children: [
          Container(
            height: screenHeight * 0.09,
            //color: Colors.green,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: screenWidth * 0.1,
                  //color: Colors.green,
                  child: Center(
                    child: IconButton(
                      icon: Image.asset('assets/icons/backarrow.png'),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  //color: Colors.red,
                  width: screenWidth * 0.8,
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
                Container(
                  alignment: Alignment.topLeft,
                  width: screenWidth * 0.08,
                  //color: Colors.green,
                  child: Center(
                    child: IconButton(
                      icon: Image.asset('assets/icons/logout.png'),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.16,
            //color: Colors.orange,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    color: Colors.black,
                  ),
                  const Text(
                    'Karthik',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.20,
            //color: Colors.yellow,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff121212),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    height: 70,
                    width: 150,
                    //color: const Color(0xff121212)
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff121212),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    height: 70,
                    width: 150,
                    //color: const Color(0xff121212)
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.55,
            //color: Colors.green,
            child: Center(
              child: Container(
                height: screenHeight * 0.52,
                width: screenWidth * 0.8,
                decoration: const BoxDecoration(
                  color: Color(0xff121212),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        //color: Color.fromARGB(255, 212, 23, 23),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      height: screenHeight * 0.13,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: screenWidth * 0.15,
                              height: screenWidth * 0.15,
                              decoration: const BoxDecoration(
                                color: Color(0xff444444),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Image.asset('assets/icons/logout.png'),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.normal),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.centerRight,
                            width: screenWidth * 0.1,
                            //color: Colors.green,
                            child: Center(
                              child: IconButton(
                                icon: Image.asset('assets/icons/logout.png'),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      
                      height: screenHeight * 0.13,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: screenWidth * 0.15,
                              height: screenWidth * 0.15,
                              decoration: const BoxDecoration(
                                color: Color(0xff444444),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Image.asset('assets/icons/logout.png'),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.normal),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.centerRight,
                            width: screenWidth * 0.1,
                            //color: Colors.green,
                            child: Center(
                              child: IconButton(
                                icon: Image.asset('assets/icons/logout.png'),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      
                      height: screenHeight * 0.13,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: screenWidth * 0.15,
                              height: screenWidth * 0.15,
                              decoration: const BoxDecoration(
                                color: Color(0xff444444),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Image.asset('assets/icons/logout.png'),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.normal),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.centerRight,
                            width: screenWidth * 0.1,
                            //color: Colors.green,
                            child: Center(
                              child: IconButton(
                                icon: Image.asset('assets/icons/logout.png'),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      
                      height: screenHeight * 0.13,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 10),
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: screenWidth * 0.15,
                              height: screenWidth * 0.15,
                              decoration: const BoxDecoration(
                                color: Color(0xff444444),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Image.asset('assets/icons/logout.png'),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.normal),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.centerRight,
                            width: screenWidth * 0.1,
                            //color: Colors.green,
                            child: Center(
                              child: IconButton(
                                icon: Image.asset('assets/icons/logout.png'),
                                onPressed: () {},
                              ),
                            ),
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
    );
  }
}
