import 'package:flutter/material.dart';

import '../../../../../utiles/app_color.dart';

class SuraContentItem extends StatelessWidget {
  final String SuraContent;
  final int index;
  final bool isSelected;

  const SuraContentItem({
    super.key,
    required this.SuraContent,
    required this.index,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColor.goldColor : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.goldColor),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenHeight * 0.02),
        child: Text(
          "$SuraContent [${index + 1}]",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.045,
            color: isSelected ? AppColor.BlackColor : AppColor.whiteColor,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
