import 'package:flutter/material.dart';
import 'package:flutter_iot_ui_challenge/ui/widgets/switch_button.dart';

import 'ac_control_item.dart';

class ACSpeedControl extends StatelessWidget {
  const ACSpeedControl({
    Key? key,
    required this.speed,
    required this.onSpeedChanged, required this.activeColor,
  }) : super(key: key);

  final int speed;
  final Color activeColor;
  final void Function(int) onSpeedChanged;

  @override
  Widget build(BuildContext context) {
    return ACControlItem(
      title: 'Speed',
      activeColor: activeColor,
      child: Row(
        children: [
          SwitchButton(
            onTap: () => onSpeedChanged(1),
            switchedOn: speed == 1,
            height: 36,
            width: 36,
            radius: 18,
            child: Text(
              '1',
              style: TextStyle(
                color: speed == 1 ? Colors.black : Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SwitchButton(
            onTap: () => onSpeedChanged(2),
            switchedOn: speed == 2,
            height: 36,
            width: 36,
            radius: 18,
            child: Text(
              '2',
              style: TextStyle(
                color: speed == 2 ? Colors.black : Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SwitchButton(
            onTap: () => onSpeedChanged(3),
            switchedOn: speed == 3,
            height: 36,
            width: 36,
            radius: 18,
            child: Text(
              '3',
              style: TextStyle(
                color: speed == 3 ? Colors.black : Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          )
        ],
      ),
    );
  }
}
