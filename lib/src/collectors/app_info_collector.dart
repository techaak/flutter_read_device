import 'package:package_info_plus/package_info_plus.dart';
import '../models/app_info_model.dart';

/// Collector responsible for gathering application information.
class AppInfoCollector {
  Future<AppInfoModel> collect() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();

      return AppInfoModel(
        appName: packageInfo.appName,
        packageName: packageInfo.packageName,
        version: packageInfo.version,
        buildNumber: packageInfo.buildNumber,
        buildSignature: packageInfo.buildSignature,
        installerStore: packageInfo.installerStore,
      );
    } catch (e) {
      // In case of error, return empty model instead of crashing
      return AppInfoModel.empty();
    }
  }
}
