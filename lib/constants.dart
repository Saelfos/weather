




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather/controllers/weather_controller.dart';

import 'controllers/remote_service.dart';
//Main light theme
final light = SystemUiOverlayStyle(
  statusBarColor:
  Colors.white,
  statusBarIconBrightness:
  Brightness.dark ,
  systemNavigationBarColor:
  Colors.white,
  systemNavigationBarIconBrightness:
  Brightness.dark ,
);
//Main dark theme
final dark = SystemUiOverlayStyle(
  statusBarColor:
  Colors.grey.shade900,
  statusBarIconBrightness:
  Brightness.light,
  systemNavigationBarColor:
  Colors.grey.shade900,
  systemNavigationBarIconBrightness:
  Brightness.light,
);


//App's main GetX Controller
WeatherController weatherController = Get.put(WeatherController());