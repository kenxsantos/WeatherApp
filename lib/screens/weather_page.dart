import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date/time
import 'package:weatherapp/services/weather_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/component/icon_text_column.dart';

class WeatherPage extends StatelessWidget {
  final WeatherService weatherService = WeatherService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App", style: TextStyle(fontSize: 16)),
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
        foregroundColor: const Color.fromARGB(255, 161, 159, 159),
      ),
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      body: FutureBuilder<dynamic>(
        future: weatherService.fetchWeather(
          'Philippines',
          'f1a44e6f2174a6e9fdabad07d58f621f',
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text(
                'No data available.',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            final weatherData = snapshot.data;

            // Extract individual pieces of data
            final coord = weatherData['coord']; //
            final weather = weatherData['weather'][0];
            final main = weatherData['main'];
            final wind = weatherData['wind'];
            final sys = weatherData['sys'];
            final timezone = weatherData['timezone'];
            final name = weatherData['name'];

            // Convert sunrise and sunset to readable time
            final sunrise = DateTime.fromMillisecondsSinceEpoch(
              sys['sunrise'] * 1000,
              isUtc: true,
            ).add(Duration(seconds: timezone));
            final sunset = DateTime.fromMillisecondsSinceEpoch(
              sys['sunset'] * 1000,
              isUtc: true,
            ).add(Duration(seconds: timezone));

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '$name - ${sys['country']}',
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
                      '${coord['lat']}, ${coord['lon']}',
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
                    weather['description'],
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
                        text: '${main['temp']}',
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 80,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: '°',
                            style: TextStyle(color: Colors.blue, fontSize: 85),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '${main['temp_min']}°C, ${main['temp_max']}°C',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: const Color.fromARGB(221, 255, 255, 255),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconTextColumn(
                        icon: Icons.water_drop,
                        text1: '${main['humidity']}%',
                        text2: 'Humidity',
                        onPressed: () {
                          print('Icon Clicked');
                        },
                      ),
                      IconTextColumn(
                        icon: Icons.thermostat,
                        text1: '${main['pressure']} hPa',
                        text2: 'Pressure',
                        onPressed: () {
                          print('Icon Clicked');
                        },
                      ),
                      IconTextColumn(
                        icon: Icons.speed,
                        text1: '${wind['speed']} km/h',
                        text2: 'Speed',
                        onPressed: () {
                          print('Icon Clicked');
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconTextColumn(
                        icon: Icons.wind_power_rounded,
                        text1: ' ${wind['deg']}°',
                        text2: 'Direction',
                        onPressed: () {
                          print('Icon Clicked');
                        },
                      ),
                      IconTextColumn(
                        icon: Icons.cloud,
                        text1: '${weatherData['clouds']['all']}%',
                        text2: 'Cloudiness',
                        onPressed: () {
                          print('Icon Clicked');
                        },
                      ),
                      IconTextColumn(
                        icon: Icons.visibility,
                        text1: '${weatherData['visibility']} m',
                        text2: 'Visibility',
                        onPressed: () {
                          print('Icon Clicked');
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconTextColumn(
                        icon: Icons.sunny,
                        text1: DateFormat.jm().format(sunrise),
                        text2: 'Sunrise',
                        onPressed: () {
                          print('Icon Clicked');
                        },
                      ),
                      IconTextColumn(
                        icon: Icons.nightlight_round,
                        text1: DateFormat.jm().format(sunset),
                        text2: 'Sunset',
                        onPressed: () {
                          print('Icon Clicked');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
