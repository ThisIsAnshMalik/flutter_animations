import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedColorPalette extends StatefulWidget {
  const AnimatedColorPalette({super.key});

  @override
  State<AnimatedColorPalette> createState() => _AnimatedColorPaletteState();
}

class _AnimatedColorPaletteState extends State<AnimatedColorPalette> {
  List<Color> currentPalette = generateRandomPalette();
  double height = 0;
  double width = 0;

  static List<Color> generateRandomPalette() {
    final random = Random();
    return List.generate(
      5,
      (_) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ),
    );
  }

  void regeneratePalette() {
    setState(() {
      currentPalette = generateRandomPalette();
    });
    regenerateSizeS();
  }

  void regenerateSizeS() {
    setState(() {
      if (height == 100) {
        height = 0;
        width = 0;
      } else {
        height = 100;
        width = 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palette Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (Color color in currentPalette)
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInExpo,
                width: 80,
                height: 80,
                color: color,
                margin: const EdgeInsets.all(8),
              ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
              width: height,
              height: width,
              color: Colors.black,
            ),
            ElevatedButton(
              onPressed: regeneratePalette,
              child: const Text('Generate New Palette'),
            ),
          ],
        ),
      ),
    );
  }
}
