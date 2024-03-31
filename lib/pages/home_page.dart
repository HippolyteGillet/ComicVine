import 'package:comic_vine/pages/comic_detail.dart';
import 'package:comic_vine/pages/film_detail.dart';
import 'package:comic_vine/pages/serie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../comicvine_state.dart';
import '../comicvine_blocs.dart';
import '../comicvine_events.dart';


class HomePage extends StatefulWidget {
  final void Function(int) onNavigate;
  const HomePage({Key? key, required this.onNavigate}) : super(key: key);

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
                    buildSectionBoxSeries(),
                    const SizedBox(height: 30),
                    buildSectionBoxComics(),
                    const SizedBox(height: 30),
                    buildSectionBoxMovies(),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget buildSectionBoxSeries(){
    return Transform.translate(
        offset: const Offset(10, 20),
        child: BlocProvider(
          create: (context) => SeriesBloc()..add(HomeSeriesRequested()),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.41,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0XFF1E3243),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.03,
                            height: MediaQuery.of(context).size.width * 0.03,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0XFFFF8100),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Séries populaires',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: GoogleFonts.nunito().fontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          widget.onNavigate(2);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0XFF0F1921),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Voir plus',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: GoogleFonts.nunito().fontFamily,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.32,
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: BlocBuilder<SeriesBloc, SeriesState>(
                    builder: (context, state){
                      if (state is SeriesLoadInProgress) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SeriesLoadSuccess) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.series.length,
                          itemBuilder: (context, index) {
                            final item = state.series[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SerieDetail(item.apiUrl),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.47,
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
                                          height: MediaQuery.of(context).size.height * 0.22,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: MediaQuery.of(context).size.height * 0.07,
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
                              ),
                            );
                          },
                        );
                      } else if (state is SeriesLoadFailure) {
                        return Column(
                          children: [
                            Text(
                                'Erreur de chargement',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.w700,
                                )),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<SeriesBloc>(context).add(HomeSeriesRequested());
                              },
                              child: const Text('Réessayer'),
                            ),
                            const SizedBox(height: 10),
                            Text('Erreur: ${state.message}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: GoogleFonts.nunito().fontFamily,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  )
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildSectionBoxComics(){
    return Transform.translate(
        offset: const Offset(10, 20),
        child: BlocProvider(
          create: (context) => ComicsBloc()..add(HomeComicsRequested()),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.41,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0XFF1E3243),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.03,
                            height: MediaQuery.of(context).size.width * 0.03,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0XFFFF8100),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Comics populaires',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: GoogleFonts.nunito().fontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          widget.onNavigate(1);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0XFF0F1921),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Voir plus',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: GoogleFonts.nunito().fontFamily,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: BlocBuilder<ComicsBloc, ComicsState>(
                      builder: (context, state){
                        if (state is ComicsLoadInProgress) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is ComicsLoadSuccess) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.comics.length,
                            itemBuilder: (context, index) {
                              final item = state.comics[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ComicDetail(item.apiUrl),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.47,
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
                                            height: MediaQuery.of(context).size.height * 0.22,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context).size.height * 0.07,
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
                                ),
                              );
                            },
                          );
                        } else if (state is ComicsLoadFailure) {
                          return Column(
                            children: [
                              Text(
                                  'Erreur de chargement',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                    fontWeight: FontWeight.w700,
                                  )),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<ComicsBloc>(context).add(HomeComicsRequested());
                                },
                                child: const Text('Réessayer'),
                              ),
                              const SizedBox(height: 10),
                              Text('Erreur: ${state.message}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    )
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildSectionBoxMovies(){
    return Transform.translate(
        offset: const Offset(10, 20),
        child: BlocProvider(
          create: (context) => MoviesBloc()..add(HomeMoviesRequested()),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.41,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0XFF1E3243),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.03,
                            height: MediaQuery.of(context).size.width * 0.03,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0XFFFF8100),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Films populaires',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: GoogleFonts.nunito().fontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          widget.onNavigate(3);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0XFF0F1921),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Voir plus',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: GoogleFonts.nunito().fontFamily,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: BlocBuilder<MoviesBloc, MoviesState>(
                      builder: (context, state){
                        if (state is MoviesLoadInProgress) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is MoviesLoadSuccess) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.movies.length,
                            itemBuilder: (context, index) {
                              final item = state.movies[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetail(item.apiUrl),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.47,
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
                                            height: MediaQuery.of(context).size.height * 0.22,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context).size.height * 0.07,
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
                                ),
                              );
                            },
                          );
                        } else if (state is MoviesLoadFailure) {
                          return Column(
                            children: [
                              Text(
                                  'Erreur de chargement',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                    fontWeight: FontWeight.w700,
                                  )),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<MoviesBloc>(context).add(HomeMoviesRequested());
                                },
                                child: const Text('Réessayer'),
                              ),
                              const SizedBox(height: 10),
                              Text('Erreur: ${state.message}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    )
                ),
              ],
            ),
          ),
        ));
  }
}
