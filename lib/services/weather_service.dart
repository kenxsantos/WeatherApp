import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class WeatherService {
  final Dio dio;

  WeatherService() : dio = Dio() {
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<dynamic> fetchWeather(String place, String appKey) async {
    try {
      // Define the API URL and query parameters
      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {'q': place, 'appid': appKey, 'units': 'metric'},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print('Weather data: ${response.data}');
      return response.data;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}


//987908