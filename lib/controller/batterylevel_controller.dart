import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryState {
  final double batteryLevel;
  final bool isDeviceCharging;

  const BatteryState({this.batteryLevel = 0.0, this.isDeviceCharging = false});
}

class BatteryController extends ValueNotifier<BatteryState> {
  BatteryController() : super(const BatteryState());

  static const platform = MethodChannel('samples.flutter.dev/battery');

  Future<void> fetchBatteryData() async {
    final batteryLevel = await _getBatteryLevel().then((value) {
      return value.toDouble();
    });

    final isDeviceCharging = await _isDeviceCharging();

    value = BatteryState(
      batteryLevel: batteryLevel,
      isDeviceCharging: isDeviceCharging,
    );
  }

  Future<dynamic> _getBatteryLevel() async {
    final batteryLevel = await platform.invokeMethod('getBatteryLevel');

    return batteryLevel;
  }

  Future<bool> _isDeviceCharging() async {
    final isDeviceCharging = await platform.invokeMethod('isDeviceCharging');

    return isDeviceCharging;
  }
}
