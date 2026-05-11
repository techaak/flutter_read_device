import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'app_info_model.dart';
import 'device_info_model.dart';

/// Unified model containing both app and device information.
class FlutterReadDeviceInfo extends Equatable {
  final AppInfoModel app;
  final DeviceInfoModel device;

  const FlutterReadDeviceInfo({
    required this.app,
    required this.device,
  });

  Map<String, dynamic> toMap() {
    return {
      'app': app.toMap(),
      'device': device.toMap(),
    };
  }

  factory FlutterReadDeviceInfo.fromMap(Map<String, dynamic> map) {
    return FlutterReadDeviceInfo(
      app: AppInfoModel.fromMap(map['app'] ?? {}),
      device: DeviceInfoModel.fromMap(map['device'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [app, device];

  FlutterReadDeviceInfo copyWith({
    AppInfoModel? app,
    DeviceInfoModel? device,
  }) {
    return FlutterReadDeviceInfo(
      app: app ?? this.app,
      device: device ?? this.device,
    );
  }
}
