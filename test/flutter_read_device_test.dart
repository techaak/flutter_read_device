import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_read_device/flutter_read_device.dart';

void main() {
  group('FlutterReadDeviceInfo Tests', () {
    const appInfo = AppInfoModel(
      appName: 'FlutterReadDevice',
      packageName: 'com.example.flutter_read_device',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: 'signature',
      installerStore: 'google_play',
    );

    const deviceInfo = DeviceInfoModel(
      brand: 'Google',
      model: 'Pixel 6',
      manufacturer: 'Google',
      device: 'oriole',
      product: 'oriole',
      hardware: 'oriole',
      board: 'oriole',
      bootloader: '1.0',
      fingerprint: 'google/oriole/oriole:13/TP1A.220624.021/8877034:user/release-keys',
      supportedAbis: ['arm64-v8a'],
      sdkInt: 33,
      osVersion: '13',
      isPhysicalDevice: true,
    );

    test('Models should support value equality', () {
      const info1 = FlutterReadDeviceInfo(app: appInfo, device: deviceInfo);
      const info2 = FlutterReadDeviceInfo(app: appInfo, device: deviceInfo);

      expect(info1, equals(info2));
      expect(info1.hashCode, equals(info2.hashCode));
    });

    test('Serialization to/from Map should work correctly', () {
      const info = FlutterReadDeviceInfo(app: appInfo, device: deviceInfo);
      final map = info.toMap();
      final fromMap = FlutterReadDeviceInfo.fromMap(map);

      expect(fromMap, equals(info));
    });

    test('copyWith should create a new instance with updated values', () {
      const info = FlutterReadDeviceInfo(app: appInfo, device: deviceInfo);
      final updatedInfo = info.copyWith(
        app: info.app.copyWith(version: '1.1.0'),
      );

      expect(updatedInfo.app.version, '1.1.0');
      expect(updatedInfo.app.appName, 'FlutterReadDevice');
      expect(updatedInfo.device, equals(info.device));
    });
  });
}
