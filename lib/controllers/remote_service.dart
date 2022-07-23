import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';


class RemoteService{

  static Future<Welcome> getWeather() async {
    //The main uri to get data from
    final uri = Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?id=292223&appid=dc55eb32e9a3307811cede2cd38ec4e3&units=metric');

    final response = await http.get(uri);

    print(response.body);
    //Making sure data is not null and response code ==200
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Welcome.fromJson(json);
    } else {
      //show error message
      return null;
    }
  }
}