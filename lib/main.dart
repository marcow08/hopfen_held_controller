import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

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
        appBar: buildAppBar(),
        body: const BodyLayout(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
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

Future<void> connectAndSendCommands() async {
  // Initialize Bluetooth
  FlutterBlue flutterBlue = FlutterBlue.instance;
  // Start scanning for devices
  flutterBlue.startScan(timeout: const Duration(seconds: 4));

  // Connect to ESP32
  BluetoothDevice? esp32;
  flutterBlue.scanResults.listen((results) {
    for (ScanResult result in results) {
      if (result.device.name == 'ESP32') {
        esp32 = result.device;
        break;
      }
    }
    if (esp32 != null) {
      // Stop scanning
      flutterBlue.stopScan();
      // Connect to ESP32
      esp32!.connect();
      // Discover services and characteristics
      discoverServices(esp32!);
    }
  });
}

Future<void> discoverServices(BluetoothDevice esp32) async {
  var services = [];
  services = await esp32.discoverServices();
  for (BluetoothService service in services) {
    for (BluetoothCharacteristic characteristic in service.characteristics) {
// Check if the characteristic supports write
      if (characteristic.properties.write) {
// Write your JSON data to the characteristic
        _sendCommands(characteristic);
        return;
      }
    }
  }
}

void _sendCommands(BluetoothCharacteristic characteristic) {
// Send commands at 50ms interval
  Timer.periodic(const Duration(milliseconds: 50), (timer) {
// Send JSON commands here
    characteristic.write([...]); // Replace [...] with your JSON data bytes
  });
}

