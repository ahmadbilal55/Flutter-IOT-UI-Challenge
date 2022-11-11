import 'package:flutter/material.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/smart_ac/widgets/control_widgets/ac_control_item.dart';
import 'package:flutter_iot_ui_challenge/ui/widgets/custom_switcher.dart';

class ACPowerControl extends StatelessWidget {
  const ACPowerControl(
      {Key? key,
      required this.poweredOn,
      required this.onPowerStateChanged,
      required this.activeColor})
      : super(key: key);

  final bool poweredOn;
  final Color activeColor;
  final void Function(bool) onPowerStateChanged;

  @override
  Widget build(BuildContext context) {
    return ACControlItem(
        activeColor: activeColor,
        title: 'Power',
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                  text: 'OFF',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: poweredOn ? Colors.white30 : Colors.white,
                  ),
                  children: [
                    const TextSpan(
                      text: '/',
                      style: TextStyle(
                        color: Colors.white30,
                      ),
                    ),
                    TextSpan(
                      text: 'ON',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: poweredOn ? Colors.white : Colors.white30,
                      ),
                    ),
                  ]),
            ),
            CustomSwitcher(
              value: poweredOn,
              onChanged: onPowerStateChanged,
              height: 24,
            )
          ],
        ));
  }
}
