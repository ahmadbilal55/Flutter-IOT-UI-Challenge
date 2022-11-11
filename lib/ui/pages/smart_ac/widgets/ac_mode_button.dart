import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_iot_ui_challenge/models/ac_mode.dart';
import 'package:flutter_iot_ui_challenge/ui/widgets/switch_button.dart';

class ACModeButton extends StatelessWidget {
  const ACModeButton({Key? key, required this.mode, required this.onTap})
      : super(key: key);

  final ACMode mode;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SwitchButton(
      onTap: onTap,
      switchedOn: mode.enabled,
      child: SvgPicture.asset(
        mode.iconPath,
        color: mode.enabled ? Colors.black : Colors.white,
        height: 18,
      ),
    );
  }
}
