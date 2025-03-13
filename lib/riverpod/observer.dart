import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('Провайдер ${provider.name ?? provider.runtimeType} был создан со значением: $value');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('Провайдер ${provider.name ?? provider.runtimeType} обновился:');
    print('  Предыдущее значение: $previousValue');
    print('  Новое значение: $newValue');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    print('Провайдер ${provider.name ?? provider.runtimeType} был уничтожен');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    print('Ошибка в провайдере ${provider.name ?? provider.runtimeType}: $error');
    print('Stack trace: $stackTrace');
  }
}