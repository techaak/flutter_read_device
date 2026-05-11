import 'dart:convert';
import 'package:equatable/equatable.dart';

/// Model representing device information for both Android and iOS.
class DeviceInfoModel extends Equatable {
  final String brand;
  final String model;
  final String manufacturer;
  final String device;
  final String product;
  final String hardware;
  final String board;
  final String bootloader;
  final String fingerprint;
  final List<String> supportedAbis;
  final int sdkInt;
  final String osVersion;
  final bool isPhysicalDevice;
  
  // iOS Specific
  final String? name;
  final String? systemName;
  final String? identifierForVendor;
  final String? machine;

  const DeviceInfoModel({
    required this.brand,
    required this.model,
    required this.manufacturer,
    required this.device,
    required this.product,
    required this.hardware,
    required this.board,
    required this.bootloader,
    required this.fingerprint,
    required this.supportedAbis,
    required this.sdkInt,
    required this.osVersion,
    required this.isPhysicalDevice,
    this.name,
    this.systemName,
    this.identifierForVendor,
    this.machine,
  });

  /// Factory for creating an empty or fallback model.
  factory DeviceInfoModel.empty() => const DeviceInfoModel(
        brand: 'Unknown',
        model: 'Unknown',
        manufacturer: 'Unknown',
        device: 'Unknown',
        product: 'Unknown',
        hardware: 'Unknown',
        board: 'Unknown',
        bootloader: 'Unknown',
        fingerprint: 'Unknown',
        supportedAbis: [],
        sdkInt: 0,
        osVersion: 'Unknown',
        isPhysicalDevice: true,
      );

  Map<String, dynamic> toMap() {
    return {
      'brand': brand,
      'model': model,
      'manufacturer': manufacturer,
      'device': device,
      'product': product,
      'hardware': hardware,
      'board': board,
      'bootloader': bootloader,
      'fingerprint': fingerprint,
      'supportedAbis': supportedAbis,
      'sdkInt': sdkInt,
      'osVersion': osVersion,
      'isPhysicalDevice': isPhysicalDevice,
      'name': name,
      'systemName': systemName,
      'identifierForVendor': identifierForVendor,
      'machine': machine,
    };
  }

  factory DeviceInfoModel.fromMap(Map<String, dynamic> map) {
    return DeviceInfoModel(
      brand: map['brand'] ?? '',
      model: map['model'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      device: map['device'] ?? '',
      product: map['product'] ?? '',
      hardware: map['hardware'] ?? '',
      board: map['board'] ?? '',
      bootloader: map['bootloader'] ?? '',
      fingerprint: map['fingerprint'] ?? '',
      supportedAbis: List<String>.from(map['supportedAbis'] ?? []),
      sdkInt: map['sdkInt'] ?? 0,
      osVersion: map['osVersion'] ?? '',
      isPhysicalDevice: map['isPhysicalDevice'] ?? true,
      name: map['name'],
      systemName: map['systemName'],
      identifierForVendor: map['identifierForVendor'],
      machine: map['machine'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        brand,
        model,
        manufacturer,
        device,
        product,
        hardware,
        board,
        bootloader,
        fingerprint,
        supportedAbis,
        sdkInt,
        osVersion,
        isPhysicalDevice,
        name,
        systemName,
        identifierForVendor,
        machine,
      ];

  DeviceInfoModel copyWith({
    String? brand,
    String? model,
    String? manufacturer,
    String? device,
    String? product,
    String? hardware,
    String? board,
    String? bootloader,
    String? fingerprint,
    List<String>? supportedAbis,
    int? sdkInt,
    String? osVersion,
    bool? isPhysicalDevice,
    String? name,
    String? systemName,
    String? identifierForVendor,
    String? machine,
  }) {
    return DeviceInfoModel(
      brand: brand ?? this.brand,
      model: model ?? this.model,
      manufacturer: manufacturer ?? this.manufacturer,
      device: device ?? this.device,
      product: product ?? this.product,
      hardware: hardware ?? this.hardware,
      board: board ?? this.board,
      bootloader: bootloader ?? this.bootloader,
      fingerprint: fingerprint ?? this.fingerprint,
      supportedAbis: supportedAbis ?? this.supportedAbis,
      sdkInt: sdkInt ?? this.sdkInt,
      osVersion: osVersion ?? this.osVersion,
      isPhysicalDevice: isPhysicalDevice ?? this.isPhysicalDevice,
      name: name ?? this.name,
      systemName: systemName ?? this.systemName,
      identifierForVendor: identifierForVendor ?? this.identifierForVendor,
      machine: machine ?? this.machine,
    );
  }
}
