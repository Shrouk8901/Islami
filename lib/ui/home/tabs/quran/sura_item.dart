import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';

import '../../../../utiles/app_color.dart';

class SuraItem extends StatelessWidget {
  int index;

  SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Stack(alignment: Alignment.center, children: [
          Image.asset("assets/images/sura_vector.png"),
          Text("${index + 1}",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColor.whiteColor,
              )),
        ]),
        SizedBox(width: screenWidth * .05),
        Column(
          children: [
            Text(
              "${QuranResources.englishQuranSurasList[index]}",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 20,
                  ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "${QuranResources.AyaNumberList[index]} verses",
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // SizedBox(width: screenWidth * .3),
        Spacer(),
        Text(
          "${QuranResources.arabicQuranSurasList[index]}",
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 20),
        )
      ],
    );
  }
}
