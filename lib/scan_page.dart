import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  List<ScanResult> scanResults = [];

  Future<void> startScan() async {
    final scanSubscriber = FlutterBluePlus.onScanResults.listen((results) {
      setState(() {
        scanResults = results;
      });
    });

    await FlutterBluePlus.startScan(timeout: Duration(seconds: 10));
  }

  @override
  void initState() {
    startScan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ScanPage")),
      body: ListView.builder(
        itemCount: scanResults.length,
        itemBuilder: (context, index) {
          final device = scanResults[index].device;
          var deviceName = device.advName;
          if (deviceName.isEmpty) {
            deviceName = "Неизвестное устройство";
          }
          return ListTile(
            title: Text(deviceName.toString()),
            subtitle: Text(device.remoteId.toString()),
            trailing: Text(scanResults[index].rssi.toString()),
            onTap: () {},
          );
        },
      ),
    );
  }
}
