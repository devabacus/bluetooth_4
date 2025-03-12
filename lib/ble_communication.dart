import 'package:bluetooth_4/ble_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleUuids {
  static const String serviceUuid = "6e400001-b5a3-f393-e0a9-e50e24dcca9e";
  static const String txChar = "6e400002-b5a3-f393-e0a9-e50e24dcca9e";
  static const String rxChar = "6e400003-b5a3-f393-e0a9-e50e24dcca9e";
}

class CommunicationPage extends StatefulWidget {
  final BluetoothDevice device;
  const CommunicationPage({super.key, required this.device});

  @override
  State<CommunicationPage> createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {
  final _controller = TextEditingController();
  var rxMsg = "";
  BluetoothService? service;
  BluetoothCharacteristic? tx;
  BluetoothCharacteristic? rx;

  @override
  void initState() {
    getChars();
    super.initState();
  }

  Future<void> getChars() async {
    final services = await widget.device.discoverServices();
    service =
        services
            .where((service) => service.uuid.toString() == BleUuids.serviceUuid)
            .first;
    final chars = service!.characteristics;
    for (var _char in chars) {
      if (_char.uuid.toString() == BleUuids.txChar) tx = _char;
      if (_char.uuid.toString() == BleUuids.rxChar) rx = _char;
    }
    rx!.setNotifyValue(true);

    rx!.onValueReceived.listen((msg) {
      setState(() {
        rxMsg = String.fromCharCodes(msg);
      });
    });
  }

  Future<void> sendToTx(String msg) async {
    if (service == null) return;
    tx!.write(msg.codeUnits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Communication")),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            children: [
              Text(rxMsg, style: tStyle),
              SizedBox(height: 30),
              TextField(controller: _controller),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => sendToTx(_controller.text.trim()),
                child: Text("Отправить"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
