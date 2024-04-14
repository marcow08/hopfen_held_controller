import 'package:flutter/material.dart';

class CustomJoystickStick extends StatelessWidget {
  final double size;

  const CustomJoystickStick({
    this.size = 50,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(92, 71, 26, 0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(150, 104, 5, 1.0),
            Color.fromRGBO(194, 133, 2, 1.0),
          ],
        ),
      ),
    );
  }
}