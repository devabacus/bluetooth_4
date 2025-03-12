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

  Future<void> tryAutoConnect(String deviceId) async {
    device = BluetoothDevice.fromId(deviceId);
    await device!.connect();
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
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.disabled_by_default),
            onPressed: () => device!.disconnect(),
          ),
          IconButton(
            icon: Icon(Icons.expand),
            onPressed: () => device!.connect(),
          ),

        ],
      ),
      body: Center(
        child: Text("$connState", style: tStyle),
      ),
    );
  }
}
