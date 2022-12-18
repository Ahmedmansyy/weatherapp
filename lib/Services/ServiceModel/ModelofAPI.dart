// ignore_for_file: file_names, camel_case_types, avoid_print

import 'package:flutter/material.dart';

class modelAPI {
  String date;
  double temp;
  double mintemp;
  double maxtemp;
  String weatherStateName;

  modelAPI(
      {required this.date,
      required this.temp,
      required this.mintemp,
      required this.maxtemp,
      required this.weatherStateName});

  //   modelAPI.fromJson(dynamic jesondata) {
  //   var jesonjeson = jesondata['forecast']['forecastday']['day'];
  //   date = jesondata['location']['localtime'];
  //   temp = jesonjeson['avgtemp_c'];
  //   mintemp = jesonjeson['mintemp_c'];
  //   maxtemp = jesonjeson['maxtemp_c'];
  //   WeatherStateName = jesonjeson['condition']['text'];
  // }

  factory modelAPI.fromJson(dynamic jesondata) {
    var jesonjeson = jesondata['forecast']['forecastday'][0]['day'];
    return modelAPI(
        date: jesondata['location']['localtime'],
        temp: jesonjeson['avgtemp_c'],
        mintemp: jesonjeson['mintemp_c'],
        maxtemp: jesonjeson['maxtemp_c'],
        weatherStateName: jesonjeson['condition']['text']);
  }

  String getimg() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return 'assets/img/clear.png';
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return 'assets/img/snow.png';
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return 'assets/img/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/img/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return 'assets/img/thunderstorm.png';
    } else {
      return 'assets/img/clear.png';
    }
  }

  MaterialColor getthemecolor() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
