import 'package:comic_vine/pages/comics_page.dart';
import 'package:comic_vine/pages/film_page.dart';
import 'package:comic_vine/pages/home_page.dart';
import 'package:comic_vine/pages/search_page.dart';
import 'package:comic_vine/pages/series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
          backgroundColor: const Color(0XFF15232E),
          body: const [
            HomePage(),
            ComicsPage(),
            SeriesPage(),
            FilmPage(),
            SearchPage()
          ][_currentIndex],
          bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                        color: const Color(0XFF3792FF),
                      );
                    } else {
                      return TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                        color: const Color(0XFF778BA8),
                      );
                    }
                  },
                ),
                backgroundColor: const Color(0XFF0F1E2B),
                indicatorColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Container(
                width: 375,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                  ),
                  color: Color(0xFF0F1E2B),
                  boxShadow: [
                    BoxShadow(
                      color:  Color(0xFF15232E),
                      offset: Offset(2, 6),
                      blurRadius: 20,
                    ),
                    BoxShadow(
                      color: Color(0xFF6F8FEA),
                      offset: Offset(4, 16),
                      blurRadius: 52,
                    ),
                  ],
                ),
                child: NavigationBar(
                  selectedIndex: _currentIndex,
                  onDestinationSelected: setCurrentIndex,
                  destinations: List.generate(
                      5, (index) => _buildNavigationDestination(index)),
                ),
              )),
        ));
  }

  Container _buildNavigationDestination(int index) {
    bool isSelected = _currentIndex == index;
    return Container(
      width: isSelected ? 68 : 58,
      height: isSelected ? 60 : 45,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0XFF12273C) : Colors.transparent,
        borderRadius: BorderRadius.circular(23),
      ),
      child: NavigationDestination(
        icon: SvgPicture.asset(
          _getIconForIndex(index),
          width: 24,
          colorFilter:
              const ColorFilter.mode(Color(0XFF778BA8), BlendMode.srcIn),
        ),
        selectedIcon: SvgPicture.asset(
          _getIconForIndex(index),
          width: 24,
          colorFilter:
              const ColorFilter.mode(Color(0XFF3792FF), BlendMode.srcIn),
        ),
        label: _getLabelForIndex(index),
      ),
    );
  }

  String _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return 'assets/SVG/navbar_home.svg';
      case 1:
        return 'assets/SVG/navbar_comics.svg';
      case 2:
        return 'assets/SVG/navbar_series.svg';
      case 3:
        return 'assets/SVG/navbar_movies.svg';
      case 4:
        return 'assets/SVG/navbar_search.svg';
      default:
        return 'assets/SVG/navbar_home.svg';
    }
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return 'Accueil';
      case 1:
        return 'Comics';
      case 2:
        return 'Series';
      case 3:
        return 'Film';
      case 4:
        return 'Search';
      default:
        return 'Autre';
    }
  }
}