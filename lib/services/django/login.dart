import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GoogleAuth extends ChangeNotifier {
  String? token;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> initLogin() async {
    token = await const FlutterSecureStorage().read(key: 'token');
    token ??= "";
    notifyListeners();
  }

  void login() async {
    try {
      GoogleSignInAccount? result = await googleSignIn.signIn();

      GoogleSignInAuthentication googleKey = await result!.authentication;

      http.Response response = await http.post(
        Uri.parse("https://backend.hestiatkmce.live/users/google/"),
        body: {
          "access_token": googleKey.accessToken,
          "code": "1",
        },
      );

      token = jsonDecode(response.body)['key'];

      await const FlutterSecureStorage().write(key: 'token', value: token);

      notifyListeners();
    } catch (e) {
      token = "";
      notifyListeners();
    }
  }

  void logOut() {
    googleSignIn.signOut();
    const FlutterSecureStorage().delete(key: 'token');
    token = "";
    notifyListeners();
  }
}
