import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:hestia22/providers/profile_provider.dart';

import '../../main.dart';

class ProfileRegistration extends StatelessWidget {
  ProfileRegistration({Key? key}) : super(key: key);
  final PageController controller = PageController();

  void nextPage() => controller.animateToPage(
        controller.page!.toInt() + 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<ProfileProvider>(
        create: (context) => ProfileProvider(),
        child: Scaffold(
          backgroundColor: Constants.sc,
          body: Builder(builder: (context) {
            return PageView(
              children: [
                accountInfo(context),
                personalDetails(context),
                collegeDetails(context),
              ],
              controller: controller,
              // physics: const NeverScrollableScrollPhysics(),
            );
          }),
        ),
      ),
    );
  }

  collegeDetails(BuildContext context) {
    // final provider = Provider.of<ProfileProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'COLLEGE DETAILS',
            style: TextStyle(
              color: Constants.color2,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Text(
          //   'So that we can contact you.',
          //   style: TextStyle(
          //     fontFamily: 'Helvetica',
          //     fontWeight: FontWeight.normal,
          //     fontSize: 20,
          //   ),
          // ),
          const Spacer(),
          _TextField(
            hintText: 'college',
            valueChanged: (val) =>
                context.read<ProfileProvider>().setCollege('$val'),
            errorText: context.read<ProfileProvider>().validateStep1(),
          ),
          const SizedBox(
            height: 20,
          ),
          _TextField(
            hintText: 'department',
            valueChanged: (val) =>
                context.read<ProfileProvider>().setDepartment('$val'),
          ),
          const SizedBox(
            height: 40,
          ),
          ContinueButton(
            onPressed: () => nextPage(),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }

  personalDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'PERSONAL DETAILS',
            style: TextStyle(
              color: Constants.color2,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Text(
          //   'So that you connect with people easier.',
          //   style: TextStyle(
          //     fontFamily: 'Helvetica',
          //     fontWeight: FontWeight.normal,
          //     fontSize: 20,
          //   ),
          // ),
          const Spacer(),
          _TextField(
            hintText: 'full name',
            valueChanged: (val) =>
                context.read<ProfileProvider>().setName('$val'),
          ),
          const SizedBox(
            height: 20,
          ),
          _TextField(
            hintText: 'address',
            valueChanged: (val) =>
                context.read<ProfileProvider>().setAddress('$val'),
          ),
          const SizedBox(
            height: 40,
          ),
          ContinueButton(
            onPressed: () => nextPage(),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }

  accountInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'ACCOUNT INFO',
            style: TextStyle(
              color: Constants.color2,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Text(
          //   'So that we know how to call you.',
          //   style: TextStyle(
          //     fontFamily: 'Helvetica',
          //     fontWeight: FontWeight.normal,
          //     fontSize: 20,
          //   ),
          // ),
          const Spacer(),
          _TextField(
            hintText: 'username',
            errorText: context.read<ProfileProvider>().validateStep1(),
            valueChanged: (val) =>
                context.read<ProfileProvider>().setUsername('$val'),
          ),
          const SizedBox(
            height: 20,
          ),
          _TextField(
            hintText: 'email',
            valueChanged: (val) =>
                context.read<ProfileProvider>().setEmail('$val'),
          ),
          const SizedBox(
            height: 40,
          ),
          ContinueButton(
            onPressed: () {
              context.read<ProfileProvider>().validateStep1();
              nextPage();
            },
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  final String hintText;
  // final VoidCallback valueChanged;
  final Function(String?) valueChanged;
  final String? errorText;
  const _TextField({
    Key? key,
    required this.hintText,
    required this.valueChanged,
    this.errorText,
  }) : super(key: key);

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  bool start = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200)).then(
      (value) => setState(() {
        start = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        onChanged: widget.valueChanged,
        scrollPhysics: const BouncingScrollPhysics(),
        cursorColor: Constants.iconIn,
        cursorRadius: const Radius.circular(10),
        style: const TextStyle(
          fontFamily: 'Helvetica',
          color: Constants.iconAc,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          errorText: widget.errorText,
          hintText: 'type here',
          labelText: widget.hintText,
          labelStyle: const TextStyle(
            fontFamily: 'Helvetica',
            color: Constants.iconAc,
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
          hintStyle: TextStyle(
            fontFamily: 'Helvetica',
            color: Constants.iconIn,
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          fillColor: Colors.grey.withOpacity(.05),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ContinueButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Constants.iconAc,
        ),
        onPressed: onPressed,
        child: const Text(
          'CONTINUE',
          style: TextStyle(
            fontFamily: 'Helvetica',
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
