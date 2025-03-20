import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home_page.dart';
 

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Discover The Weather in Your City',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: const Color.fromARGB(221, 255, 255, 255),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/weather.png"),
                  )
              ),
            ),
             Text(
              'Get to know your weather maps and radar precipitation forcast',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => HomePage())
                  );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(223, 241, 148, 9),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
        ),
              ),
               child: Text(
                "Get Started",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
               ),

              ),
            )
          ],
      ),
      ),
    );
  }
}