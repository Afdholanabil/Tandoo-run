import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tandu_run/config/url_static.dart';

final _headers = {
  "Accept": "application/json",
  "Content-Type": "application/json"
};

class APIClient {
  var client = http.Client();

  Future<dynamic> getData(String api) async {
    var url = Uri.parse(URLAPI.url + api);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception();
    }
  }

  Future<dynamic> postData(String api, dynamic object) async {
    try {
      var url = Uri.parse(URLAPI.url + api);
      var requestJson = jsonEncode(object);
      var response = await client.post(url, headers: _headers, body: requestJson);

      if (response.statusCode == 200 || response.statusCode == 422) {
        return response.body;
      } else {
        throw Exception(
            "Failed to post data. Status code: ${response.statusCode}\n${response.body}");
      }
    } catch (e, stackTrace) {
      print("Error during postData: $e");
      print("Stack trace: $stackTrace");
      throw Exception("Failed to post data. Check your network connection.");
    }
  }
}
