import 'package:flutter/material.dart';

import '../../../../../utiles/app_color.dart';

class SuraContentItem2 extends StatelessWidget {
  final String SuraContent;

  final bool isSelected;

  const SuraContentItem2({
    super.key,
    required this.SuraContent,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.02),
      child: Text(
        "$SuraContent",
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: screenWidth * 0.045,
          color: isSelected ? AppColor.BlackColor : AppColor.whiteColor,
          height: 1.6,
        ),
      ),
    );
  }
}
