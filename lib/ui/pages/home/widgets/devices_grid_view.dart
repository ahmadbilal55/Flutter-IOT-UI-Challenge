import 'package:flutter/material.dart';
import 'package:flutter_iot_ui_challenge/app/assets.dart';

import 'device_item.dart';

class DevicesGridView extends StatelessWidget {
  const DevicesGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      shrinkWrap: true,
      childAspectRatio: 3 / 4,
      scrollDirection: Axis.vertical,
      children: devices
          .map(
              (e) => DeviceItem(device: e)
      )
          .toList(),
    );
  }
}
