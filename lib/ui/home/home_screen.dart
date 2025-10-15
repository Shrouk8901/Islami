import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebha/sebha_tab_screen.dart';

import '../../utiles/app_assets.dart';
import '../../utiles/app_color.dart';
import 'tabs/quran/quran_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTabScreen(),
    RadioTab(),
    Center(child: Text("Time", style: TextStyle(color: Colors.white))),
  ];

  final List<String> tabBackgrounds = [
    AppAssets.bg_quran,
    AppAssets.bg_hadeth,
    AppAssets.bg_sebha,
    AppAssets.bg_radio,
    AppAssets.bg_time,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          tabBackgrounds[selectedIndex],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        if (selectedIndex != 0)
          Container(
            color: Colors.black.withOpacity(0.7),
            width: double.infinity,
            height: double.infinity,
          ),
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              AppAssets.bg_logo,
              height: 100,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: tabs[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColor.goldColor,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedFontSize: 12,
            items: [
              buildNavItem(AppAssets.quran, 'Quran', 0),
              buildNavItem(AppAssets.ahdeth, 'Hadith', 1),
              buildNavItem(AppAssets.tasbeih, 'Tasbeih', 2),
              buildNavItem(AppAssets.radio, 'Radio', 3),
              buildNavItem(AppAssets.time, 'Time', 4),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildNavItem(
      String iconPath, String label, int index) {
    bool isSelected = index == selectedIndex;
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.2),
                border: Border.all(color: Colors.white, width: 2),
              )
            : null,
        padding: const EdgeInsets.all(6),
        child: ImageIcon(
          AssetImage(iconPath),
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
