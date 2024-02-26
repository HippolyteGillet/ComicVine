import 'package:comic_vine/pages/comics_page.dart';
import 'package:comic_vine/pages/film_page.dart';
import 'package:comic_vine/pages/home_page.dart';
import 'package:comic_vine/pages/search_page.dart';
import 'package:comic_vine/pages/series_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: [
            HomePage(),
            ComicsPage(),
            FilmPage(),
            SearchPage(),
            SeriesPage()
          ][_currentIndex],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.white,
              indicatorColor: Colors.transparent,
            ),
            child: NavigationBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: setCurrentIndex,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.book),
                  label: 'Comics',
                ),
                NavigationDestination(
                  icon: Icon(Icons.movie),
                  label: 'Film',
                ),
                NavigationDestination(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                NavigationDestination(
                  icon: Icon(Icons.tv),
                  label: 'Series',
                ),
              ],
            ),
        )));
  }
}
