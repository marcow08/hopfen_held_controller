import 'package:flutter/material.dart';

import '../utils/bluetooth.dart';

Container toolbarContainer(double screenHeight) {
  InputHandler inputHandler = InputHandler();

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
              icon: const Icon(Icons.auto_awesome),
              iconSize: screenHeight * 0.1,
              onPressed: () {
                debugPrint("Autopilot");
                if (inputHandler.getAutopilotState() == 1) {
                  inputHandler.setAutopilotState(0);
                } else {
                  inputHandler.setAutopilotState(1);
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}
