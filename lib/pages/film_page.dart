import 'package:comic_vine/comicvine_blocs.dart';
import 'package:comic_vine/comicvine_events.dart';
import 'package:comic_vine/comicvine_state.dart';
import 'package:comic_vine/pages/film_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class FilmPage extends StatefulWidget {
  const FilmPage({super.key});

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF15232E),
        body: BlocProvider(
            create: (context) => MoviesBloc()..add(MoviesRequested()),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 110,
                    child: Text('Films les plus populaires',
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
                      child: BlocBuilder<MoviesBloc, MoviesState>(
                          builder: (context, state) {
                        if (state is MoviesLoadInProgress) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is MoviesLoadSuccess) {
                          return ListView.builder(
                            itemCount: state.movies.length,
                            itemBuilder: (context, index) {
                              final movie = state.movies[index];
                              String date = movie.releaseDate;
                              date = date.substring(0, 4);
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MovieDetail(movie.apiUrl)));
                                },
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4.75,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      color: const Color(0XFF1E3243),
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 25,
                                            left: 20,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                movie.image,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    7,
                                                alignment: Alignment.topCenter,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 60,
                                            height: 40,
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.only(
                                                left: 10, top: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: const Color(0XFFFF8100),
                                            ),
                                            child: Text(
                                              '#${index + 1}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontFamily: GoogleFonts.nunito()
                                                    .fontFamily,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 25,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.4,
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.85,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.85,
                                                      height: 52,
                                                      child: Text(
                                                        movie.name,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontFamily:
                                                              GoogleFonts.nunito()
                                                                  .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    const Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 10)),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/SVG/ic_movie_bicolor.svg',
                                                          width: 16,
                                                          colorFilter:
                                                              const ColorFilter
                                                                  .mode(
                                                                  Color(
                                                                      0xFF69727D),
                                                                  BlendMode
                                                                      .srcIn),
                                                        ),
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5)),
                                                        Text(
                                                          '${movie.runtime} min',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .nunito()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 10)),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/SVG/ic_calendar_bicolor.svg',
                                                          width: 16,
                                                          colorFilter:
                                                              const ColorFilter
                                                                  .mode(
                                                                  Color(
                                                                      0xFF69727D),
                                                                  BlendMode
                                                                      .srcIn),
                                                        ),
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5)),
                                                        Text(
                                                          date,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .nunito()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ]),
                                            ),
                                          )
                                        ],
                                      )),
                                                                ),
                                );
                            },
                          );
                        } else if (state is MoviesLoadFailure) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Erreur de chargement',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.only(top: 10)),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<MoviesBloc>().add(MoviesRequested());
                                  },
                                  child: const Text('Réessayer'),
                                ),
                                const SizedBox(height: 20),
                                Text('Erreur : ${state.message}',
                                    style: TextStyle(
                                      color: const Color(0xFF1F9FFF),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: GoogleFonts.nunito().fontFamily,
                                    )),
                              ],
                            ),
                          );
                        }
                        return Container();
                      }))
                ],
              ),
            )));
  }
}
