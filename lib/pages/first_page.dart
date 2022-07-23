import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/pages/second_page.dart';
import '../constants.dart';
import '../controllers/weather_controller.dart';

class FirstPage extends StatelessWidget {
  FirstPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get The Brightness of the device
    Get.put(WeatherController());
    var brightness = MediaQuery.of(context).platformBrightness;
    // Get physical Width and height of device
    final Size size = MediaQuery.of(context).size;
    //Set Device's Status bar And Navigation Bar Colors depending on device's theme
    SystemChrome.setSystemUIOverlayStyle(
        brightness == Brightness.light ? light : dark);
    return SafeArea(
      child: Scaffold(
        //Scaffold's Background color
        backgroundColor: brightness == Brightness.light
            ? Colors.white
            : Colors.grey.shade900,
        appBar: AppBar(
          //Appbar Background color
          backgroundColor: brightness == Brightness.light
              ? Colors.white
              : Colors.grey.shade900,
          title: const Text('Weather Forecast'),
        ),
        body:
            // Obx to update widget dynamically
            Obx(() => Center(
                child: weatherController.isLoading.value==false //Loading circle progress bar
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.15,
                          ),
                          SizedBox(
                              height: size.height * 0.12,
                              child: Column(
                                children: const [
                                  Text(
                                    "Today's Weather",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ],
                              )),
                          //cached network image to cache images
                          Card(
                            child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                      imageUrl:
                                          'http://openweathermap.org/img/wn/${weatherController.singleRead.first.weather.single.icon}@2x.png'),
                                  Text(
                                    weatherController.singleRead.first.main.temp
                                        .toString()
                                        .substring(0, 2) +
                                        '°',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    DateFormat('EEEE').format(DateTime.now()),
                                    style: TextStyle(fontSize: 26),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: size.height * 0.17,
                          ),
                          Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (BuildContext, index) {
                                    return InkWell(
                                        onTap: () {
                                          //Navigating between pages with GetX
                                          Get.to(() => SecondPage(
                                              //Passing data to second page
                                              dayIndex: index,
                                              feelsLike: weatherController
                                                  .singleRead[index]
                                                  .main
                                                  .feelsLike,
                                              humidity: weatherController
                                                  .singleRead[index]
                                                  .main
                                                  .humidity,
                                              wind: weatherController
                                                  .singleRead[index]
                                                  .wind
                                                  .speed));
                                          print(index);
                                        },
                                        child: SizedBox(
                                          height: 100,
                                          width: size.width * 0.26,
                                          child: Card(
                                            color:
                                                brightness == Brightness.light
                                                    ? Colors.cyan.shade100
                                                    : Colors.grey.shade800,
                                            child: Column(
                                              children: [
                                                CachedNetworkImage(
                                                    imageUrl:
                                                        'http://openweathermap.org/img/wn/${weatherController.singleRead[index].weather.single.icon}@2x.png'),
                                                Text(weatherController
                                                    .singleRead[index].dtTxt
                                                    .toString()
                                                    .substring(0, 10)),
                                              ],
                                            ),
                                          ),
                                        ));
                                  }
                                  )
                          ),
                        ],
                      )
            )
            ),
      ),
    );
  }
}
