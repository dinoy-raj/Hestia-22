import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hestia22/screens/bottomnavigation/navbar.dart';
import 'package:hestia22/screens/events/events.dart';
import 'package:hestia22/screens/profile/profile_registration.dart';
import 'package:hestia22/screens/profile/registration_failure.dart';
import 'package:hestia22/screens/profile/registration_success.dart';
import 'screens/login/login.dart';
import 'services/django/google_auth.dart';

GoogleAuth auth = GoogleAuth();

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  await auth.initLogin();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    auth.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    auth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hestia22',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: StreamBuilder(
          stream: auth.googleSignIn.onCurrentUserChanged,
          builder: (BuildContext context,
              AsyncSnapshot<GoogleSignInAccount?> snapshot) {
            if (auth.token!.isNotEmpty &&
                auth.isCompleted != null &&
                auth.isCompleted!) {
              return const MyHomePage();
            } else if (auth.isCompleted == null || !auth.isCompleted!) {
              return ProfileRegistration();
            } else {
              return const MyHomePage();
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
                      builder: (context) => EventDetails({
                        'image':
                        'https://ieeesbtkmce-assets.s3.amazonaws.com/media/events/posters/dyn.jpeg',
                        'name': 'SPOTLIGHT',
                        'description':
                        "Lights, camera, ACTION!Are you ready to be in the limelight and instigate the true actor in you? Do you think you have the power to influence the crowd, and weave magic on screen? If yes, wait not! Act your heart out as the spotlight shines bright and all eyes veer to you.Hestia'22 presents SPOTLIGHT, to unravel the performer in you. Enter the showbiz with your prowess in fine blending emotions and art. Unleash your flair by revitalising characters on screen.",
                        'date': "2021-05-12 23:59",
                        'registrationfee': "₹150",
                        'prize': "₹70000",
                        'coordinator1': "Ajay",
                        "phone_no_cord1": "8301916909",
                        'coordinator2': "Jyothi",
                        "phone_no_cord2": "9447480943",
                        'location': "APJ Park"
                      }),
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
                  auth.logOut();
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
  static const textColor=Colors.grey;
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
