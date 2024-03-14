import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: SingleChildScrollView(
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
                height: MediaQuery.of(context).size.height - 230,
                padding: const EdgeInsets.only(left: 10, top: 10),
                color: const Color(0XFF15232E),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 3.75,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          color: const Color(0XFF1E3243),
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 25,
                                left: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://www.superherodb.com/pictures2/portraits/10/100/10060.jpg',
                                    width: MediaQuery.of(context).size.width / 3,
                                    height: MediaQuery.of(context).size.height / 5,
                                    alignment: Alignment.topCenter,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                  width: 60,
                                  height: 40,
                                  alignment: Alignment.center,
                                  margin:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color(0XFFFF8100),
                                  ),
                                  child: Text(
                                    '#${index + 1}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: GoogleFonts.nunito().fontFamily,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),

                              Positioned(
                                top: 30,
                                left: MediaQuery.of(context).size.width / 2.4,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.85,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 1.85,
                                        height: 52,
                                        child: Text(
                                          'Batman',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: GoogleFonts.nunito().fontFamily,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      const Padding(padding: EdgeInsets.only(top: 10)),
                                      Text(
                                        'DC Comics',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: GoogleFonts.nunito().fontFamily,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      const Padding(padding: EdgeInsets.only(top: 20)),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/SVG/ic_books_bicolor.svg',
                                            width: 16,
                                            colorFilter:
                                            const ColorFilter.mode(Color(0xFF69727D), BlendMode.srcIn),
                                          ),
                                          const Padding(padding: EdgeInsets.only(left: 5)),
                                          Text(
                                            'N°16',
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
                                            'Mai 1970',
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
                              )
                            ],
                          )
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
