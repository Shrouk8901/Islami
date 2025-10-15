import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTabScreen extends StatefulWidget {
  SebhaTabScreen({
    super.key,
  });

  @override
  State<SebhaTabScreen> createState() => _SebhaTabScreenState();
}

class _SebhaTabScreenState extends State<SebhaTabScreen> {
  int counter = 0;

  double angle = 0.0;

  int index = 0;

  final List<String> tasbihat = [
    'سبحان الله',
    'الله أكبر',
    'لا حول ولا قوة إلا بالله ',
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: screenHeight * .15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * .1,
                ),
              ],
            ),
            Image.asset(
              "assets/images/sebha_tail.png",
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                  onTap: onClicked,
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      "assets/images/sebha_body.png",
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * .7,
                  child: Column(
                    children: [
                      Text(
                        tasbihat[index],
                        style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "$counter",
                        style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onClicked() {
    counter++;
    angle += 20;
    if (counter % 30 == 0) {
      index = (index + 1) % tasbihat.length;
      /***
       if(index==tasbihat.length){index=0;}
       */
      angle = 0.0;
    }
    setState(() {});
  }
}
