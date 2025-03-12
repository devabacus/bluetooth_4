import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BluetoothDevice? device;

  Future<void> tryAutoConnect(String deviceId) async {
    device = BluetoothDevice.fromId(deviceId);
    await device!.connect();
    // print("device connected");
    device!.connectionState.listen((state) {
      print(state.toString());
    });
  }

  @override
  void initState() {
    tryAutoConnect("DA:20:24:1F:C3:01");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My App"),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                device!.connect();
              },
              child: Text("Подключиться"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                device!.disconnect();
              },
              child: Text("Отключиться"),
            ),
          ],
        ),
      ),
    );
  }
}
