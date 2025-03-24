import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:weatherapp/core/constant.dart';

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

  Future<Map<String, dynamic>> fetchWeather(String location) async {
    final response = await dio.get(
      '${AppConstants.baseUrl}weather?q=$location&appid=${AppConstants.apiKey}&units=metric',
    );
    return response.data;
  }
}


//987908