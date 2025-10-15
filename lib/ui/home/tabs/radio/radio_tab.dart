import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_item_card.dart';

import '../../../../utiles/app_color.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool isRadioSelected = true;
  int? playingIndex;

  List<String> radioNames = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-trabulsi",
    "Radio Addokali Mohammad Alalim"
  ];

  List<String> recitersNames = [
    "Ibrahim Al-Akdar",
    "Akram Alalaqmi",
    "Majed Al-Enezi",
    "Malik shaibat Alhamed"
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        children: [
          const Spacer(), // يخلي الزرين تحت
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isRadioSelected = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isRadioSelected
                            ? AppColor.goldColor
                            : Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Radio",
                        style: TextStyle(
                          color: isRadioSelected ? Colors.black : Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16), // padding بين الزرين
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isRadioSelected = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isRadioSelected
                            ? Colors.black.withOpacity(0.6)
                            : AppColor.goldColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Reciters",
                        style: TextStyle(
                          color: isRadioSelected ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // قائمة العناصر
          Expanded(
            flex: 4,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount:
                  isRadioSelected ? radioNames.length : recitersNames.length,
              itemBuilder: (context, index) {
                final name =
                    isRadioSelected ? radioNames[index] : recitersNames[index];
                final isPlaying = playingIndex == index;

                return RadioItemCard(
                  name: name,
                  isPlaying: isPlaying,
                  onPlayPause: () {
                    setState(() {
                      playingIndex = playingIndex == index ? null : index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
