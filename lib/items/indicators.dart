import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Expanded indicatorExpanded(double screenHeight) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            print("Blinker links");
          },
          icon: const Icon(Icons.chevron_left),
          iconSize: screenHeight * 0.1,
        ),
        IconButton(
          onPressed: () {
            print("Warnblinker");
          },
          icon: const Icon(Icons.warning),
          iconSize: screenHeight * 0.1,
        ),
        IconButton(
          onPressed: () {
            print("Blinker rechts");
          },
          icon: const Icon(Icons.chevron_right),
          iconSize: screenHeight * 0.1,
        )
      ],
    ),
  );
}