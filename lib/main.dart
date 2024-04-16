import 'package:flutter/material.dart';

import 'items/customJoystickArea.dart';
import 'items/spritzer.dart';
import 'items/toolbar.dart';

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
            toolbarContainer(screenHeight),

            spritzerExpanded(screenHeight),
          ],
        ),
      ),
    );
  }
}
