import 'package:flutter/cupertino.dart';
import 'package:flutter_iot_ui_challenge/models/ac_mode.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/smart_ac/widgets/ac_mode_button.dart';

class ACModeRow extends StatefulWidget {
  const ACModeRow({Key? key}) : super(key: key);

  @override
  State<ACModeRow> createState() => _ACModeRowState();
}

class _ACModeRowState extends State<ACModeRow> {
  final modes = <ACMode>[
    ACMode(iconPath: 'assets/svg/clock.svg', enabled: false),
    ACMode(iconPath: 'assets/svg/snow.svg', enabled: true),
    ACMode(iconPath: 'assets/svg/bright.svg', enabled: false),
    ACMode(iconPath: 'assets/svg/drop.svg', enabled: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: modes
            .map(
              (e) => ACModeButton(
                mode: e,
                onTap: () => changeMode(modes.indexOf(e)),
              ),
            )
            .toList(),
      ),
    );
  }

  void changeMode(int index) {
    setState(() {
      for (var element in modes) {
        element.enabled = false;
      }
      modes[index].enabled = true;
    });
  }
}
