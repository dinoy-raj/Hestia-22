import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hestia22/providers/profile_provider.dart';
import '../../main.dart';
import '../bottomnavigation/navbar.dart';

class ProfileRegistration extends StatelessWidget {
  const ProfileRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileProvider>(
      create: (context) => ProfileProvider(),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Constants.sc,
            body: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
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
                            height: 10,
                          ),
                          Text(
                            ' Complete your profile',
                            style: TextStyle(
                              color: Constants.color2.withOpacity(.25),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w100,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          _TextField(
                            initialValue:
                                context.read<ProfileProvider>().profile.name,
                            hintText: 'Full name',
                            errorText:
                                context.watch<ProfileProvider>().nameError,
                            valueChanged: (val) => context
                                .read<ProfileProvider>()
                                .setUsername('$val'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _TextField(
                            initialValue:
                                context.read<ProfileProvider>().profile.phone,
                            hintText: 'Phone number',
                            keyboard: TextInputType.phone,
                            errorText:
                                context.watch<ProfileProvider>().phoneError,
                            valueChanged: (val) => context
                                .read<ProfileProvider>()
                                .setEmail('$val'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _TextField(
                            hintText: 'College',
                            initialValue:
                                context.read<ProfileProvider>().profile.college,
                            errorText:
                                context.watch<ProfileProvider>().collegeError,
                            valueChanged: (val) => context
                                .read<ProfileProvider>()
                                .setCollege('$val'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _TextField(
                            hintText: 'Department',
                            initialValue: context
                                .read<ProfileProvider>()
                                .profile
                                .department,
                            errorText: context
                                .watch<ProfileProvider>()
                                .departmentError,
                            valueChanged: (val) => context
                                .read<ProfileProvider>()
                                .setDepartment('$val'),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ContinueButton(
                            onPressed: () async {
                              if (context.read<ProfileProvider>().validate() &&
                                  await context
                                      .read<ProfileProvider>()
                                      .post()) {
                                NavBarState.buildFlag = true;

                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  while (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  }
                                });
                              }
                            },
                            child: context.read<ProfileProvider>().result == 0
                                ? Icon(
                                    CupertinoIcons.checkmark_alt_circle,
                                    color: Colors.white.withOpacity(0.75),
                                  )
                                : context.read<ProfileProvider>().result == 1
                                    ? const Center(
                                        child: CupertinoActivityIndicator(
                                        color: Colors.white,
                                      ))
                                    : const Text(
                                        'CONTINUE',
                                        style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                        ),
                                      ),
                            color: context.read<ProfileProvider>().result == 0
                                ? Colors.green
                                : Constants.iconAc,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _TextField extends StatefulWidget {
  final String hintText;
  // final VoidCallback valueChanged;
  final Function(String?) valueChanged;
  final String? errorText;
  final String? initialValue;
  final TextInputType? keyboard;
  const _TextField({
    Key? key,
    required this.hintText,
    required this.valueChanged,
    this.errorText,
    this.initialValue,
    this.keyboard,
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
        initialValue: widget.initialValue,
        onChanged: widget.valueChanged,
        scrollPhysics: const BouncingScrollPhysics(),
        cursorColor: Constants.iconIn,
        cursorRadius: const Radius.circular(10),
        style: const TextStyle(
          fontFamily: 'Helvetica',
          color: Constants.iconAc,
          fontSize: 20,
        ),
        textCapitalization: TextCapitalization.words,
        keyboardType: widget.keyboard,
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
  final Color? color;
  final Widget? child;

  const ContinueButton({
    Key? key,
    required this.onPressed,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: child,
      ),
    );
  }
}
