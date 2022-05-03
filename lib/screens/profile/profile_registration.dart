import 'package:flutter/material.dart';

class ProfileRegistration extends StatelessWidget {
  const ProfileRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: pages.length,
          itemBuilder: (_, index) => pages[index],
          controller: controller,
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const NameReg(),
  const PhoneReg(),
  const CollegeReg(),
];

class PhoneReg extends StatelessWidget {
  const PhoneReg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 30,
          ),
          Text(
            'What\'s your phone number, Angelico?',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'So that we can contact you.',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
          Spacer(),
          _TextField(
            hintText: 'Your phone number',
          ),
          SizedBox(
            height: 20,
          ),
          ContinueButton(),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}

class CollegeReg extends StatelessWidget {
  const CollegeReg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 30,
          ),
          Text(
            'Where do you study, Angelico?',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'So that you connect with people easier.',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
          Spacer(),
          _TextField(
            hintText: 'Your college name',
          ),
          SizedBox(
            height: 20,
          ),
          _TextField(
            hintText: 'Your department name',
          ),
          SizedBox(
            height: 20,
          ),
          ContinueButton(),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}

class NameReg extends StatelessWidget {
  const NameReg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 30,
          ),
          Text(
            'What\'s your name?',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'So that we know how to call you.',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
          Spacer(),
          _TextField(
            hintText: 'Your full name',
          ),
          SizedBox(
            height: 20,
          ),
          ContinueButton(),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final String hintText;
  const _TextField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      // onChanged: (value) => provider.setPrinciple(value),
      keyboardType: TextInputType.number,
      smartDashesType: SmartDashesType.enabled,
      style: const TextStyle(
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(), hintText: hintText,
        // fillColor:  Color.fromRGBO(235, 237, 236, 1),
        // filled: true
        // prefixText: 'Principle',
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          'CONTINUE',
          style: TextStyle(
            fontFamily: 'Helvetica',
            // fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
