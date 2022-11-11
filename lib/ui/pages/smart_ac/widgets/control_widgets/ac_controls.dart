import 'package:flutter/material.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/smart_ac/widgets/control_widgets/ac_control_item.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/smart_ac/widgets/control_widgets/ac_power_control.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/smart_ac/widgets/control_widgets/ac_speed_control.dart';

class ACControls extends StatefulWidget {
  const ACControls(
      {Key? key,
      required this.onTempChanged,
      required this.onSpeedChanged,
      required this.onPowerStateChanged, required this.activeColor, required this.poweredOn})
      : super(key: key);


  final Color activeColor;
  final bool poweredOn;
  final void Function(double) onTempChanged;
  final void Function(int) onSpeedChanged;
  final void Function(bool) onPowerStateChanged;

  @override
  State<ACControls> createState() => _ACControlsState();
}

class _ACControlsState extends State<ACControls> {
  int _speed = 1;
  bool _poweredOn = false;
  double _temp = 0.2;

  _changeSpeed(int val) {
    setState(() {
      _speed = val;
    });
    widget.onSpeedChanged(val);
  }

  _changeTemp(double val) {
    setState(() {
      _temp = val;
    });
    widget.onTempChanged(val);
  }

  _toggleACPower(bool val) {
    setState(() {
      _poweredOn = val;
    });
    widget.onPowerStateChanged(val);
  }


  @override
  void initState() {
    _poweredOn = widget.poweredOn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: ACSpeedControl(
                    activeColor:widget.activeColor,
                    speed: _speed,
                    onSpeedChanged: _changeSpeed,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ACPowerControl(
                    activeColor:widget.activeColor,
                    poweredOn: _poweredOn,
                    onPowerStateChanged: _toggleACPower,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ACControlItem(
            title: 'Temp',
            activeColor:widget.activeColor,
            child: Row(
              children: [
                const Text(
                  '16 ºC',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Slider(
                    value: _temp,
                    min: 0,
                    max: 0.5,
                    onChanged: _changeTemp,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white30,
                  ),
                ),
                const Text(
                  '30 ºC',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
