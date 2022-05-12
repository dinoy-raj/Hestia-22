import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hestia22/screens/bottomnavigation/navbar.dart';
import 'package:hestia22/screens/login/login.dart';
import 'package:hestia22/screens/profile/profile_registration.dart';
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
            if (auth.token == null || auth.token!.isEmpty) {
              return const LoginPage();
            } else {
              if (auth.isCompleted == null || !auth.isCompleted!) {
                return const ProfileRegistration();
              } else {
                return const NavBar();
              }
            }
          }),
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
  static const textColor = Colors.grey;
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
