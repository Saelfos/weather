
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/pages/first_page.dart';
import 'controllers/weather_controller.dart';


void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  //Injecting GetX Controller
  Get.put(WeatherController());
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//Get Material App for Navigation with GetX
    return GetMaterialApp(
debugShowCheckedModeBanner: false,
      //Light Theme
      theme: ThemeData(
        brightness: Brightness.light,
            //The new Design Language From Google
            useMaterial3: true,
      ),
      //Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        //The new Design Language From Google
            useMaterial3: true,
      ),
      home: FirstPage(

      ),


    );
  }
}
