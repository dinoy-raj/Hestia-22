import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

String hostUrl = "https://backend.hestiatkmce.live";

GoogleSignIn googleSignIn = GoogleSignIn();
String? token;

initLogin() {
  googleSignIn.onCurrentUserChanged
      .listen((GoogleSignInAccount? account) async {
    if (account != null) {
      const storage = FlutterSecureStorage();

      token = await storage.read(key: 'token');
    }
  });

  googleSignIn.signInSilently().whenComplete(() => () {});
}

doLogin() {
  googleSignIn
      .signIn()
      .then((result) => result?.authentication.then((googleKey) {
            http.post(
              Uri.parse(hostUrl + "/users/google/"),
              body: {
                "access_token": googleKey.accessToken,
                "code": "1",
              },
            ).then((response) async {
              token = jsonDecode(response.body)['key'];

              const storage = FlutterSecureStorage();

              await storage.write(key: 'token', value: token);
            });
          }));
}

logOut() async {
  await googleSignIn.signOut();
}

Future<List<dynamic>> getWorkshops() async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=W"));
  return json.decode(response.body)['results'];
}

Future<List<dynamic>> getTechnicals() async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=T"));
  return json.decode(response.body)['results'];
}

Future<List<dynamic>> getLectures() async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=L"));
  return json.decode(response.body)['results'];
}

Future<List<dynamic>> getGenerals() async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=G"));
  return json.decode(response.body)['results'];
}

Future<List<dynamic>> getProshows() async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=P"));
  return json.decode(response.body)['results'];
}

Future<List<dynamic>> getCulturals() async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=C"));
  return json.decode(response.body)['results'];
}

Future<List<dynamic>> getTrendingEvents() async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/event/trending"));
  return json.decode(response.body)['results'];
}

Future<Map<String, dynamic>> getEventDetails(String slug) async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/event/" + slug));
  return json.decode(response.body);
}

Future<Map<String, dynamic>> getProfile() async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/users/me"));
  return json.decode(response.body);
}
