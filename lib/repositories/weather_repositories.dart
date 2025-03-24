import 'package:weatherapp/services/weather_service.dart';

class WeatherRepository {
  final WeatherService _apiService;

  WeatherRepository(this._apiService);

  Future<Map<String, dynamic>> fetchWeather(String location) {
    return _apiService.fetchWeather(location);
  }
}
