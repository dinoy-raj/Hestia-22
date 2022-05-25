// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class FCM {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   Future<void> init() async {
//     final fcmToken = await FirebaseMessaging.instance.getToken();
//     print(fcmToken);
//
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     print('User granted permission: ${settings.authorizationStatus}');
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Got a message whilst in the foreground!');
//       print('Message data: ${message.data}');
//
//       if (message.notification != null) {
//         print(
//             'Message also contained a notification: ${message.notification!.title}');
//       }
//     });
//
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }
//
//   Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     print("Handling a background message: ${message.messageId}");
//   }
// }
