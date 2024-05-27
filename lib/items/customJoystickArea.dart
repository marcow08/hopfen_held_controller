import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

import '../main.dart';
import '../utils/bluetooth.dart';
import 'customJoystick.dart';

const step = 10.0;
const ballSize = 20.0;

class CustomJoystickArea extends StatefulWidget {
  final InputHandler inputHandler; // Add InputHandler field

  const CustomJoystickArea({super.key, required this.inputHandler});

  @override
  State<CustomJoystickArea> createState() => _CustomJoystickAreaState();
}

class _CustomJoystickAreaState extends State<CustomJoystickArea> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 168, 14, 1.0),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: const Color.fromRGBO(235, 168, 14, 1.0),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: Joystick(
                stick: const CustomJoystickStick(),
                base: const JoystickSquareBase(),
                stickOffsetCalculator: const RectangleStickOffsetCalculator(),
                listener: (details) {
                  widget.inputHandler.setJoystickData(details.x, details.y);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}