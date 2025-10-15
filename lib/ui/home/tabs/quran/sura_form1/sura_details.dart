///صفحه القران نفسه///

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_form1/sura_content_item.dart';
import 'package:islami_app/utiles/app_assets.dart';
import 'package:islami_app/utiles/app_color.dart';

class SuraDetails extends StatefulWidget {
  static const String id = "sura_details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraLines = [];
  int selectedIndex = -1; // مفيش آية محددة في البداية

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    int index = ModalRoute.of(context)?.settings.arguments as int;

    if (suraLines.isEmpty) loadFile(index);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSurasList[index],
          style: TextStyle(color: AppColor.goldColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              AppAssets.bg_details,
              fit: BoxFit.fill,
            ),
          ),

          // المحتوى الرئيسي
          suraLines.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColor.goldColor,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.04,
                  ),
                  child: Column(
                    children: [
                      // اسم السورة بالعربي
                      Text(
                        QuranResources.arabicQuranSurasList[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.goldColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.06,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      // قائمة الآيات
                      Expanded(
                        child: ListView.builder(
                          itemCount: suraLines.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.01,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = i;
                                  });
                                },
                                child: SuraContentItem(
                                  SuraContent: suraLines[i],
                                  index: i,
                                  isSelected: selectedIndex == i,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString("assets/files/${index + 1}.txt");

    List<String> lines = fileContent.trim().split('\n');

    setState(() {
      suraLines = lines;
    });
  }
}
