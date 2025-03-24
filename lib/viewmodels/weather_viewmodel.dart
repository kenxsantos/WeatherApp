import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherService _apiService = WeatherService();

  WeatherModel? weather;
  bool isLoading = true;

  Future<void> fetchWeather(String location) async {
    try {
      isLoading = true;
      notifyListeners();

      final weatherData = await _apiService.fetchWeather(location);
      weather = WeatherModel.fromJson(weatherData);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
