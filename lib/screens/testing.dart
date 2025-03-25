import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/components/icon_text_column.dart';

class TestingPage extends StatelessWidget {
  const TestingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 41, 41, 41),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Philippines - PH',
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
                '14.0, 90.89',
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
              'Cloudy',
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
                  text: '17',
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
                '56°C, 89°C',
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
                  text1: '56%',
                  text2: 'Humidity',
                ),
                IconTextColumn(
                  icon: Icons.thermostat,
                  text1: '85 hPa',
                  text2: 'Pressure',
                ),
                IconTextColumn(
                  icon: Icons.speed,
                  text1: '56 km/h',
                  text2: 'Speed',
                ),
                IconTextColumn(
                  icon: Icons.wind_power_rounded,
                  text1: '89 °',
                  text2: 'Direction',
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconTextColumn(icon: Icons.cloud, text1: '89%', text2: 'Cloud'),
                IconTextColumn(
                  icon: Icons.visibility,
                  text1: '88',
                  text2: 'Visibility',
                ),
                IconTextColumn(
                  icon: Icons.sunny,
                  text1: "06:00 AM",
                  text2: 'Sunrise',
                ),
                IconTextColumn(
                  icon: Icons.nightlight_round,
                  text1: "06:00 AM",
                  text2: 'Sunset',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
