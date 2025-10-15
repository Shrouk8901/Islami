import 'package:flutter/material.dart';

import '../../../../utiles/app_color.dart';

class RadioItemCard extends StatelessWidget {
  final String name;
  final bool isPlaying;
  final VoidCallback onPlayPause;

  const RadioItemCard({
    super.key,
    required this.name,
    required this.isPlaying,
    required this.onPlayPause,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundAsset = isPlaying
        ? 'assets/images/radio_background_on.png'
        : 'assets/images/radio_background_off.png';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColor.goldColor,
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(backgroundAsset),
          alignment: Alignment.bottomCenter,
          // fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                color: Colors.black,
                onPressed: onPlayPause,
              ),
              const SizedBox(width: 20),
              Icon(
                isPlaying ? Icons.volume_up : Icons.volume_off,
                color: Colors.black,
              )
            ],
          )
        ],
      ),
    );
  }
}
