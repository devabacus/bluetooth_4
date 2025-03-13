import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'riverpod.g.dart';

@riverpod
class DeviceRemoteId extends _$DeviceRemoteId {
  @override
  String? build() {
    return "DA:20:24:1F:C3:01";
  }

  Future<void> getIdFromDB() async {
    final pref = await SharedPreferences.getInstance();
    final remoteId = pref.getString("remoteId");
    state = remoteId;
  }

  Future<void> setId(String remoteId) async {
    final pref = await SharedPreferences.getInstance();
    final success = await pref.setString("remoteId", remoteId);
    if (success) {
      state = remoteId;
    }
  }
}

@riverpod
FutureOr<BluetoothDevice?> device(Ref ref) {
  final remoteId = ref.watch(deviceRemoteIdProvider);
  if (remoteId == null) return null;
  return BluetoothDevice.fromId(remoteId);
}

@riverpod
FutureOr<BluetoothDevice?> connectDevice(Ref ref) async {
  ref.watch(connectionStateProvider);
  final deviceValue = ref.watch(deviceProvider);
  return deviceValue.when(
    data: (device) async {
      if (device == null) return null;
      try {
        await device.connect();
        return device;
      } catch (e) {
        print("Ошибка подключения");
        rethrow;
      }
    },
    error: (e, st) => throw e,
    loading: () => null,
  );
}

@riverpod
Stream<BluetoothConnectionState> connectionState(Ref ref) {
  final deviceValue = ref.watch(deviceProvider);
  
  Stream<BluetoothConnectionState> disconnect = Stream.value(
    BluetoothConnectionState.disconnected,
  );

  return deviceValue.when(
    data: (device) {
      if (device == null) return disconnect;
      return device.connectionState;
    } ,
    error: (_, __) => disconnect,
    loading: () => disconnect,
  );
}
     