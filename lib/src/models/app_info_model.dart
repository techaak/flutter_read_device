import 'dart:convert';
import 'package:equatable/equatable.dart';

/// Model representing application information.
class AppInfoModel extends Equatable {
  /// The name of the application.
  final String appName;

  /// The package name of the application.
  final String packageName;

  /// The version of the application.
  final String version;

  /// The build number of the application.
  final String buildNumber;

  /// The build signature of the application.
  final String buildSignature;

  /// The installer store from which the app was installed.
  final String? installerStore;

  const AppInfoModel({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.buildSignature,
    this.installerStore,
  });

  /// Factory for creating an empty or fallback model.
  factory AppInfoModel.empty() => const AppInfoModel(
        appName: 'Unknown',
        packageName: 'Unknown',
        version: '0.0.0',
        buildNumber: '0',
        buildSignature: '',
      );

  Map<String, dynamic> toMap() {
    return {
      'appName': appName,
      'packageName': packageName,
      'version': version,
      'buildNumber': buildNumber,
      'buildSignature': buildSignature,
      'installerStore': installerStore,
    };
  }

  factory AppInfoModel.fromMap(Map<String, dynamic> map) {
    return AppInfoModel(
      appName: map['appName'] ?? '',
      packageName: map['packageName'] ?? '',
      version: map['version'] ?? '',
      buildNumber: map['buildNumber'] ?? '',
      buildSignature: map['buildSignature'] ?? '',
      installerStore: map['installerStore'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        appName,
        packageName,
        version,
        buildNumber,
        buildSignature,
        installerStore,
      ];

  AppInfoModel copyWith({
    String? appName,
    String? packageName,
    String? version,
    String? buildNumber,
    String? buildSignature,
    String? installerStore,
  }) {
    return AppInfoModel(
      appName: appName ?? this.appName,
      packageName: packageName ?? this.packageName,
      version: version ?? this.version,
      buildNumber: buildNumber ?? this.buildNumber,
      buildSignature: buildSignature ?? this.buildSignature,
      installerStore: installerStore ?? this.installerStore,
    );
  }
}
