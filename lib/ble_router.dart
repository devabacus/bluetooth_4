import 'package:bluetooth_4/ble_communication.dart';
import 'package:bluetooth_4/scan_page.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/material.dart';

const tStyle = TextStyle(fontSize: 20);

class BleRouter extends StatefulWidget {
  const BleRouter({super.key});

  @override
  State<BleRouter> createState() => _HomeState();
}

class _HomeState extends State<BleRouter> {
  BluetoothDevice? device;
  BluetoothConnectionState? connState;
  bool isConnection = true;

  Future<void> tryAutoConnect(String deviceId) async {
    connState = BluetoothConnectionState.disconnected;
    device = BluetoothDevice.fromId(deviceId);

    try {
      await device!.connect(timeout: Duration(seconds: 2));
      setState(() {
        isConnection = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isConnection = false;
      });
    }

    device!.connectionState.listen((state) {
      setState(() {
        connState = state;
      });
    });
  }

  @override
  void initState() {
    tryAutoConnect("DA:20:24:1F:C3:01");
    super.initState();
  }

  @override
  void dispose() {
    device?.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            isConnection
                ? CircularProgressIndicator()
                : connState == BluetoothConnectionState.disconnected
                ? ScanPage()
                : CommunicationPage(device: device!),
      ),
    );
  }
}
