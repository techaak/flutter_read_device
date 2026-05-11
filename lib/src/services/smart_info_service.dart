import '../collectors/app_info_collector.dart';
import '../collectors/device_info_collector.dart';
import '../models/smart_info_model.dart';

/// Service layer for managing and caching application and device information.
class FlutterReadDeviceService {
  static final FlutterReadDeviceService _instance = FlutterReadDeviceService._internal();

  factory FlutterReadDeviceService() => _instance;

  FlutterReadDeviceService._internal();

  final AppInfoCollector _appCollector = AppInfoCollector();
  final DeviceInfoCollector _deviceCollector = DeviceInfoCollector();

  FlutterReadDeviceInfo? _cachedInfo;

  /// Collects all information. 
  /// [useCache] determines if previously collected data should be returned.
  Future<FlutterReadDeviceInfo> collect({bool useCache = true}) async {
    if (useCache && _cachedInfo != null) {
      return _cachedInfo!;
    }

    final appInfo = await _appCollector.collect();
    final deviceInfo = await _deviceCollector.collect();

    _cachedInfo = FlutterReadDeviceInfo(
      app: appInfo,
      device: deviceInfo,
    );

    return _cachedInfo!;
  }
}
