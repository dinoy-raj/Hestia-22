import 'dart:convert';
import 'package:http/http.dart' as http;

String hostUrl =
    "https://5995-2409-4073-2e8e-d4e-cac4-c6e2-72ca-8360.in.ngrok.io";

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
      await http.get(Uri.parse(hostUrl + "/api/v1/event/" + slug));
  return json.decode(response.body);
}

