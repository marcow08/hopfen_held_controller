import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'items/customJoystickArea.dart';
import 'items/spritzer.dart';
import 'items/toolbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(const HopfenHeldApp());
  });
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
            connectAndSendCommands();
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
  FlutterBluetoothSerial flutterBluetoothSerial = FlutterBluetoothSerial.instance;
  // Start scanning for devices
  flutterBluetoothSerial.startDiscovery().listen((r) {
    BluetoothDiscoveryResult result = r;
    print(result.device.name);
    if (result.device.name == 'ESP32') {
      // Connect to ESP32
      BluetoothConnection.toAddress(result.device.address).then((connection) {
        print('connected!');
        _sendCommands(connection);
      });
    }
  });
}

void _sendCommands(BluetoothConnection connection) {
  Timer.periodic(const Duration(milliseconds: 100), (timer) {
    // Send JSON commands here
    print("naise"); // Replace [...] with your JSON data bytes
    connection.output.add(utf8.encode("naise\n")); // Sending data
  });
}
