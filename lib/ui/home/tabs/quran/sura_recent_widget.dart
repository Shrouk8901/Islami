import 'package:flutter/material.dart';

import '../../../../utiles/app_color.dart';

class SuraRecentWidget extends StatelessWidget {
  const SuraRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.goldColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Al-Anbiya",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.BlackColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "الأنبياء",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.BlackColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "112 Verses ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.BlackColor,
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/mostRecently_photo.png"),
          ],
        ),
      ),
    );
    ;
  }
}
