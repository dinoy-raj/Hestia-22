import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hestia22/screens/bottomnavigation/navbar.dart';
import 'package:hestia22/screens/events/events.dart';
import 'package:hestia22/screens/profile/profile_registration.dart';
import 'package:hestia22/screens/profile/registration_failure.dart';
import 'package:hestia22/screens/profile/registration_success.dart';
import 'screens/login/login.dart';
import 'services/django/django.dart' as django;

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  django.initLogin();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hestia22',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: StreamBuilder(
          stream: django.googleSignIn.onCurrentUserChanged,
          builder: (BuildContext context,
              AsyncSnapshot<GoogleSignInAccount?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting && flag) {
              flag = false;
              return const Scaffold(
                  backgroundColor: Constants.sc,
                  body: Center(
                      child: CupertinoActivityIndicator(
                    radius: 10,
                  )));
            } else if (snapshot.hasData) {
              return const MyHomePage();
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // ignore: todo
    // TODO: Replace with provider once backend is up
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBar()));
                  },
                  child: const Text("home")),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EventDetails(),
                    ),
                  );
                },
                child: const Text("event-details"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileRegistration()));
                },
                child: const Text("profile-reg"),
              ),
              ElevatedButton(
                onPressed: () {
                  django.logOut();
                },
                child: const Text("log out"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationSuccess(),
                    ),
                  );
                },
                child: const Text("profile-success"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationFailure(),
                    ),
                  );
                },
                child: const Text("profile-failure"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Constants {
  //colours for navbar
  static const Color bg = Color.fromRGBO(27, 28, 33, 100);
  static const Color sc = Color.fromRGBO(17, 17, 19, 100);
  static Color navBorder = Colors.black.withOpacity(.1);
  static const Color grad1 = Colors.black12;
  static const Color grad2 = Colors.black;
  static const Color iconAc = Color.fromRGBO(224, 212, 254, 100);
  static Color iconIn = Colors.grey.withOpacity(.35);
  static final Color color1 = Colors.grey.withOpacity(0.1);
  static const Color color2 = Colors.white;
  static final Color color3 = Colors.brown[700]!;
  static const Color color4 = Colors.blueGrey;
  static const pureBlack = Color(0x00000000);
  static const imageColor = Color(0x0031164a);
  static const detailsColor = Color(0x005a2d85);
  static var pureWhite = const Color(0xFFFFFFFF);
  static var buttonPink = Colors.pink[700];
  static const phoneIcon = Color.fromRGBO(7, 184, 13, 50);
  static const gradient1 = Colors.black;
  static const gradient2 = Colors.grey;
  static const gradient3 = Colors.white10;
  static const transaparent = Colors.transparent;
  static const lightWhite = Colors.white70;
}

// TODO
// REMOVE KEY.JKS FROM ANDROID/APP
