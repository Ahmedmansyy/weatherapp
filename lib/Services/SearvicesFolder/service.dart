// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import '../ServiceModel/ModelofAPI.dart';

class serviceAPI {
  String Baseurl = 'http://api.weatherapi.com/v1';
  String apiKey = 'fd0917039e174a4da55204700220612';

  Future<modelAPI> getweather({required String CityName}) async {
    Uri url = Uri.parse(
        '$Baseurl/forecast.json?key=$apiKey&q=$CityName&days=1&aqi=no&alerts=no');
  
    http.Response response = await http.get(url);
    // al data alrag3aly
    Map<String, dynamic> jesondata = jsonDecode(
      response.body,
    );

    // modelAPI fitchWeather = modelAPI.fromJson(jesondata);
    return modelAPI.fromJson(jesondata);
  }
}


