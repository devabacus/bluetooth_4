import 'package:bluetooth_4/ble_communication.dart';
import 'package:bluetooth_4/riverpod/riverpod.dart';
import 'package:bluetooth_4/scan_page.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const tStyle = TextStyle(fontSize: 20);

class BleRouter extends ConsumerStatefulWidget {
  const BleRouter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BleRouterState();
}

class _BleRouterState extends ConsumerState<BleRouter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final connectedDevice = ref.watch(connectDeviceProvider);
    final connectionState = ref.watch(connectionStateProvider);
    return Scaffold(body: Center(
      child: connectionState.when(
          data: (state) => Text(state.toString(), style: tStyle,),
          error: (_, __) => Text("Error"),
          loading: () => CircularProgressIndicator(),
      ),
    ),);
  }
}
