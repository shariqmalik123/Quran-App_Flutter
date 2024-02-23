import 'package:al_quran_app_flutter/widgets/surah_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '../widgets/para_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FaIcon(
                FontAwesomeIcons.bars,
                size: 30,
                color: Color.fromARGB(255, 157, 155, 167),
              ),
              Text('Quran App',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              FaIcon(FontAwesomeIcons.search,
                  color: Color.fromARGB(255, 157, 155, 167))
            ],
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScaffold) => [
                    SliverToBoxAdapter(
                      child: _upperpart(),
                    ),
                    const SliverAppBar(
                        pinned: true,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        backgroundColor: Color.fromARGB(0, 154, 207, 10),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(0),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TabBar(
                                indicatorColor: Color(0XFFA44AFF),
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorWeight: 3,
                                unselectedLabelColor: Color(0xFFA19CC5),
                                labelColor: Colors.white,
                                dividerColor:
                                    Color.fromARGB(164, 135, 137, 163),
                                dividerHeight: 3,
                                tabs: [
                                  Tab(
                                    child: Text('Surah',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Regular.ttf',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Tab(
                                    child: Text('Para',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Regular.ttf',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  )
                                ]),
                          ),
                        )),
                  ],
              body: TabBarView(children: [SurahTab(), ParaTab()])),
        ));
  }

  Column _upperpart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: Column(
            children: [
              Text(
                'Assalamualaikum',
                style: GoogleFonts.poppins(
                  color: Color(0xFFA19CC5),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              Text('Shariq Malik',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Container(
                  width: 400,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [
                            0,
                            0.6,
                            1
                          ],
                          colors: [
                            Color(0XFFDF98FA),
                            Color(0xFFB070FD),
                            Color(0xFF9055FF)
                          ])),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image(image: AssetImage("assets/quran1.png"))),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bookOpen,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Last Read',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Al-Fatiah',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Ayah No: 1',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
