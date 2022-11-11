import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_iot_ui_challenge/app/custom_colors.dart';
import 'package:flutter_iot_ui_challenge/models/device_model.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/smart_ac/smart_ac_page.dart';
import 'package:flutter_iot_ui_challenge/ui/widgets/custom_switcher.dart';

class DeviceItem extends StatefulWidget {
  const DeviceItem({Key? key, required this.device}) : super(key: key);

  final DeviceModel device;

  @override
  State<DeviceItem> createState() => _DeviceItemState();
}

class _DeviceItemState extends State<DeviceItem> {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      middleColor: CustomColor.purple,transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (context, action) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.device.enabled
              ? widget.device.deviceColor.withOpacity(0.7)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: widget.device.enabled
                ? Colors.transparent
                : CustomColor.lightGray,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              widget.device.iconPath,
              height: 34,
              color: widget.device.enabled ? Colors.white : Colors.black,
            ),
            Text(
              widget.device.name.splitMapJoin(
                ' ',
                onMatch: (match) => '${match.group(0)}\n',
              ),
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: widget.device.enabled ? Colors.white : Colors.black,
              ),
            ),
            CustomSwitcher(
              value: widget.device.enabled,
              height: 24,
              onChanged: (value) {
                setState(() {
                  widget.device.enabled = value;
                });
              },
            )
          ],
        ),
      ),
      openBuilder:
          (BuildContext context, void Function({Object? returnValue}) action) =>
               SmartACPage(poweredOn:widget.device.enabled),
    );
  }
}
