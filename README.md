# Flutter Read Device

A production-ready Flutter SDK that provides a unified and clean API to access both application and device information. It merges the functionality of `device_info_plus` and `package_info_plus` into a single, clean SDK-style API following Clean Architecture principles.

## Features

- **🚀 Unified API**: Access all app and device info from one place.
- **🏗️ Clean Architecture**: Modular, scalable, and maintainable structure.
- **💎 Immutable Models**: Uses `Equatable` for efficient data handling and comparison.
- **📱 Platform Helpers**: Built-in extensions for quick platform checks (e.g., `isAndroid13Above`, `isEmulator`).
- **⚡ Singleton Service**: Managed state with built-in caching to minimize repeated platform calls.
- **🛡️ Null-Safe**: Fully compliant with Dart's null safety.
- **🛡️ Production Ready**: Robust error handling and safe fallback values.

## Getting started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_read_device:
    path: ./ # Or use the published version from pub.dev
```

Then run:
```bash
flutter pub get
```

## Usage

### 1. Collect Information

```dart
import 'package:flutter_read_device/flutter_read_device.dart';

void main() async {
  // Collect all information (cached by default)
  final info = await FlutterReadDevice.collect();

  // Access Application Information
  print('App Name: ${info.app.appName}');
  print('Package: ${info.app.packageName}');
  print('Version: ${info.app.version}');
  print('Build: ${info.app.buildNumber}');

  // Access Device Information
  print('Brand: ${info.device.brand}');
  print('Model: ${info.device.model}');
  print('Manufacturer: ${info.device.manufacturer}');
  print('OS Version: ${info.device.osVersion}');
  print('Is Physical Device: ${info.device.isPhysicalDevice}');
}
```

### 2. Platform Helpers (Extensions)

The SDK provides convenient extensions on the `FlutterReadDeviceInfo` model:

```dart
final info = await FlutterReadDevice.collect();

if (info.isAndroid) {
  print('Running on Android');
}

if (info.isAndroid13Above) {
  print('Running on Android 13 or newer');
}

if (info.isEmulator) {
  print('Running on an emulator/simulator');
}

if (info.isIOS) {
  print('Platform is iOS');
}
```

### 3. JSON Serialization

All models support conversion to/from Map and JSON, perfect for logging or sending to an API:

```dart
final info = await FlutterReadDevice.collect();

// Convert to Map
Map<String, dynamic> map = info.toMap();

// Convert to JSON String
String jsonString = info.toJson();
```

## Information Collected

### Application Information (`AppInfoModel`)
- `appName`, `packageName`, `version`, `buildNumber`, `buildSignature`, `installerStore`

### Device Information (`DeviceInfoModel`)
- **Android**: `brand`, `model`, `manufacturer`, `device`, `product`, `hardware`, `board`, `bootloader`, `fingerprint`, `supportedAbis`, `sdkInt`, `osVersion`, `isPhysicalDevice`
- **iOS**: `name`, `model`, `systemName`, `systemVersion`, `machine`, `identifierForVendor`, `isPhysicalDevice`

## Folder Structure

```text
lib/
 ├── flutter_read_device.dart  # Main Entry Point
 ├── src/
 │    ├── models/              # Immutable Data Models
 │    ├── services/            # Business Logic & Caching
 │    ├── collectors/          # Data Providers (Device/Package Info)
 │    └── extensions/          # Platform Helper Extensions
```

## Architecture

This project follows **Clean Architecture**:
- **Models**: Immutable data structures using `Equatable`.
- **Collectors**: Platform-specific logic for data gathering (encapsulating `device_info_plus` and `package_info_plus`).
- **Services**: Singleton service layer managing the workflow and caching.
- **Extensions**: Utility methods for a better developer experience.

## Additional information

For a complete working example, refer to the `example/` directory.
