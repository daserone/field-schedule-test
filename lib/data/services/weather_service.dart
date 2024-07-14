import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_agenda/data/constants.dart';
import 'package:test_agenda/data/models/weather_model.dart';

Future<WeatherModel?> getWeatherData(
    double lat, double long, String time) async {
  WeatherModel? result;
  try {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&dt=$time&appid=$weatherApiKey&lang=es"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = WeatherModel.fromJson(item);
    } else {
      log("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}
