## 1.0.0

* Initial release of `flutter_read_device`.
* Unified API for collecting application and device information via `FlutterReadDevice.collect()`.
* Implemented Clean Architecture:
    * **Models**: Immutable models for `AppInfoModel`, `DeviceInfoModel`, and `FlutterReadDeviceInfo` with `Equatable` support.
    * **Collectors**: Platform-specific logic for `device_info_plus` and `package_info_plus`.
    * **Services**: Singleton service for managing data collection and caching.
    * **Extensions**: Convenient platform helpers like `isAndroid`, `isIOS`, `isEmulator`, and `isAndroid13Above`.
* Full JSON serialization support (`toMap` and `toJson`).
* Comprehensive documentation and example project.
