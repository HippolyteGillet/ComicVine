import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../comicvine_blocs.dart';
import '../comicvine_events.dart';
import '../comicvine_state.dart';
import 'character_detail.dart';

class MovieDetail extends StatefulWidget {
  final String url;
  const MovieDetail(this.url, {super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: BlocProvider(
            create: (context) =>
                MoviesBloc()..add(MovieDetailRequested(widget.url)),
            child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state is MovieDetailLoadInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MovieDetailLoadSuccess) {
                  String date = state.movieDetail.releaseDate;
                  date = date.substring(0, 4);
                  return Column(
                    children: [
                      Stack(children: [
                        Image.network(
                          state.movieDetail.image,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.5,
                          fit: BoxFit.cover,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2.5,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3.2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 45),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.arrow_back_ios,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              100,
                                          child: Text(
                                            state.movieDetail.name,
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.nunito()
                                                  .fontFamily,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            state.movieDetail.image,
                                            width: 100,
                                            height: 130,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/SVG/ic_movie_bicolor.svg',
                                                      width: 16,
                                                      colorFilter:
                                                          const ColorFilter
                                                              .mode(
                                                              Colors.white,
                                                              BlendMode.srcIn),
                                                    ),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5)),
                                                    Text(
                                                      '${state.movieDetail.runtime} min',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily:
                                                            GoogleFonts.nunito()
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
                                                              Colors.white,
                                                              BlendMode.srcIn),
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
                                                            GoogleFonts.nunito()
                                                                .fontFamily,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: TabBar(
                                  tabs: const [
                                    Tab(text: 'Synopsis'),
                                    Tab(text: 'Personnages'),
                                    Tab(text: 'Infos'),
                                  ],
                                  dividerColor: Colors.transparent,
                                  indicatorWeight: 4,
                                  indicatorColor: Colors.orange,
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.grey,
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.62,
                              decoration: const BoxDecoration(
                                color: Color(0XFF1E3243),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: TabBarView(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.5,
                                    padding: const EdgeInsets.all(16),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          HtmlWidget(
                                            state.movieDetail.description,
                                            textStyle: TextStyle(
                                                fontFamily: GoogleFonts.nunito()
                                                    .fontFamily,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  BlocProvider(
                                    create: (context) => CharactersBloc()
                                      ..add(CharactersRequested(
                                          state.movieDetail.charactersUrls)),
                                    child: BlocBuilder<CharactersBloc,
                                        CharactersState>(
                                      builder: (context, state) {
                                        if (state is CharactersLoadInProgress) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (state
                                            is CharactersLoadSuccess) {
                                          return ListView.builder(
                                              itemCount:
                                                  state.characters.length,
                                              itemBuilder: (context, index) {
                                                final character =
                                                    state.characters[index];
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            CharacterDetail(
                                                          character: character,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            12,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 25)),
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(45),
                                                          child: Image.network(
                                                            character.image,
                                                            width: 45,
                                                            height: 45,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 20)),
                                                        Text(
                                                          character.name,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .nunito()
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        } else if (state
                                            is CharactersLoadFailure) {
                                          return Center(
                                            child: Text(
                                              'Failed to load Characters ${state.toString()}',
                                            ),
                                          );
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2,
                                              child: Text(
                                                'Classification',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20)),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2.5,
                                              child: Text(
                                                state.movieDetail.rating,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(top: 20)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2,
                                              child: Text(
                                                'Scénaristes',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20)),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2.5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  for (var writer in state
                                                      .movieDetail.writers)
                                                    Text(
                                                      writer,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontFamily:
                                                            GoogleFonts.nunito()
                                                                .fontFamily,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(top: 20)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2,
                                              child: Text(
                                                'Producteurs',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20)),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2.5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  for (var producer in state
                                                      .movieDetail.producers)
                                                    Text(
                                                      producer,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontFamily:
                                                            GoogleFonts.nunito()
                                                                .fontFamily,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(top: 20)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2,
                                              child: Text(
                                                'Studios',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20)),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2.5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  for (var studio in state
                                                      .movieDetail.studios)
                                                    Text(
                                                      studio,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontFamily:
                                                            GoogleFonts.nunito()
                                                                .fontFamily,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(top: 20)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2,
                                              child: Text(
                                                'Budget',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20)),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2.5,
                                              child: Text(
                                                formatPrice(state.movieDetail
                                                    .budget),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(top: 20)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2,
                                              child: Text(
                                                'Recettes au box-office',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20)),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2.5,
                                              child: Text(
                                                formatPrice(state.movieDetail
                                                    .boxOfficeRevenue),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(top: 20)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2,
                                              child: Text(
                                                'Recettes brutes totales',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20)),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 2.5,
                                              child: Text(
                                                formatPrice(state.movieDetail.totalRevenue),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ],
                  );
                } else if (state is MovieDetailLoadFailure) {
                  return Center(
                    child: Text(
                      'Failed to load Movie detail ${state.toString()}',
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          backgroundColor: const Color(0XFF1E3243),
        ));
  }
}

String formatPrice(String price) {
  int priceInt = int.parse(price);

  double formattedPrice = priceInt / 1000000;

  return "${formattedPrice.round()} millions \$";
}
