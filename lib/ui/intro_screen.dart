import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home/home_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String id = 'intro_screen';

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: Colors.black,
          pages: [
            buildPageViewModel(
              screenHeight: screenHeight,
              image: 'assets/images/intro_1.png',
              subImage: "assets/images/background_logo2.png",
              title: "Welcome To Islami App.",
            ),
            buildPageViewModel(
              screenHeight: screenHeight,
              image: 'assets/images/intro_2.png',
              subImage: "assets/images/background_logo2.png",
              title: "Welcome To Islami",
              subtitle: "We Are Very Excited To Have You In Our Community",
            ),
            buildPageViewModel(
              screenHeight: screenHeight,
              image: 'assets/images/intro_3.png',
              subImage: "assets/images/background_logo2.png",
              title: "Reading the Quran",
              subtitle: "Read, and your Lord is the Most Generous",
            ),
            buildPageViewModel(
              screenHeight: screenHeight,
              image: 'assets/images/intro_4.png',
              subImage: "assets/images/background_logo2.png",
              title: "Bearish",
              subtitle: "Praise the name of your Lord, the Most High",
            ),
            buildPageViewModel(
              screenHeight: screenHeight,
              image: 'assets/images/intro_5.png',
              subImage: "assets/images/background_logo2.png",
              title: "Holy Quran Radio",
              subtitle: "Listen to Quran Radio easily through the app",
            ),
          ],
          onDone: () {
            Navigator.pushReplacementNamed(context, HomeScreen.id);
          },
          showSkipButton: true,
          skip: const Text("Skip",
              style: TextStyle(fontSize: 16, color: Color(0xffE2BE7F))),
          next: const Text("Next",
              style: TextStyle(fontSize: 16, color: Color(0xffE2BE7F))),
          done: const Text("Done",
              style: TextStyle(fontSize: 16, color: Color(0xffE2BE7F))),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Colors.grey,
            activeSize: Size(22.0, 10.0),
            activeColor: Color(0xffE2BE7F),
            spacing: EdgeInsets.symmetric(horizontal: 4),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator:
              const BoxDecoration(color: Colors.transparent),
        ),
      ),
    );
  }

  PageViewModel buildPageViewModel({
    required double screenHeight,
    required String subImage,
    required String image,
    required String title,
    String? subtitle,
  }) {
    return PageViewModel(
      decoration:
          const PageDecoration(fullScreen: true, pageColor: Colors.transparent),
      title: '',
      body: '',
      image: Column(
        children: [
          SizedBox(height: 5),
          Image.asset(subImage, height: screenHeight * 0.15),
          SizedBox(height: screenHeight * 0.12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Image.asset(image,
                fit: BoxFit.contain, height: screenHeight * 0.35),
          ),
          SizedBox(height: screenHeight * 0.08),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE2BE7F)),
            ),
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Color(0xffE2BE7F)),
              ),
            ),
        ],
      ),
    );
  }
}
