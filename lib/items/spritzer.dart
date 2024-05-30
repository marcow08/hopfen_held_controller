import 'package:flutter/material.dart';

import '../utils/bluetooth.dart';
import 'customSlider.dart';
import 'indicators.dart';

Expanded spritzerExpanded(double screenHeight) {
  InputHandler inputHandler = InputHandler();
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
                    if (inputHandler.waterPumpState == 0) {
                      inputHandler.setWaterPumpState(1);
                    } else {
                      inputHandler.setWaterPumpState(0);
                    }
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