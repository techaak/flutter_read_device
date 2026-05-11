import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import '../models/device_info_model.dart';

/// Collector responsible for gathering device-specific information.
class DeviceInfoCollector {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  Future<DeviceInfoModel> collect() async {
    try {
      if (Platform.isAndroid) {
        return _collectAndroidInfo();
      } else if (Platform.isIOS) {
        return _collectIosInfo();
      }
      return DeviceInfoModel.empty();
    } catch (e) {
      return DeviceInfoModel.empty();
    }
  }

  Future<DeviceInfoModel> _collectAndroidInfo() async {
    final androidInfo = await _deviceInfoPlugin.androidInfo;
    return DeviceInfoModel(
      brand: androidInfo.brand,
      model: androidInfo.model,
      manufacturer: androidInfo.manufacturer,
      device: androidInfo.device,
      product: androidInfo.product,
      hardware: androidInfo.hardware,
      board: androidInfo.board,
      bootloader: androidInfo.bootloader,
      fingerprint: androidInfo.fingerprint,
      supportedAbis: List<String>.from(androidInfo.supportedAbis),
      sdkInt: androidInfo.version.sdkInt,
      osVersion: androidInfo.version.release,
      isPhysicalDevice: androidInfo.isPhysicalDevice,
    );
  }

  Future<DeviceInfoModel> _collectIosInfo() async {
    final iosInfo = await _deviceInfoPlugin.iosInfo;
    return DeviceInfoModel(
      brand: 'Apple',
      model: iosInfo.model,
      manufacturer: 'Apple',
      device: iosInfo.name,
      product: 'iPhone',
      hardware: 'Apple Hardware',
      board: 'Apple Board',
      bootloader: 'N/A',
      fingerprint: 'N/A',
      supportedAbis: const [],
      sdkInt: 0, // Not applicable for iOS in same way
      osVersion: iosInfo.systemVersion,
      isPhysicalDevice: iosInfo.isPhysicalDevice,
      name: iosInfo.name,
      systemName: iosInfo.systemName,
      identifierForVendor: iosInfo.identifierForVendor,
      machine: iosInfo.utsname.machine,
    );
  }
}
