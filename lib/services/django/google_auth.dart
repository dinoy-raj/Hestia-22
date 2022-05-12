import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hestia22/services/django/django.dart' as django;

class GoogleAuth extends ChangeNotifier {
  String? token;
  bool? isCompleted;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> initLogin() async {
    token = await const FlutterSecureStorage().read(key: 'token');
    token ??= "";
    isCompleted =
        await const FlutterSecureStorage().read(key: 'is_completed') == "true"
            ? true
            : false;
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

      http.Response response1 = await http.get(
        Uri.parse("https://backend.hestiatkmce.live/api/v1/users/me"),
        headers: {'Authorization': "token " + token!},
      );

      isCompleted = jsonDecode(response1.body)['is_completed'];

      notifyListeners();
    } catch (e) {
      print(e);
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

  Future<Map<String, dynamic>> getProfile() async {
    http.Response response = await http.get(
      Uri.parse("https://backend.hestiatkmce.live/api/v1/users/me"),
      headers: {'Authorization': "token " + token!},
    );
    return json.decode(response.body);
  }

  Future<void> updateProfile(
      String name, String phone, String college, String department) async {
    http.Response response = await http.get(
      Uri.parse("https://backend.hestiatkmce.live/api/v1/users/me/"),
      headers: {'Authorization': "token " + token!},
    );

    print(jsonDecode(response.body));

    http.Response response1 =
        await http.put(Uri.parse(jsonDecode(response.body)['url']), headers: {
      'Authorization': "token " + token!
    }, body: {
      "phone_number": phone,
      "name": name,
      "college_name": college,
      "dept_name": department,
      "is_completed": "true",
    });

    print(jsonDecode(response1.body));

    await const FlutterSecureStorage()
        .write(key: 'is_completed', value: "true");
    isCompleted = true;
    notifyListeners();
  }
}
