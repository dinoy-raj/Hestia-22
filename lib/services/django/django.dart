import 'dart:convert';
import 'package:http/http.dart' as http;

String hostUrl = "https://api.hestiatkmce.live";

Future<Map<String, dynamic>> login(String username, String password) async {
  http.Response response = await http.get(Uri.parse(hostUrl));
  return json.decode(response.body);
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

Future<Map<String, dynamic>> getEventDetails(String slug) async {
  http.Response response =
      await http.get(
          Uri.parse(hostUrl + "/api/v1/event/" + slug));
  return json.decode(response.body);
}
