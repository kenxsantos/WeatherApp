import 'package:flutter/material.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/screens/favorite_page.dart';
import 'package:weatherapp/screens/menu_page.dart';
import 'package:weatherapp/screens/search_page.dart';
import 'package:weatherapp/screens/testing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  bool isDarkMode = true;

  final screens = [
    const TestingPage(),
    const SearchPage(),
    const FavoritePage(),
    const MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App", style: TextStyle(fontSize: 16)),
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
        foregroundColor: const Color.fromARGB(255, 161, 159, 159),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
                if (isDarkMode) {
                  MyApp.of(context).changeTheme(ThemeMode.dark);
                } else {
                  MyApp.of(context).changeTheme(ThemeMode.light);
                }
              });
            },
            icon:
                isDarkMode
                    ? Icon(Icons.dark_mode)
                    : Icon(Icons.light_mode, color: Colors.white),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                enableFeedback: false,
                icon:
                    pageIndex == 0
                        ? Icon(Icons.home, size: 26)
                        : Icon(Icons.home_outlined),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
              ),
              IconButton(
                enableFeedback: false,
                icon:
                    pageIndex == 1
                        ? Icon(Icons.search, size: 26)
                        : Icon(Icons.search_outlined),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
              ),
              IconButton(
                enableFeedback: false,
                icon:
                    pageIndex == 2
                        ? Icon(Icons.favorite, size: 26)
                        : Icon(Icons.favorite_border),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
              ),
              IconButton(
                enableFeedback: false,
                icon:
                    pageIndex == 3
                        ? Icon(Icons.menu, size: 26)
                        : Icon(Icons.menu_outlined),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: screens[pageIndex],
    );
  }
}
