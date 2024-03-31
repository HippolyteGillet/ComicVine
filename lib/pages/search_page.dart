import 'package:comic_vine/pages/comic_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../comicvine_blocs.dart';
import '../comicvine_events.dart';
import '../comicvine_state.dart';
import 'character_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchBloc(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4.5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                    color: Color(0xFF223141),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text(
                              'Recherche',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontFamily: GoogleFonts.nunito().fontFamily,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.15,
                          child: Builder(
                            builder: (newContext) {
                              return TextField(
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Comic, film, série...',
                                  hintStyle: TextStyle(
                                    color: const Color(0x50FFFFFF),
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  suffixIcon: Container(
                                    padding: const EdgeInsets.all(15),
                                    child: SvgPicture.asset(
                                      'assets/SVG/navbar_search.svg',
                                      colorFilter: const ColorFilter.mode(
                                          Color(0x50FFFFFF), BlendMode.srcIn),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFF15232E),
                                ),
                                onSubmitted: (value) {
                                  if (value.isNotEmpty) {
                                    BlocProvider.of<SearchBloc>(newContext)
                                        .add(SearchRequested(value));
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, state) {
                          if (state is SearchLoadInProgress) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 3),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0XFF1E3243),
                                    ),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.5,
                                            top: -160,
                                            child: SvgPicture.asset(
                                              'assets/SVG/astronaut.svg',
                                              width: 160,
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 35),
                                          child: Text(
                                            'Recherche en cours.\nMerci de patienter...',
                                            style: TextStyle(
                                              color: const Color(0xFF1F9FFF),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: GoogleFonts.nunito()
                                                  .fontFamily,
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            );
                          } else if (state is SearchLoadSuccess) {
                            if (state.searchIssueResults.isEmpty &&
                                state.searchCharacterResults.isEmpty) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4),
                                  Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0XFF1E3243),
                                      ),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30, top: 38),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.9,
                                              child: RichText(
                                                text: TextSpan(
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF1F9FFF),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily:
                                                        GoogleFonts.nunito()
                                                            .fontFamily,
                                                  ),
                                                  children: const [
                                                    TextSpan(
                                                      text:
                                                          'Aucun résultat',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700 // en gras
                                                          ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          ' trouvé pour votre recherche.',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              right: 10,
                                              top: -30,
                                              child: SvgPicture.asset(
                                                'assets/SVG/astronaut.svg',
                                                width: 80,
                                              )),
                                        ],
                                      ))
                                ],
                              );
                            }
                            else {
                              return Transform.translate(
                                offset: const Offset(10, 0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.41,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0XFF1E3243),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 22, left: 20, right: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.03,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.03,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color: const Color(
                                                            0XFFFF8100),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      'Comics',
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.32,
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 15),
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: state.searchIssueResults.length,
                                              itemBuilder: (context, index) {
                                                final item = state
                                                    .searchIssueResults[index];
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ComicDetail(
                                                                item.apiUrl),
                                                      ),
                                                    );
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.47,
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      color: const Color(
                                                          0XFF284C6A),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                Image.network(
                                                              item.image,
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.22,
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.07,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              '${item.name} #${item.issueNumber}${item.issueName != '' ? ' - ${item.issueName}' : ''}',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontFamily: GoogleFonts
                                                                        .nunito()
                                                                    .fontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.41,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0XFF1E3243),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 22, left: 20, right: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.03,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.03,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color: const Color(
                                                            0XFFFF8100),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      'Personnages',
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.32,
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 15),
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: state
                                                  .searchCharacterResults
                                                  .length,
                                              itemBuilder: (context, index) {
                                                final item = state
                                                        .searchCharacterResults[
                                                    index];
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            CharacterDetail(
                                                          character: item,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.47,
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      color: const Color(
                                                          0XFF284C6A),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                Image.network(
                                                              item.image,
                                                              width: double
                                                                  .infinity,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.22,
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.07,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              item.name,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontFamily: GoogleFonts
                                                                        .nunito()
                                                                    .fontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              );
                            }
                          } else if (state is SearchLoadFailure) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  iconSize: 50,
                                  color: const Color(0xFF1F9FFF),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Une erreur est survenue lors de la recherche.',
                                  style: TextStyle(
                                    color: const Color(0xFF1F9FFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: GoogleFonts.nunito().fontFamily,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                IconButton(
                                  icon: const Icon(Icons.refresh),
                                  iconSize: 50,
                                  color: const Color(0xFF1F9FFF),
                                  onPressed: () {
                                    BlocProvider.of<SearchBloc>(context)
                                        .add(SearchRequested(''));
                                  },
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
                            );
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 4),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0XFF1E3243),
                                    ),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, top: 35),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.9,
                                            child: RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF1F9FFF),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily:
                                                      GoogleFonts.nunito()
                                                          .fontFamily,
                                                ),
                                                children: const [
                                                  TextSpan(
                                                    text:
                                                        'Saisissez une recherche pour trouver un ',
                                                  ),
                                                  TextSpan(
                                                    text: 'comics, film, série',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .w700 // en gras
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: ' ou ',
                                                  ),
                                                  TextSpan(
                                                    text: 'personnage.',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .w700 // en gras
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            right: 10,
                                            top: -30,
                                            child: SvgPicture.asset(
                                              'assets/SVG/astronaut.svg',
                                              width: 80,
                                            )),
                                      ],
                                    ))
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF15232E),
    );
  }
}
