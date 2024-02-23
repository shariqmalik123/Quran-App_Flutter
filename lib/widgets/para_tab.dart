import 'package:al_quran_app_flutter/colors.dart';
import 'package:al_quran_app_flutter/screens/api_service.dart';
import 'package:al_quran_app_flutter/screens/model_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParaTab extends StatefulWidget {
  const ParaTab({super.key});

  @override
  State<ParaTab> createState() => _ParaTabState();
}

class _ParaTabState extends State<ParaTab> {
  Future<GetSampApi> getSurah() async {
    NetworkHelper networkHelper =
        NetworkHelper('https://api.alquran.cloud/v1/surah');
    var surahJsonData = await networkHelper.getData();
    GetSampApi surahModel = GetSampApi.fromJson(surahJsonData);
    print(surahModel);
    return surahModel;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSurah(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);

            final surahModel = snapshot.data;
            print(surahModel);

            return ListView.builder(
              itemCount: surahModel!.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Stack(
                        children: [
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/icon.png'))),
                          ),
                          Positioned.fill(
                              child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ))
                        ],
                      ),
                      title: Text(
                        surahModel.data![index].englishName!,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              surahModel.data![index].revelationType!
                                  .toUpperCase(),
                              style: GoogleFonts.poppins(
                                color: subtitlecolor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            surahModel.data![index].numberOfAyahs!.toString(),
                            style: GoogleFonts.poppins(
                              color: subtitlecolor,
                              fontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'verses'.toUpperCase(),
                              style: GoogleFonts.poppins(
                                color: subtitlecolor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: Text(
                        surahModel.data![index].name!,
                        style: GoogleFonts.poppins(
                          color: Color(0XFFA44AFF),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                );
              },
            );
          }
          if (snapshot.hasError) {
            return Text('Error');
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Loading',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.white,
                  )),
              SizedBox(width: 20),
              CircularProgressIndicator(
                color: Colors.white12,
              ),
            ],
          );
        });
  }
}
