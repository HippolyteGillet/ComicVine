import 'package:comic_vine/pages/comic_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../comicvine_blocs.dart';
import '../comicvine_events.dart';
import '../comicvine_state.dart';

class ComicsPage extends StatefulWidget {
  const ComicsPage({super.key});

  @override
  State<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF15232E),
        body: BlocProvider(
          create: (context) => ComicsBloc()..add(ComicsRequested()),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 110,
                  child: Text('Comics les plus populaires',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.nunito().fontFamily)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 10,
                  height: MediaQuery.of(context).size.height / 1.1,
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  color: const Color(0XFF15232E),
                  child: BlocBuilder<ComicsBloc, ComicsState>(
                    builder: (context, state) {
                      if (state is ComicsLoadInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ComicsLoadSuccess) {
                        return ListView.builder(
                          itemCount: state.comics.length,
                          itemBuilder: (context, index) {
                            final item = state.comics[index];
                            String date = item.coverDate;
                            DateTime dateTime = DateTime.parse(date);
                            date = DateFormat('MMMM yyyy')
                                .format(dateTime.toLocal());
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ComicDetail(item.apiUrl)));
                              },
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
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
                                            item.image,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4.8,
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
                                            fontFamily:
                                                GoogleFonts.nunito().fontFamily,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 30,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                2.4,
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.85,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.85,
                                                  height: 52,
                                                  child: Text(
                                                    //volume.name,
                                                    item.name,
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
                                                        top: 5)),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.85,
                                                  height: 30,
                                                  child: Text(
                                                    item.issueName,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontFamily:
                                                          GoogleFonts.nunito()
                                                              .fontFamily,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20)),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/SVG/ic_books_bicolor.svg',
                                                      width: 16,
                                                      colorFilter:
                                                          const ColorFilter
                                                              .mode(
                                                              Color(0xFF69727D),
                                                              BlendMode.srcIn),
                                                    ),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5)),
                                                    Text(
                                                      'N°${item.issueNumber}',
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
                                                              Color(0xFF69727D),
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
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state is ComicsLoadFailure) {
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
                                  context.read<ComicsBloc>().add(ComicsRequested());
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
                      return Container(); // État initial ou inattendu
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
