




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather/controllers/weather_controller.dart';

import 'controllers/remote_service.dart';
//Main light theme
final light = SystemUiOverlayStyle(
  statusBarColor:
  Colors.cyan.shade100,
  statusBarIconBrightness:
  Brightness.dark ,
  systemNavigationBarColor:
  Colors.cyan.shade100 ,
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