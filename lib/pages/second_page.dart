import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/weather_model.dart';

import '../constants.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key key, @required this.dayIndex, this.feelsLike, this.humidity,this.wind})
      : super(key: key);
  String icon;
  int dayIndex;
  double feelsLike;
  int humidity;
double wind;
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        brightness == Brightness.light ? light : dark);
    return SafeArea(
        child: Scaffold(
            backgroundColor: brightness == Brightness.light
                ? Colors.cyan.shade100
                : Colors.grey.shade900,
            appBar: AppBar(
              backgroundColor: brightness == Brightness.light
                  ? Colors.cyan.shade100
                  : Colors.grey.shade900,
              title: Text(DateFormat('EEEE')
                  .format(DateTime.now().add(Duration(days: dayIndex)))),
            ),
            body: Column(children: [
              SizedBox(
                height: size.height * 0.33,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Feels Like',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      feelsLike.toString().substring(0, 2) + '°',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dayIndex == 0
                        ? weatherController.firstDay.length
                        : dayIndex == 1
                            ? weatherController.secondDay.length
                            : dayIndex == 2
                                ? weatherController.thirdDay.length
                                : dayIndex == 3
                                    ? weatherController.fourthDay.length
                                    : weatherController.fifthDay.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        width: size.width * 0.26,
                        child: Card(
                          color: brightness == Brightness.light
                              ? Colors.cyan.shade200
                              : Colors.grey.shade800,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text( dayIndex == 0
                                  ? weatherController
                                  .firstDay[index].dtTxt.toString().substring(10,16)
                                  : dayIndex == 1
                                  ? weatherController
                                  .secondDay[index].dtTxt.toString().substring(10,16)
                                  : dayIndex == 2
                                  ? weatherController
                                  .thirdDay[index].dtTxt.toString().substring(10,16)
                                  : dayIndex == 3
                                  ? weatherController
                                  .fourthDay[index].dtTxt.toString().substring(10,16)
                                  : weatherController
                                  .fifthDay[index].dtTxt.toString().substring(10,16),),
                              CachedNetworkImage(
                                  imageUrl:
                                      'http://openweathermap.org/img/wn/${dayIndex == 0 ? weatherController.firstDay[index].weather.single.icon : dayIndex == 1 ? weatherController.secondDay[index].weather.single.icon : dayIndex == 2 ? weatherController.thirdDay[index].weather.single.icon : dayIndex == 3 ? weatherController.fourthDay[index].weather.single.icon : weatherController.fifthDay[index].weather.single.icon}@2x.png'),
                              Text(
                                dayIndex == 0
                                    ? weatherController
                                            .firstDay[index].main.temp
                                            .toString()
                                            .substring(0, 2) +
                                        '°'
                                    : dayIndex == 1
                                        ? weatherController
                                                .secondDay[index].main.temp
                                                .toString()
                                                .substring(0, 2) +
                                            '°'
                                        : dayIndex == 2
                                            ? weatherController
                                                    .thirdDay[index].main.temp
                                                    .toString()
                                                    .substring(0, 2) +
                                                '°'
                                            : dayIndex == 3
                                                ? weatherController
                                                        .fourthDay[index]
                                                        .main
                                                        .temp
                                                        .toString()
                                                        .substring(0, 2) +
                                                    '°'
                                                : weatherController
                                                        .fifthDay[index]
                                                        .main
                                                        .temp
                                                        .toString()
                                                        .substring(0, 2) +
                                                    '°',
                                style: TextStyle(fontSize: 18),
                              ),

                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: size.height * 0.10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                //Humidity
                SizedBox(
                  height: size.height * 0.18,
                  width: size.width*0.25,
                  child: Card(
                    color: brightness == Brightness.light
                        ? Colors.cyan.shade200
                        : Colors.grey.shade800,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(humidity.toString()),
                        Text('Humidity')
                      ],
                    ),
                  ),
                ),
                SizedBox(width: size.width*0.1),
                //Wind
                SizedBox(
                  height: size.height*0.18,
                  width: size.width*0.25,
                  child: Card(
                    color: brightness == Brightness.light
                        ? Colors.cyan.shade200
                        : Colors.grey.shade800,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(wind.toString()),
                        Text('Wind')],
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: size.height * 0.08,
              )
            ])));
  }
}
