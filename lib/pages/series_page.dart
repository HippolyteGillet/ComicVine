import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../comicvine_model.dart';
import '../comicvine_request.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF15232E),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                height: 110,
                child: Text('Séries les plus populaires',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.nunito().fontFamily)),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 10,
                height: MediaQuery.of(context).size.height - 230,
                padding: const EdgeInsets.only(left: 10, top: 10),
                color: const Color(0XFF15232E),
                child: FutureBuilder<SeriesResponse>(
                  future: NetworkRequest().loadListSeries(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.results.length,
                        itemBuilder: (context, index) {
                          final serie = snapshot.data!.results[index];
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 4.25,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                color: const Color(0XFF1E3243),
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 25,
                                      left: 20,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          serie.image,
                                          width: MediaQuery.of(context).size.width / 3,
                                          height: MediaQuery.of(context).size.height / 6,
                                          alignment: Alignment.topCenter,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 60,
                                      height: 40,
                                      alignment: Alignment.center,
                                      margin:
                                      const EdgeInsets.only(left: 10, top: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: const Color(0XFFFF8100),
                                      ),
                                      child: Text(
                                        '#${index + 1}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontFamily: GoogleFonts.nunito().fontFamily,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 25,
                                      left: MediaQuery.of(context).size.width / 2.4,
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width / 1.85,
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:[
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width / 1.85,
                                                height: 52,
                                                child: Text(
                                                  serie.name,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              const Padding(padding: EdgeInsets.only(top: 10)),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/SVG/ic_publisher_bicolor.svg',
                                                    width: 16,
                                                    colorFilter:
                                                    const ColorFilter.mode(Color(0xFF69727D), BlendMode.srcIn),
                                                  ),
                                                  const Padding(padding: EdgeInsets.only(left: 5)),
                                                  Text(
                                                    serie.publisher,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: GoogleFonts.nunito().fontFamily,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Padding(padding: EdgeInsets.only(top: 10)),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/SVG/ic_tv_bicolor.svg',
                                                    width: 16,
                                                    colorFilter:
                                                    const ColorFilter.mode(Color(0xFF69727D), BlendMode.srcIn),
                                                  ),
                                                  const Padding(padding: EdgeInsets.only(left: 5)),
                                                  Text(
                                                    '${serie.countOfEpisodes} épisodes',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: GoogleFonts.nunito().fontFamily,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Padding(padding: EdgeInsets.only(top: 10)),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/SVG/ic_calendar_bicolor.svg',
                                                    width: 16,
                                                    colorFilter:
                                                    const ColorFilter.mode(Color(0xFF69727D), BlendMode.srcIn),
                                                  ),
                                                  const Padding(padding: EdgeInsets.only(left: 5)),
                                                  Text(
                                                    serie.startYear,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: GoogleFonts.nunito().fontFamily,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ]
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            ),
                          );
                        },
                      );
                    }
                    else if (snapshot.hasError) {
                      return const Text('Erreur de chargement');
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                )
              )
            ],
          ),
        ));
  }
}
