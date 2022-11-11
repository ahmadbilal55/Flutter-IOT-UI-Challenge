import 'package:flutter_iot_ui_challenge/models/device_model.dart';

import 'custom_colors.dart';

final devices = [
   DeviceModel(
    name: 'Smart Spotlight',
    deviceColor: CustomColor.redOrange,
    iconPath: 'assets/svg/light.svg',
    enabled: true,
  ),
   DeviceModel(
    name: 'Smart AC',
    deviceColor: CustomColor.purple,
    iconPath: 'assets/svg/ac.svg',
    enabled: true,
  ),
   DeviceModel(
    name: 'Smart TV',
    deviceColor: CustomColor.gray,
    iconPath: 'assets/svg/tv.svg',
    enabled: false,
  ),
   DeviceModel(
    name: 'Smart Sound',
    deviceColor: CustomColor.darkBrown,
    iconPath: 'assets/svg/speaker.svg',
    enabled: false,
  ),
];
