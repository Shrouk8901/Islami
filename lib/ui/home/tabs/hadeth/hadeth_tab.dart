import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'hadeeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.04,
        right: screenWidth * 0.04,
        bottom: screenHeight * 0.04,
      ),
      child: Column(
        children: [
          const Spacer(), // This pushes the Carousel to the bottom
          CarouselSlider(
            options: CarouselOptions(
              height: screenHeight * 0.65,
              viewportFraction: 0.85,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: false,
            ),
            items: List.generate(50, (index) => index + 1).map((index) {
              return SizedBox(
                width: screenWidth * 0.95,
                child: HadeethItem(index: index),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
