import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ComicDetail extends StatefulWidget {
  const ComicDetail({super.key});

  @override
  State<ComicDetail> createState() => _ComicDetailState();
}

class _ComicDetailState extends State<ComicDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              width: 300,
              height: 164,
              color: Colors.purpleAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                      Text(
                        'Agents of SHIELD',
                        style: TextStyle(
                          fontFamily: GoogleFonts.nunito().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
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
                                    'Marvel',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: GoogleFonts.nunito().fontFamily,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(top: 15)),
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
                                    '136 épisode',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: GoogleFonts.nunito().fontFamily,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(top: 15)),
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
                                    '2013',
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 164 - 50,
            decoration: const  BoxDecoration(
              color: Color(0XFF1E3243),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Text('   Comic Detail Page !',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
    );
  }
}

