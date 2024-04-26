import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

import 'customJoystick.dart';

const step = 10.0;
const ballSize = 20.0;

class CustomJoystickArea extends StatefulWidget {
  const CustomJoystickArea({super.key});

  @override
  State<CustomJoystickArea> createState() => _CustomJoystickAreaState();
}

class _CustomJoystickAreaState extends State<CustomJoystickArea> {
  double _x = 100;
  double _y = 100;

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
            Ball(_x, _y),
            Align(
              alignment: const Alignment(0, 0),
              child: Joystick(
                stick: const CustomJoystickStick(),
                listener: (details) {
                  setState(() {
                    _x = _x + step * details.x;
                    _y = _y + step * details.y;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ball extends StatelessWidget {
  final double x;
  final double y;

  const Ball(this.x, this.y, {super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: ballSize,
        height: ballSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.redAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ],
        ),
      ),
    );
  }
}