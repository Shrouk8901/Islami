import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utiles/app_assets.dart';
import 'package:islami_app/utiles/app_color.dart';

class SuraDetails2 extends StatefulWidget {
  static const String id = "sura_details2";

  @override
  State<SuraDetails2> createState() => _SuraDetails2State();
}

class _SuraDetails2State extends State<SuraDetails2> {
  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    int index = ModalRoute.of(context)?.settings.arguments as int;

    if (suraContent.isEmpty) loadFile(index);

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
          suraContent.isEmpty
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
                          fontSize: screenWidth * 0.08,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      // عرض الآيات كلها كنص واحد داخل ListView (سريع جدًا)
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Text(
                              suraContent,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                color: AppColor.whiteColor,
                                height: 2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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

    // أضيفي رقم الآية داخل النص
    for (int i = 0; i < lines.length; i++) {
      lines[i] += " [${i + 1}]";
    }

    setState(() {
      suraContent = lines.join(" ");
    });
  }
}
