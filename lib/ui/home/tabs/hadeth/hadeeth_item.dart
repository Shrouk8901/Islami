import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../model/hadeeth.dart';

class HadeethItem extends StatefulWidget {
  final int index;

  const HadeethItem({super.key, required this.index});

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  Hadeeth? hadeeth;

  @override
  void initState() {
    super.initState();
    loadHadeethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: AssetImage('assets/images/Hadith Card.png'),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: hadeeth == null
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: screenWidth * 0.01,
              ),
            )
          : Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.04,
                      horizontal: screenWidth * 0.01,
                    ),
                    child: Text(
                      hadeeth!.title,
                      style: TextStyle(
                        color: Colors.black, // تم التعديل هنا
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //SizedBox(height: screenHeight * 0.01),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeeth!.content,
                        style: TextStyle(
                          color: Colors.black, // تم التعديل هنا
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> loadHadeethFile(int index) async {
    try {
      String fileContent =
          await rootBundle.loadString('assets/files/hadeeth/h$index.txt');
      final fileLinesindex = fileContent.indexOf('\n');
      final title = fileContent.substring(0, fileLinesindex);
      final content = fileContent.substring(fileLinesindex + 1);

      setState(() {
        hadeeth = Hadeeth(title: title, content: content);
      });
    } catch (e) {
      debugPrint('Error loading hadith file: $e');
    }
  }
}
