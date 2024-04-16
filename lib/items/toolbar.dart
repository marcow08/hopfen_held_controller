import 'package:flutter/material.dart';

Container toolbarContainer(double screenHeight) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(10), // Optional: Set border radius
    ),
    child: Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.upcoming),
              iconSize: screenHeight * 0.1,
              onPressed: () {
                print("Blaulicht");
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.campaign),
              iconSize: screenHeight * 0.1,
              onPressed: () {
                print("Hupe");
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.light_mode_rounded),
              iconSize: screenHeight * 0.1,
              onPressed: () {
                print("Licht");
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.1), // Spacer Widget hinzugefügt
        ],
      ),
    ),
  );
}