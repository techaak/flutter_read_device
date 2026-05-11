import 'dart:io';
import '../models/read_device_info_model.dart';

/// Useful extensions for [ReadDeviceInfoModel] to quickly check platform and device states.
extension ReadDeviceExtensions on ReadDeviceInfoModel {
  /// Returns true if the current platform is Android.
  bool get isAndroid => Platform.isAndroid;

  /// Returns true if the current platform is iOS.
  bool get isIOS => Platform.isIOS;

  /// Returns true if the device is an emulator/simulator.
  bool get isEmulator => !device.isPhysicalDevice;

  /// Returns true if the device is Android 13 (API 33) or above.
  bool get isAndroid13Above {
    if (!isAndroid) return false;
    return device.sdkInt >= 33;
  }
}
