import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/data/models/weather_model.dart';
import 'package:test_agenda/data/services/weather_service.dart';
import 'package:test_agenda/domain/provider/position_provider.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherData;
  bool loading = false;
  String _rainProb = '';

  setRaingProb(String wheaterDesc) {
    log(wheaterDesc);
    _rainProb = wheaterDesc;
    notifyListeners();
  }

  String get rainProb {
    return _rainProb;
  }

  getWeather(BuildContext context, String time) async {
    final posiProvider = Provider.of<PositionProvider>(context, listen: false);
    loading = true;
    weatherData = await getWeatherData(posiProvider.location?.latitude ?? 0.0,
        posiProvider.location?.longitude ?? 0.0, time);
    setRaingProb(
        weatherData?.weather?.first.description ?? 'error al cargar datos');
    loading = false;

    notifyListeners();
  }
}
