import 'dart:convert';

import 'package:devsteam/constants/strings.dart';
import 'package:devsteam/models/newsInfo.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class API_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var welcome;

    try {
      var response = await client.get(Strings.unsplash);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        welcome = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return welcome;
    }

    return welcome;
  }
}
