import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/smart_ac/widgets/ac_mode_row.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/smart_ac/widgets/app_bar.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/smart_ac/widgets/control_widgets/ac_controls.dart';
import 'package:rainbow_color/rainbow_color.dart';

import 'widgets/ac_temperature_indicator.dart';

class SmartACPage extends StatefulWidget {
  const SmartACPage({Key? key, required this.poweredOn}) : super(key: key);

  final bool poweredOn;

  @override
  State<SmartACPage> createState() => _SmartACPageState();
}

class _SmartACPageState extends State<SmartACPage>
    with TickerProviderStateMixin {
  int _speed = 1;
  bool _poweredOn = false;
  double _temp = 0.2;

  var activeColor = Rainbow(spectrum: [
    const Color(0xFF33C0BA),
    const Color(0xFF4694C7),
    const Color(0xFF86A200),
    const Color(0xFFFFD200),
    const Color(0xFFFF5D00)
  ], rangeStart: 0.0, rangeEnd: 1.0);

  _changeSpeed(int val) {
    setState(() {
      _speed = val;
    });
  }

  _changeTemp(double val) {
    setState(() {
      _temp = val;
    });
  }

  _toggleACPower(bool val) {
    setState(() {
      _poweredOn = val;
    });
  }

  @override
  void initState() {
    _poweredOn = widget.poweredOn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.white,
            activeColor[_temp * 2].withOpacity(0.5),
            activeColor[_temp * 2].withOpacity(0.8),
          ])),
      child: SafeArea(
        child: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              baseColor: Colors.white,
              maxOpacity: 0.5,
              minOpacity: 0.1,
              opacityChangeRate: 2,
              spawnMinRadius: 1,
              spawnMaxRadius: 5,
              particleCount: _poweredOn ? _speed * 1000 : 0,
              spawnMinSpeed: _speed * 60,
              spawnMaxSpeed: _speed * 100,
            ),
          ),
          child: Column(
            children: [
              const CustomAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ACModeRow(),
                      ACTemperatureIndicator(
                        activeColor: activeColor[_temp * 2],
                        progress: _temp,
                      ),
                      ACControls(
                        activeColor: activeColor[_temp * 2],
                        poweredOn: _poweredOn,
                        onTempChanged: _changeTemp,
                        onSpeedChanged: _changeSpeed,
                        onPowerStateChanged: _toggleACPower,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
