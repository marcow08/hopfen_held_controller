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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.yellow.shade900.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(225, 158, 4, 1.0),
            Color.fromRGBO(235, 168, 14, 1.0),
          ],
        ),
      ),
    );
  }
}