import 'dart:math' as math;

import 'package:flutter/material.dart';

class ACTemperatureIndicator extends StatelessWidget {
  const ACTemperatureIndicator(
      {Key? key, required this.progress, required this.activeColor})
      : super(key: key);

  final double progress;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    int temp = (progress * 2 * 14 + 16).toInt();
    return Container(
      height: MediaQuery.of(context).size.width * 0.6,
      width: MediaQuery.of(context).size.width * 0.6,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: Transform.rotate(
              angle: -math.pi / 2,
              child: CircularProgressIndicator(
                color: activeColor,
                strokeWidth: 30,
                value: progress,
                backgroundColor: activeColor.withOpacity(0.3),
              ),
            ),
          ),
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: activeColor.withOpacity(0.4),
                    offset: const Offset(5, 10),
                    blurRadius: 10,
                    spreadRadius: 10)
              ],
            ),
            child: Transform.rotate(
              angle: (-math.pi / 2) + (math.pi) * progress * 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: activeColor,
                ),
              ),
            ),
          ),
          Text(
            '$tempºC',
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 28,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
