import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSlider();
}

class _CustomSlider extends State<CustomSlider> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 168, 14, 1.0),
      body: Center(
        child: SfSlider.vertical(
          activeColor: Colors.grey.shade800,
          value: _value,
          onChanged: (dynamic newValue){
            setState(() {
              _value = newValue;
            });
          },
        ),
      ),
    );
  }
}