import 'dart:convert';
import 'package:http/http.dart' as http;

String hostUrl = "https://backend.hestiatkmce.live";

Future<List<dynamic>> getAllEvents() async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/event/"));
  return json.decode(response.body)['results'];
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

Future<List<dynamic>> getSpots() async {
  http.Response response =
      await http.get(Uri.parse(hostUrl + "/api/v1/event/location/all"));

  List<dynamic> list = json.decode(response.body)['results'];

  for (dynamic result in list) {
    http.Response response1 = await http.get(
        Uri.parse(hostUrl + "/api/v1/event/?venue__title=" + result['title']));

    result['events'] = json.decode(response1.body)['results'];
  }

  return list;
}

Future<List<dynamic>> getSchedule(String start, String end) async {
  http.Response response = await http.get(
      Uri.parse(hostUrl + "/api/v1/event/??event_start=$start&event_end=$end"));

  return jsonDecode(response.body)['results'];
}
