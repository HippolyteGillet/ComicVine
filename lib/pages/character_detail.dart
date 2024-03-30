import 'dart:ui';

import 'package:comic_vine/comicvine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

class CharacterDetail extends StatefulWidget {
  final CharactersItem character;
  const CharacterDetail({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(children: [
          Stack(children: [
            Image.network(
              widget.character.image,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
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
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text(
                                widget.character.name,
                                style: TextStyle(
                                  fontFamily: GoogleFonts.nunito().fontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            )
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
                  height: MediaQuery.of(context).size.height / 1.23,
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
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height / 1.5,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: HtmlWidget(
                            widget.character.description,
                            textStyle: TextStyle(
                                fontFamily: GoogleFonts.nunito().fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Text(
                                      'Nom de super-héros',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                    child: Text(
                                      widget.character.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Text(
                                      'Nom réel',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                    child: Text(
                                      widget.character.realName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Text(
                                      'Alias',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                    child: Text(
                                      widget.character.aliases,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Text(
                                      'Créateurs',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (var creator
                                            in widget.character.creators)
                                          Text(
                                            creator,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: GoogleFonts.nunito()
                                                  .fontFamily,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Text(
                                      'Genre',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                    child: Text(
                                      getGender(widget.character.gender),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Text(
                                      'Date de naissance',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 20)),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                    child: Text(
                                      widget.character.birth,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily:
                                            GoogleFonts.nunito().fontFamily,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ]),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

String getGender(int gender) {
  switch (gender) {
    case 1:
      return 'Homme';
    case 2:
      return 'Femme';
    default:
      return 'Inconnu';
  }
}