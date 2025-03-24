import 'package:flutter/material.dart';
import 'package:weatherapp/screens/weather_page.dart';
import 'package:weatherapp/viewmodels/weather_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeViewModelProvider extends StatelessWidget {
  const HomeViewModelProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherViewModel()..fetchWeather("Canada"),
      child: WeatherPage(),
    );
  }
}
