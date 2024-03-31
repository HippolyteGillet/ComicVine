import 'dart:ui';

import 'package:comic_vine/pages/character_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
                  final charactersUrls = state.serieDetail.charactersUrls;
                  final episodesUrls = state.serieDetail.episodesUrls;
                  return Column(
                    children: [
                      Stack(children: [
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
                                            state.serieDetail.name,
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
                                            state.serieDetail.image,
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
                                                      'assets/SVG/ic_publisher_bicolor.svg',
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
                                                      state.serieDetail
                                                          .publisher,
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
                                                        top: 15)),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/SVG/ic_tv_bicolor.svg',
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
                                                      '${state.serieDetail.countOfEpisodes} épisodes',
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
                                                        top: 15)),
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
                                                      //date,
                                                      state.serieDetail
                                                          .startYear,
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
                                    padding: const EdgeInsets.all(16),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: HtmlWidget(
                                        state.serieDetail.description,
                                        textStyle: TextStyle(
                                            fontFamily:
                                                GoogleFonts.nunito().fontFamily,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  BlocProvider(
                                    create: (context) => CharactersBloc()
                                      ..add(CharactersRequested(
                                          state.serieDetail.charactersUrls)),
                                    child: BlocBuilder<CharactersBloc,
                                        CharactersState>(
                                      builder: (context, state) {
                                        if (state is CharactersLoadInProgress) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (state
                                            is CharactersLoadSuccess) {
                                          return Column(
                                            children: state.characters
                                                .map((character) {
                                              return InkWell(
                                                onTap: () {
                                                  debugPrint(
                                                      'Character tapped ${character.name}');
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
                                            }).toList(),
                                          );
                                        } else if (state
                                            is CharactersLoadFailure) {
                                          return Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Failed to load Characters',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: GoogleFonts
                                                        .nunito()
                                                        .fontFamily,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    BlocProvider.of<CharactersBloc>(
                                                            context)
                                                        .add(CharactersRequested(charactersUrls));
                                                  },
                                                  child: const Text('Réessayer'),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10)),
                                                Text('Erreur: ${state.message}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: GoogleFonts
                                                          .nunito()
                                                          .fontFamily,
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                              ],
                                            ),
                                          );
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                  BlocProvider(
                                    create: (context) => EpisodesBloc()
                                      ..add(EpisodesRequested(
                                          state.serieDetail.episodesUrls)),
                                    child: BlocBuilder<EpisodesBloc,
                                        EpisodesState>(
                                      builder: (context, state) {
                                        if (state is EpisodesLoadInProgress) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (state
                                            is EpisodesLoadSuccess) {
                                          return ListView.builder(
                                              itemCount: state.episodes.length,
                                              itemBuilder: (context, index) {
                                                final episode =
                                                    state.episodes[index];
                                                String date = episode.airDate;
                                                DateTime dateTime = DateTime.parse(date);
                                                date = DateFormat('dd MMMM yyyy').format(dateTime.toLocal());
                                                return SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5.5,
                                                  child: Card(
                                                    margin:
                                                        const EdgeInsets.only(
                                                      left: 16,
                                                      right: 16,
                                                      bottom: 16,
                                                    ),
                                                    color:
                                                        const Color(0XFF284C6A),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15)),
                                                        ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.circular(10),
                                                          child: Image.network(
                                                            episode.image,
                                                            width: MediaQuery.of(context).size.width / 2.8,
                                                            height: MediaQuery.of(context).size.height / 7.5,
                                                            alignment: Alignment.topCenter,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        const Padding(padding: EdgeInsets.only(left: 20)),
                                                        SizedBox(
                                                          width: MediaQuery.of(context).size.width / 2.2,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                "Episode #${episode.episodeNumber}",
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 17,
                                                                  fontFamily:
                                                                  GoogleFonts
                                                                      .nunito()
                                                                      .fontFamily,
                                                                  fontWeight: FontWeight.w600,
                                                                ),
                                                              ),
                                                              Text(
                                                                episode.name,
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      GoogleFonts
                                                                              .nunito()
                                                                          .fontFamily,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontStyle: FontStyle.italic,
                                                                ),
                                                              ),
                                                              const Padding(padding: EdgeInsets.only(top: 20)),
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
                                                                    episode.airDate == '' ? 'Unknown' : date,
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
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        } else if (state
                                            is EpisodesLoadFailure) {
                                          return Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Failed to load Episodes',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: GoogleFonts
                                                        .nunito()
                                                        .fontFamily,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    BlocProvider.of<EpisodesBloc>(
                                                            context)
                                                        .add(EpisodesRequested(episodesUrls));
                                                  },
                                                  child: const Text('Réessayer'),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10)),
                                                Text('Erreur: ${state.message}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: GoogleFonts
                                                          .nunito()
                                                          .fontFamily,
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                              ],
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
                        )
                      ]),
                    ],
                  );
                } else if (state is SerieDetailLoadFailure) {
                  return Center(
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          'Failed to load Serie',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: GoogleFonts.nunito().fontFamily,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<SeriesBloc>(context)
                                .add(SerieDetailRequested(widget.url));
                          },
                          child: const Text('Réessayer'),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Text('Erreur: ${state.message}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: GoogleFonts.nunito().fontFamily,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
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
