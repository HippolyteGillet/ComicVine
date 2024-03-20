import 'package:comic_vine/comicvine_request.dart';
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
            const SizedBox(height: 50),
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
                    buildSectionBox('Séries populaires', NetworkRequest().loadSeries()),
                    const SizedBox(height: 30),
                    buildSectionBox('Comics populaires', NetworkRequest().loadComics()),
                    const SizedBox(height: 30),
                    buildSectionBox('Films populaires', NetworkRequest().loadMovies()),
                    const SizedBox(height: 30),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget buildSectionBox(String title, Future<dynamic> futureItems){
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
                padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
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
                        const SizedBox(width: 10),
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
              //const Padding(padding: EdgeInsets.only(top: 20, left: 10)),
              Container(
                height: 250,
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: FutureBuilder<dynamic>(
                  future: futureItems,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.results.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data!.results[index];
                          return SizedBox(
                            width: 180,
                            height: 24,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: const Color(0XFF284C6A),
                              child: Column(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                      child: Image.network(
                                        item.image,
                                        width: double.infinity,
                                        height: 177,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Erreur de chargement');
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
