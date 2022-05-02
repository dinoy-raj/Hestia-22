import 'package:flutter/material.dart';
import 'package:hestia22/screens/bottomnavigation/navbar.dart';
import 'package:hestia22/screens/home/home.dart';
import 'package:hestia22/screens/spots/spots.dart';
import 'screens/login/login.dart';
// import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hestia22',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Spots(),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBar()));
                  },
                  child: const Text("home")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text("login")),
            ],
          ),
        ),
      ),
    );
  }
}

class Constants {
  static const Color color1 = Colors.black;
  static const Color color2 = Colors.white;
  static final Color color3 = Colors.brown[700]!;
  static const Color color4 = Colors.blueGrey;

  static const TextStyle primaryText = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle secondaryText = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: Colors.brown,
  );
  static const TextStyle tertiaryText = TextStyle(
    fontSize: 12,
  );
}
