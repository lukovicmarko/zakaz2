// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestResult {
  RequestResult(this.url, {required this.headers});
  final String url;
  final Map<String, String> headers;
  final String apiUrl = dotenv.get('API_URL', fallback: 'API_URL not found');

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse('${apiUrl}${url}'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return response.statusCode;
    }
  }

  Future sendData(body) async {
    var postHeaders = {...headers, 'Content-Type': 'application/json'};
    http.Response response = await http.post(
      Uri.parse('${apiUrl}${url}'),
      headers: postHeaders,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      return response.body;
    }
  }
}
