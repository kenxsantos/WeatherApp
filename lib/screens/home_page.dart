import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/component/icon_text_column.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Today\'s Report',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color.fromARGB(221, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/weather.png"),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Its Rainy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color.fromARGB(221, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '29',
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconTextColumn(
                  icon: Icons.speed,
                  text1: '23 km/h',
                  text2: 'Sun',
                  onPressed: () {
                    print('Icon Clicked');
                  },
                ),
                IconTextColumn(
                  icon: Icons.speed,
                  text1: '50 %',
                  text2: 'Humidity',
                  onPressed: () {
                    print('Icon Clicked');
                  },
                ),
                IconTextColumn(
                  icon: Icons.speed,
                  text1: '23 km/h',
                  text2: 'Rain',
                  onPressed: () {
                    print('Icon Clicked');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          print('Floating Action Button Clicked');
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home_outlined),
                color: Colors.white,
                onPressed: () {
                  print('Home Clicked');
                },
              ),
              IconButton(
                icon: Icon(Icons.cloud_outlined),
                color: Colors.white,
                onPressed: () {
                  print('Search Clicked');
                },
              ),

              IconButton(
                icon: Icon(Icons.favorite_outline_sharp),
                color: Colors.white,
                onPressed: () {
                  print('Notifications Clicked');
                },
              ),
              IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  print('Menu Clicked');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
