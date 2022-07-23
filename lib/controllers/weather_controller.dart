
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/controllers/remote_service.dart';
import 'package:weather/models/weather_model.dart';

import '../constants.dart';


class WeatherController extends GetxController {
  static WeatherController instance= Get.find();
var isLoading=true.obs;



  @override
  void onReady() {
    super.onReady();
    getWeather();
  }
  Welcome weather;
  //Filtering data to multiple lists for ease of use
List <ListElement> singleRead;
List <ListElement> firstDay;
List <ListElement> secondDay;
List <ListElement> thirdDay;
List <ListElement> fourthDay;
List <ListElement> fifthDay;

  void getWeather() async {
    try {
      var weatherResponse = await RemoteService.getWeather();
      if (weatherResponse != null) {
         weather=weatherResponse;
         isLoading.value=false;

         // SingleDayResponse
         List<ListElement> singleResponse=weatherController.weather.list.where((e) =>
             e.dtTxt.toString().contains('12:00:00')).toList();
         singleRead=singleResponse;

         //FirstDayResponse
         List<ListElement> firstDayResponse=weatherController.weather.list.where((e)
         => e.dtTxt.toString().contains(DateFormat("y-MM-d").format(DateTime.now()))).toList();
         firstDay=firstDayResponse;

         //SecondDayResponse
         List<ListElement> secondDayResponse=weatherController.weather.list.where((e)
         => e.dtTxt.toString().contains(DateFormat("y-MM-d").format(DateTime.now().add(Duration(days: 1))))).toList();
         secondDay=secondDayResponse;
         //ThirdDayResponse
         List<ListElement> thirdDayResponse=weatherController.weather.list.where((e)
         => e.dtTxt.toString().contains(DateFormat("y-MM-d").format(DateTime.now().add(Duration(days: 2))))).toList();
         thirdDay=thirdDayResponse;
         //4ThDayResponse
         List<ListElement> fourthDayResponse=weatherController.weather.list.where((e)
         => e.dtTxt.toString().contains(DateFormat("y-MM-d").format(DateTime.now().add(Duration(days: 3))))).toList();
         fourthDay=fourthDayResponse;

         //5ThDayResponse
         List<ListElement> fifthDayResponse=weatherController.weather.list.where((e)
         => e.dtTxt.toString().contains(DateFormat("y-MM-d").format(DateTime.now().add(Duration(days: 4))))).toList();
         fifthDay=fifthDayResponse;
//Some printing tests during development
         print(weather.list.length);
         print(singleResponse.length);
         print(DateFormat("y-MM-d").format(DateTime.now().add(Duration(days: 2))));

      }
    } finally {
//in case we need to add some task

    }
  }
}


















// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:weather/controllers/remote_service.dart';
// import 'package:weather/models/weather_model.dart';
// import 'package:http/http.dart' as http;
//
// class WeatherController extends GetxController{
//   var meals = WeatherModel().obs;
// var weatherModel;
//   Future<WeatherModel> getWeather() async {
//
//     var response = await http.get(Uri.parse(
//         'http://api.openweathermap.org/data/2.5/forecast?id=292223&appid=dc55eb32e9a3307811cede2cd38ec4e3'));
//
//     print(response.body);
//
//     final json = jsonDecode(response.body);
//    meals.value=json;
//     return WeatherModel.fromJson(json);
//   }
//
//
//   @override
//   void onReady() {
//     super.onReady();
//     getWeather();
//
//   }
//
//
// }