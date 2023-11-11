import 'package:http/http.dart' as http;
import 'package:tandu_run/config/url_static.dart';

final _headers = {"Accept": "application/json"};

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
    var url = Uri.parse(URLAPI.url + api);
    var response = await client.post(url, headers: _headers, body: object);

    if(response.statusCode == 200 || response.statusCode == 422){
      return response.body;

    }else{
      throw Exception();
    }
  }
}
