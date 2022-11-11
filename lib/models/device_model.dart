import 'dart:ui';

class DeviceModel {
  final String name;
  final Color deviceColor;
  final String iconPath;
  bool enabled;

   DeviceModel({
    required this.name,
    required this.deviceColor,
    required this.iconPath,
    required this.enabled,
  });
}
