// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceHash() => r'2e2c531fc69cfd61fbd074879022233b371c0019';

/// See also [device].
@ProviderFor(device)
final deviceProvider = AutoDisposeFutureProvider<BluetoothDevice?>.internal(
  device,
  name: r'deviceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deviceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeviceRef = AutoDisposeFutureProviderRef<BluetoothDevice?>;
String _$connectDeviceHash() => r'a002f004550c3bbed736e9e7c0d74e474e9b77bf';

/// See also [connectDevice].
@ProviderFor(connectDevice)
final connectDeviceProvider =
    AutoDisposeFutureProvider<BluetoothDevice?>.internal(
      connectDevice,
      name: r'connectDeviceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$connectDeviceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectDeviceRef = AutoDisposeFutureProviderRef<BluetoothDevice?>;
String _$connectionStateHash() => r'0322e5d4848c6d7677a205c58fccb010b0091ffb';

/// See also [connectionState].
@ProviderFor(connectionState)
final connectionStateProvider =
    AutoDisposeStreamProvider<BluetoothConnectionState>.internal(
      connectionState,
      name: r'connectionStateProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$connectionStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectionStateRef =
    AutoDisposeStreamProviderRef<BluetoothConnectionState>;
String _$deviceRemoteIdHash() => r'e9089363b103756269290b36e457e8d66bf962d0';

/// See also [DeviceRemoteId].
@ProviderFor(DeviceRemoteId)
final deviceRemoteIdProvider =
    AutoDisposeNotifierProvider<DeviceRemoteId, String?>.internal(
      DeviceRemoteId.new,
      name: r'deviceRemoteIdProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$deviceRemoteIdHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DeviceRemoteId = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
