import 'dart:convert';
import 'package:http/http.dart' as http;

String hostUrl = "https://backend.hestiatkmce.live";

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
