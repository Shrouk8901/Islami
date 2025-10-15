// import 'package:flutter/material.dart';
// import 'package:islami_app/ui/home/tabs/quran/sura_item.dart';
//
// import '../../../../utiles/app_color.dart';
//
// class QuranTab extends StatelessWidget {
//   const QuranTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     ///width=430,height=932 --->screen width and hight in the ui
//     ///screenWidth=20/430=0.05,screenHeight=192/932=0.2
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: screenWidth * 0.05,
//         vertical: screenHeight * 0.2,
//       ),
//       child: Column(
//         ///replacement of using the 2 widgets (Align and padding)
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextField(
//             cursorColor: AppColor.goldColor,
//             style: Theme.of(context).textTheme.headlineLarge,
//             decoration: InputDecoration(
//               hintText: 'Sura Name',
//               hintStyle: Theme.of(context).textTheme.headlineLarge,
//               prefixIcon: ImageIcon(AssetImage("assets/images/quran_icon.png"),
//                   color: AppColor.goldColor),
//               border: OutlineInputBorder(),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColor.goldColor),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColor.goldColor),
//               ),
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.02),
//           Text(
//             "Most Recently",
//             style: Theme.of(context).textTheme.headlineLarge,
//           ),
//           SizedBox(height: screenHeight * 0.01),
//
//           ///**ListView inside column --> use expanded or container with specific height
//           ///or using sizedBox with specific height*///
//           SizedBox(
//             ///***why controlling the height of the continer using the sized box
//             ///not the countainer itself (i tried it gives me pixels overflow)??***//
//             height: screenHeight * 0.18, // 150/935
//             width: double.infinity,
//             child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: AppColor.goldColor,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: screenWidth * 0.05,
//                         //vertical: screenHeight * 0.01,
//                       ),
//                       child: Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Al-Anbiya",
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColor.BlackColor,
//                                 ),
//                               ),
//                               SizedBox(height: screenHeight * 0.01),
//                               Text(
//                                 "الأنبياء",
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColor.BlackColor,
//                                 ),
//                               ),
//                               SizedBox(height: screenHeight * 0.01),
//                               Text(
//                                 "112 Verses ",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColor.BlackColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Image.asset("assets/images/mostRecently_photo.png"),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return SizedBox(width: screenWidth * .02);
//                 },
//                 itemCount: 10),
//           ),
//           SizedBox(height: screenHeight * 0.02),
//           Text(
//             "Suras List",
//             style: Theme.of(context).textTheme.headlineLarge,
//           ),
//           SizedBox(height: screenHeight * 0.02),
//           Expanded(
//             child: ListView.separated(
//               itemBuilder: (context, index) {
//                 return SuraItem();
//               },
//               separatorBuilder: (context, index) {
//                 return SizedBox(height: screenHeight * 0.02);
//               },
//               itemCount: 114,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_form2/sura_details2.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_item.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_recent_widget.dart';

import '../../../../utiles/app_color.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  late String newText;

  @override
  Widget build(BuildContext context) {
    ///width=430,height=932 --->screen width and hight in the ui
    ///screenWidth=20/430=0.05,screenHeight=192/932=0.2
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.2), // بدل padding.vertical
          TextField(
            onChanged: (newText) {
              return searchByNewText(newText);
            },
            cursorColor: AppColor.goldColor,
            style: Theme.of(context).textTheme.headlineLarge,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: Theme.of(context).textTheme.headlineLarge,
              prefixIcon: ImageIcon(
                AssetImage("assets/images/quran_icon.png"),
                color: AppColor.goldColor,
              ),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.goldColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.goldColor),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            "Most Recently",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: screenHeight * 0.01),
          SizedBox(
            height: screenHeight * 0.18,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SuraRecentWidget();
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: screenWidth * .02);
              },
              itemCount: 10,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            "Suras List",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: screenHeight * 0.02),
          //  أهم حاجة: Expanded هنا عشان تاخد باقي المساحة بدون overflow
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo:navigate to sura_details screen
                    Navigator.of(context).pushNamed(SuraDetails2.id,
                        arguments: filterList[index]);

                    ///رقم السوره ف اللسته بتاعت السور///
                  },
                  child: SuraItem(
                    index: filterList[index],

                    ///رقم السوره ف اللسته بتاعت السور///
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.white,
                  thickness: 1,
                  indent: screenWidth * 0.01, //space from right
                  endIndent: screenWidth * 0.01, //space from left
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchByNewText(String newText) {
    List<int> filterSearchList = [];
    for (int i = 0; i < QuranResources.englishQuranSurasList.length; i++) {
      if (QuranResources.englishQuranSurasList[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        filterSearchList.add(i);
        filterList = filterSearchList;
      }
      if (QuranResources.arabicQuranSurasList[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        filterSearchList.add(i);
        filterList = filterSearchList;
      }
    }
    filterList = filterSearchList;
    setState(() {});
  }
}
