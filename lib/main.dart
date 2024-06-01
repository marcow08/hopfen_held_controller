import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:hopfen_held/utils/bluetooth.dart';

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

class HopfenHeldApp extends StatefulWidget {
  const HopfenHeldApp({Key? key}) : super(key: key);

  @override
  _HopfenHeldAppState createState() => _HopfenHeldAppState();
}

class _HopfenHeldAppState extends State<HopfenHeldApp> {
  String bluetoothStatus = 'Connect';
  BluetoothConnection? bluetoothConnection;
  InputHandler inputHandler = InputHandler();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: BodyLayout(inputHandler: inputHandler,),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("HopfenHeld"),
      backgroundColor: Colors.white,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {
            if (bluetoothConnection != null &&
                bluetoothConnection!.isConnected) {
              disconnect();
            } else {
              connectAndSendCommands(inputHandler);
            }
          },
          child: Row(
            children: [
              Text(bluetoothStatus),
              const Icon(Icons.bluetooth),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> connectAndSendCommands(InputHandler inputHandler) async {
    setState(() {
      bluetoothStatus = 'Connecting';
    });
    // Initialize Bluetooth
    FlutterBluetoothSerial flutterBluetoothSerial =
        FlutterBluetoothSerial.instance;
    // Start scanning for devices
    flutterBluetoothSerial.startDiscovery().listen((r) {
      BluetoothDiscoveryResult result = r;
      print(result.device.name);
      if (result.device.name == 'ESP32') {
        // Connect to ESP32
        BluetoothConnection.toAddress(result.device.address)
            .then((connection) {
          print('Connected!');
          setState(() {
            bluetoothStatus = 'Connected!';
          });
          _startSendingCommands(connection, inputHandler);
        }).catchError((error) {
          print('Failed to connect: $error');
          setState(() {
            bluetoothStatus = 'Connect';
          });
        });
      }
    });
  }

  void _startSendingCommands(BluetoothConnection connection, InputHandler inputHandler) {
    bluetoothConnection = connection;
    bool canSend = true;

    connection.input?.listen((Uint8List data) {
      String response = utf8.decode(data);
      if (response.trim() == 'OK') {
        canSend = true;
      }
    }, onDone: () {
      print('Connection closed!');
      setState(() {
        bluetoothStatus = 'Connect';
      });
    }, onError: (error) {
      print('Error: $error');
      setState(() {
        bluetoothStatus = 'Connect';
      });
    });

    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (canSend) {
        canSend = false;
        Map data = {
          'xValue': inputHandler.getJoystickData()[0],
          'yValue': inputHandler.getJoystickData()[1]
        };
        connection.output.add(utf8.encode(''
            '${inputHandler.getJoystickData()[0]};'
            '${inputHandler.getJoystickData()[1]};'
            '${inputHandler.getLadderPosition()};'
            '${inputHandler.getWaterPumpState()};'
            '${inputHandler.getIndicatorState()};'
            '${inputHandler.getLightState()};'
            '${inputHandler.getAutopilotState()}'
            '\n'
        ));
      }
    });
  }

  void disconnect() {
    if (bluetoothConnection != null && bluetoothConnection!.isConnected) {
      bluetoothConnection!.dispose();
      bluetoothConnection = null;
      setState(() {
        bluetoothStatus = 'Connect';
      });
    }
  }
}


class BodyLayout extends StatelessWidget {
  final InputHandler inputHandler;

  const BodyLayout({Key? key, required this.inputHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    CustomJoystickArea joystick = CustomJoystickArea(inputHandler: inputHandler); // Übergabe der Instanz von InputHandler
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 168, 14, 1.0),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
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
