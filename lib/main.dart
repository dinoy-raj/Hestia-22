import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hestia22/screens/bottomnavigation/navbar.dart';
import 'package:hestia22/screens/profile/profile_registration.dart';
import 'package:hestia22/screens/profile/registration_failure.dart';
import 'package:hestia22/screens/profile/registration_success.dart';
import 'screens/login/login.dart';

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  // todo FCM TEST
  // await Firebase.initializeApp();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  //
  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  // print('User granted permission: ${settings.authorizationStatus}');
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');
  //
  //   if (message.notification != null) {
  //     print(
  //         'Message also contained a notification: ${message.notification!.title}');
  //   }
  // });
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // print(fcmToken);
  runApp(const MyApp());
}
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//
//   print("Handling a background message: ${message.messageId}");
// }

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
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: const MyHomePage(),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBar()));
                  },
                  child: const Text("home")),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text("login")),
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
}
