import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Bienvenue !',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SvgPicture.asset(
            'assets/SVG/astronaut.svg',
            width: 300,
          ),
        ],
      ),
      backgroundColor: const Color(0XFF15232E),
    );
  }
}
