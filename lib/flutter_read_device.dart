import 'src/services/flutter_read_device_service.dart';
import 'src/models/flutter_read_device_model.dart';

export 'src/models/app_info_model.dart';
export 'src/models/device_info_model.dart';
export 'src/models/flutter_read_device_model.dart';
export 'src/extensions/flutter_read_device_extensions.dart';

/// Main entry point for the FlutterReadDevice SDK.
class FlutterReadDevice {
  FlutterReadDevice._();

  /// Collects application and device information.
  /// 
  /// Returns a cached version if [useCache] is true (default).
  static Future<FlutterReadDeviceInfo> collect({bool useCache = true}) {
    return FlutterReadDeviceService().collect(useCache: useCache);
  }
}
