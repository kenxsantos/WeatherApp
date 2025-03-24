import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/components/icon_text_column.dart';
import 'package:weatherapp/viewmodels/weather_viewmodel.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App", style: TextStyle(fontSize: 16)),
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
        foregroundColor: const Color.fromARGB(255, 161, 159, 159),
      ),
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      body:
          weatherViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : weatherViewModel.weather == null
              ? const Center(
                child: Text(
                  'No data available.',
                  style: TextStyle(color: Colors.white),
                ),
              )
              : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        '${weatherViewModel.weather!.countryName} - ${weatherViewModel.weather!.country}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color.fromARGB(221, 255, 255, 255),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        '${weatherViewModel.weather!.latitude}, ${weatherViewModel.weather!.longitude}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: const Color.fromARGB(221, 255, 255, 255),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/weather.png"),
                        ),
                      ),
                    ),
                    Text(
                      weatherViewModel.weather!.weatherDescription ??
                          'No description available',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: const Color.fromARGB(221, 255, 255, 255),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '${weatherViewModel.weather!.temperature}',
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 80,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: '°',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 85,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        '${weatherViewModel.weather!.tempMin}°C, ${weatherViewModel.weather!.tempMax}°C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: const Color.fromARGB(221, 255, 255, 255),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconTextColumn(
                          icon: Icons.water_drop,
                          text1: '${weatherViewModel.weather!.humidity}%',
                          text2: 'Humidity',
                          onPressed: () {
                            print('Icon Clicked');
                          },
                        ),
                        IconTextColumn(
                          icon: Icons.thermostat,
                          text1: '${weatherViewModel.weather!.pressure} hPa',
                          text2: 'Pressure',
                          onPressed: () {
                            print('Icon Clicked');
                          },
                        ),
                        IconTextColumn(
                          icon: Icons.speed,
                          text1: '${weatherViewModel.weather!.windSpeed} km/h',
                          text2: 'Speed',
                          onPressed: () {
                            print('Icon Clicked');
                          },
                        ),
                        IconTextColumn(
                          icon: Icons.wind_power_rounded,
                          text1: ' ${weatherViewModel.weather!.windDeg}°',
                          text2: 'Direction',
                          onPressed: () {
                            print('Icon Clicked');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconTextColumn(
                          icon: Icons.cloud,
                          text1: '${weatherViewModel.weather!.windDeg}%',
                          text2: 'Cloud',
                          onPressed: () {
                            print('Icon Clicked');
                          },
                        ),
                        IconTextColumn(
                          icon: Icons.visibility,
                          text1: '${weatherViewModel.weather!.visibility}',
                          text2: 'Visibility',
                          onPressed: () {
                            print('Icon Clicked');
                          },
                        ),
                        IconTextColumn(
                          icon: Icons.sunny,
                          text1: DateFormat.jm().format(
                            DateTime.parse(weatherViewModel.weather!.sunrise!),
                          ),
                          text2: 'Sunrise',
                          onPressed: () {
                            print('Icon Clicked');
                          },
                        ),
                        IconTextColumn(
                          icon: Icons.nightlight_round,
                          text1: DateFormat.jm().format(
                            DateTime.parse(weatherViewModel.weather!.sunset!),
                          ),
                          text2: 'Sunset',
                          onPressed: () {
                            print('Icon Clicked');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }
}
