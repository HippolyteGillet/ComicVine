import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF15232E),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 50), // Espacement en haut
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Bienvenue !',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: GoogleFonts.nunito().fontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/SVG/astronaut.svg',
                  width: 120,
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -80),
              child: Column(
                children: [
                  buildSectionBox('Séries populaires'),
                  const SizedBox(height: 30),
                  buildSectionBox('Comics populaires'),
                  const SizedBox(height: 30),
                  buildSectionBox('Films populaires'),
                  const SizedBox(height: 30),
                ],
              )


            ),

          ],
        ),
      ),
    );
  }

  Widget buildSectionBox(String title) {
    return Transform.translate(
        offset: const Offset(10, 20),
        child: Container(
          width: 424,
          height: 329,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0XFF1E3243),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0XFFFF8100),
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Espace entre le point et le texte
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: GoogleFonts.nunito().fontFamily,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 92,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0XFF0F1921),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Voir plus',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: GoogleFonts.nunito().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
