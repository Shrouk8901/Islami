import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_form1/sura_details.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_form2/sura_details2.dart';
import 'package:islami_app/ui/intro_screen.dart';
import 'package:islami_app/utiles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: IntroScreen.id,
      routes: {
        IntroScreen.id: (context) => const IntroScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        SuraDetails.id: (context) => SuraDetails(),
        SuraDetails2.id: (context) => SuraDetails2(),
      },
    );
  }
}
