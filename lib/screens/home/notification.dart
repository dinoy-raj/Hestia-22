import 'package:flutter/material.dart';
import 'home.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<dynamic> noti = [{}, {}];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, index) {
          return AnimatedContainer(duration: const Duration(seconds: 1));
        });
  }
}
