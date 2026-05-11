import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_read_device/flutter_read_device.dart';

void main() {
  test('FlutterReadDeviceInfo model comparison', () {
    const appInfo = AppInfoModel(
      appName: 'TestApp',
      packageName: 'com.test.app',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: 'sig',
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
      fingerprint: 'fp',
      supportedAbis: ['arm64-v8a'],
      sdkInt: 33,
      osVersion: '13',
      isPhysicalDevice: true,
    );

    const info1 = FlutterReadDeviceInfo(app: appInfo, device: deviceInfo);
    const info2 = FlutterReadDeviceInfo(app: appInfo, device: deviceInfo);

    expect(info1, equals(info2));
  });

  test('FlutterReadDeviceInfo toMap contains expected keys', () {
    const appInfo = AppInfoModel(
      appName: 'TestApp',
      packageName: 'com.test.app',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: 'sig',
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
      fingerprint: 'fp',
      supportedAbis: ['arm64-v8a'],
      sdkInt: 33,
      osVersion: '13',
      isPhysicalDevice: true,
    );

    const info = FlutterReadDeviceInfo(app: appInfo, device: deviceInfo);
    final map = info.toMap();

    expect(map.containsKey('app'), isTrue);
    expect(map.containsKey('device'), isTrue);
    expect(map['app']['appName'], 'TestApp');
    expect(map['device']['model'], 'Pixel 6');
  });
}
