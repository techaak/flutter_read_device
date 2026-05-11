import '../collectors/app_info_collector.dart';
import '../collectors/device_info_collector.dart';
import '../models/read_device_info_model.dart';

/// Service layer for managing and caching application and device information.
class ReadDeviceService {
  static final ReadDeviceService _instance = ReadDeviceService._internal();

  factory ReadDeviceService() => _instance;

  ReadDeviceService._internal();

  final AppInfoCollector _appCollector = AppInfoCollector();
  final DeviceInfoCollector _deviceCollector = DeviceInfoCollector();

  ReadDeviceInfoModel? _cachedInfo;

  /// Collects all information. 
  /// [useCache] determines if previously collected data should be returned.
  Future<ReadDeviceInfoModel> collect({bool useCache = true}) async {
    if (useCache && _cachedInfo != null) {
      return _cachedInfo!;
    }

    final appInfo = await _appCollector.collect();
    final deviceInfo = await _deviceCollector.collect();

    _cachedInfo = ReadDeviceInfoModel(
      app: appInfo,
      device: deviceInfo,
    );

    return _cachedInfo!;
  }
}
