// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:weatherappv2/Services/ServiceModel/ModelofAPI.dart';

class weatherprovider extends ChangeNotifier {
  modelAPI? _weatherprovidersdata;

  String? CityName;
  set weatherprovidersdata(modelAPI? weather) {
    _weatherprovidersdata = weather;
    notifyListeners();
  }

  modelAPI? get weatherprovidersdata => _weatherprovidersdata;
}
