import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../comicvine_blocs.dart';
import '../comicvine_events.dart';
import '../comicvine_state.dart';

class SerieDetail extends StatefulWidget {
  final String url;
  const SerieDetail(this.url, {super.key});

  @override
  State<SerieDetail> createState() => _SerieDetailState();
}

class _SerieDetailState extends State<SerieDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: BlocProvider(
            create: (context) =>
            SeriesBloc()..add(SerieDetailRequested(widget.url)),
            child: BlocBuilder<SeriesBloc, SeriesState>(
              builder: (context, state) {
                if (state is SerieDetailLoadInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SerieDetailLoadSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(clipBehavior: Clip.none, children: [
                        Image.network(
                          state.serieDetail.image,
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 45),
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
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      child: Text(
                                        state.serieDetail.name,
                                        style: TextStyle(
                                          fontFamily:
                                          GoogleFonts.nunito().fontFamily,
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
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        state.serieDetail.image,
                                        width: 100,
                                        height: 130,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/SVG/ic_publisher_bicolor.svg',
                                                  width: 16,
                                                  colorFilter:
                                                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                                ),
                                                const Padding(padding: EdgeInsets.only(left: 5)),
                                                Text(
                                                  state.serieDetail.publisher,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                                padding:
                                                EdgeInsets.only(top: 15)),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/SVG/ic_tv_bicolor.svg',
                                                  width: 16,
                                                  colorFilter:
                                                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                                ),
                                                const Padding(padding: EdgeInsets.only(left: 5)),
                                                Text(
                                                  '${state.serieDetail.countOfEpisodes} épisodes',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                                padding:
                                                EdgeInsets.only(top: 15)),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/SVG/ic_calendar_bicolor.svg',
                                                  width: 16,
                                                  colorFilter:
                                                  const ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.srcIn),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Text(
                                                  //date,
                                                  state.serieDetail.startYear,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                    GoogleFonts.nunito()
                                                        .fontFamily,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 37,
                          left: 0,
                          right: 0,
                          child: Material(
                            color: Colors.transparent,
                            child: TabBar(
                                tabs: const [
                                  Tab(text: 'Histoire'),
                                  Tab(text: 'Personnages'),
                                  Tab(text: 'Episodes'),
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
                        ),
                        Positioned(
                          top: 300,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                MediaQuery.of(context).size.height / 1.5,
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
                                        height: MediaQuery.of(context).size.height / 1.5,
                                        padding: const EdgeInsets.all(16),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: [
                                                HtmlWidget(
                                                  state.serieDetail.description,
                                                  textStyle: TextStyle(
                                                      fontFamily:
                                                      GoogleFonts.nunito().fontFamily,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 17,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),

                                      ),
                                      BlocProvider(
                                        create: (context) =>
                                            CharactersBloc()..add(CharactersRequested(state.serieDetail.charactersUrls)),
                                        child: BlocBuilder<CharactersBloc, CharactersState>(
                                          builder: (context, state) {
                                            if (state is CharactersLoadInProgress) {
                                              return const Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            } else if (state is CharactersLoadSuccess) {
                                              return ListView.builder(
                                                  itemCount: state.characters.length,
                                                  itemBuilder: (context, index) {
                                                    final character =
                                                    state.characters[index];
                                                    return Container(
                                                      transform:
                                                      Matrix4.translationValues(
                                                          0, -20, 0),
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                          12,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: 25)),
                                                          ClipRRect(
                                                            borderRadius:
                                                            BorderRadius.circular(45),
                                                            child: Image.network(
                                                              character.image,
                                                              width: 45,
                                                              height: 45,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          const Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: 20)),
                                                          Text(
                                                            character.name,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 16,
                                                              fontFamily:
                                                              GoogleFonts.nunito()
                                                                  .fontFamily,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            } else if (state is CharactersLoadFailure) {
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
                                      BlocProvider(
                                        create: (context) =>
                                        EpisodesBloc()..add(EpisodesRequested(state.serieDetail.episodesUrls)),
                                        child: BlocBuilder<EpisodesBloc, EpisodesState>(
                                          builder: (context, state) {
                                            if (state is EpisodesLoadInProgress) {
                                              return const Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            } else if (state is EpisodesLoadSuccess) {
                                              return ListView.builder(
                                                  itemCount: state.episodes.length,
                                                  itemBuilder: (context, index) {
                                                    final episode = state.episodes[index];
                                                    return Container(
                                                      transform:
                                                      Matrix4.translationValues(
                                                          0, -20, 0),
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                      height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                          12,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: 25)),
                                                          ClipRRect(
                                                            borderRadius:
                                                            BorderRadius.circular(45),
                                                            child: Image.network(
                                                              episode.image,
                                                              width: 45,
                                                              height: 45,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          const Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: 20)),
                                                          Text(
                                                            episode.name,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 16,
                                                              fontFamily:
                                                              GoogleFonts.nunito()
                                                                  .fontFamily,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            } else if (state is EpisodesLoadFailure) {
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
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  );
                } else if (state is SerieDetailLoadFailure) {
                  return Center(
                    child: Text(
                      'Failed to load Serie detail ${state.toString()}',
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ));
  }
}
