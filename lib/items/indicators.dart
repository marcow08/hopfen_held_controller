import 'package:flutter/material.dart';
import 'package:hopfen_held/utils/bluetooth.dart';

Expanded indicatorExpanded(double screenHeight) {
  InputHandler inputHandler = InputHandler();
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            if (inputHandler.getIndicatorState() == 1) {
              inputHandler.setIndicatorState(0);
            } else {
                inputHandler.setIndicatorState(1);
            }
          },
          icon: const Icon(Icons.chevron_left),
          iconSize: screenHeight * 0.1,
        ),
        IconButton(
          onPressed: () {
            if (inputHandler.getIndicatorState() == 3) {
              inputHandler.setIndicatorState(0);
            } else {
              inputHandler.setIndicatorState(3);
            }
          },
          icon: const Icon(Icons.warning),
          iconSize: screenHeight * 0.1,
        ),
        IconButton(
          onPressed: () {
            if (inputHandler.getIndicatorState() == 2) {
              inputHandler.setIndicatorState(0);
            } else {
              inputHandler.setIndicatorState(2);
            }
          },
          icon: const Icon(Icons.chevron_right),
          iconSize: screenHeight * 0.1,
        )
      ],
    ),
  );
}