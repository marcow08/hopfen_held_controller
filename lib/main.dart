import 'package:flutter/material.dart';

import 'items/customJoystickArea.dart';
import 'items/customSlider.dart';

void main() {
  runApp(const HopfenHeldApp());
}

class HopfenHeldApp extends StatelessWidget {
  const HopfenHeldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Hopfen Held'),
          backgroundColor: Colors.white,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {
                print("foooooooobaaaaaaaaaa");
              },
              child: const Row(
                children: [
                  Text('Bluetooth'),
                  Icon(Icons.bluetooth),
                ],
              ),
            ),
          ],
        ),
        body: const BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  const BodyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    const CustomJoystickArea joystick = CustomJoystickArea();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 168, 14, 1.0),
      body: SafeArea(
        child: Row(
          children: [
            const Expanded(
              child: joystick,
            ),
            Expanded(
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: CustomSlider()),
                        Expanded(child: Icon(Icons.sports_bar_rounded, size: screenHeight * 0.15))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.chevron_left, size: screenHeight * 0.1),
                        Icon(Icons.warning, size: screenHeight * 0.1),
                        Icon(Icons.chevron_right, size: screenHeight * 0.1)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
