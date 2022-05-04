import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';
import 'package:lottie/lottie.dart';

class RegistrationFailure extends StatelessWidget {
  const RegistrationFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.sc,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_skyzkvon.json'),
            ),
            Column(
              children: const [
                Text(
                  'Oops! 😔',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Something failed.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Retry'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
