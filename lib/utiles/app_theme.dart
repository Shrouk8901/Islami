import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.TransColor,
    // textTheme: TextTheme(
    //   headlineLarge: TextStyle(
    //     fontSize: 16,
    //     fontWeight: FontWeight.bold,
    //     color: AppColor.whiteColor,
    //   ),
    // ),
    textTheme: TextTheme(
      //  using Google Font here
      headlineLarge: GoogleFonts.cairo(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColor.whiteColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.BlackColor,
      titleTextStyle: TextStyle(
        color: AppColor.goldColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      ///changing the leading icon color
      iconTheme: IconThemeData(color: AppColor.goldColor),
    ),
  );
}
