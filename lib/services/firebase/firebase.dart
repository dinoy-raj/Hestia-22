import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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

//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//
//   print("Handling a background message: ${message.messageId}");
// }