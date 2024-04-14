import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'items/CustomJoystickArea.dart';
import 'items/costumSlider.dart';

void main() {
  runApp(const HopfenHeldApp());
}

const ballSize = 20.0;
const step = 10.0;

class HopfenHeldApp extends StatelessWidget {
  const HopfenHeldApp({Key? key}) : super(key: key);

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
  const BodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(235, 168, 14, 1.0),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: CustomJoystickArea(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Icon(Icons.upcoming, size: 40),
                  ),
                  Expanded(
                    child: Icon(Icons.campaign, size: 40),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.light_mode_rounded,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 50), // Spacer Widget hinzugefügt
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
                          Expanded(child: Icon(Icons.sports_bar_rounded, size: 50))
                        ],
                      )
                  ),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.chevron_left, size: 50),
                      Icon(Icons.warning, size: 50),
                      Icon(Icons.chevron_right, size: 50)
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
