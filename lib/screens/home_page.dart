import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              'Welcome to the Home Page',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: const Color.fromARGB(221, 255, 255, 255),
              ),
            ),
          ],
      ),
      ),
    );  
  }
}