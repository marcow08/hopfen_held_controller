import 'package:flutter/material.dart';

import 'customSlider.dart';
import 'indicators.dart';

Expanded spritzerExpanded(double screenHeight) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Row(
            children: [
              const Expanded(child: CustomSlider()),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    print("Spritzer");
                  },
                  icon: const Icon(Icons.sports_bar_rounded),
                  iconSize: screenHeight * 0.15,
                ),
              )
            ],
          ),
        ),
        indicatorExpanded(screenHeight),
      ],
    ),
  );
}