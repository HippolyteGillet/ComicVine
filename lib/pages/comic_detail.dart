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

class ComicDetail extends StatefulWidget {
  final String url;
  const ComicDetail(this.url, {super.key});

  @override
  State<ComicDetail> createState() => _ComicDetailState();
}

class _ComicDetailState extends State<ComicDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: BlocProvider(
            create: (context) =>
                ComicsBloc()..add(ComicDetailRequested(widget.url)),
            child: BlocBuilder<ComicsBloc, ComicsState>(
              builder: (context, state) {
                if (state is ComicDetailLoadInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ComicDetailLoadSuccess) {
                  String date = state.comic.coverDate;
                  DateTime dateTime = DateTime.parse(date);
                  date = DateFormat('MMMM yyyy').format(dateTime.toLocal());
                  debugPrint('Comic Detail: ${state.comic.name}');
                  return Column(
                    children: [
                      Stack(children: [
                        Image.network(
                          state.comic.image,
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
                                            state.comic.name,
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
                                            state.comic.image,
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
                                                Text(
                                                  state.comic.issueName,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: GoogleFonts.nunito()
                                                        .fontFamily,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 15)),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/SVG/ic_books_bicolor.svg',
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
                                                      'N°${state.comic.issueNumber}',
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
                                                      date,
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
                            Material(
                              color: Colors.transparent,
                              child: TabBar(
                                  tabs: const [
                                    Tab(text: 'Histoire'),
                                    Tab(text: 'Auteurs'),
                                    Tab(text: 'Personnages'),
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
                              height:
                              MediaQuery.of(context).size.height / 1.62,
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
                                      child: HtmlWidget(
                                        state.comic.description,
                                        textStyle: TextStyle(
                                            fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                      itemCount: state.personDetails.length,
                                      itemBuilder: (context, index) {
                                        final person =
                                        state.personDetails[index];
                                        final role =
                                            state.personCredit[index].role;
                                        return SizedBox(
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
                                                  person.image,
                                                  width: 45,
                                                  height: 45,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20)),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    person.name,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(
                                                    role,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  ListView.builder(
                                      itemCount: state.characterCredit.length,
                                      itemBuilder: (context, index) {
                                        final character =
                                        state.characterCredit[index];
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                       CharacterDetail(character: character,)));
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
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ],
                  );
                } else if (state is ComicDetailLoadFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          iconSize: 50,
                          color: const Color(0xFF1F9FFF),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'Impossible de charger les détails du comic',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: GoogleFonts.nunito().fontFamily,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ComicsBloc>(context)
                                .add(ComicDetailRequested(widget.url));
                          },
                          child: const Text('Réessayer'),
                        ),
                        Text(
                          'Erreur : ${state.message}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: GoogleFonts.nunito().fontFamily,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          backgroundColor: const Color(0XFF1E3243),
        )
    );
  }
}
