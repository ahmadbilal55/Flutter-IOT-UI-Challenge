import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    Key? key,
    required this.onTap,
    required this.switchedOn,
    required this.child,
    this.height = 56,
    this.width = 56,
    this.radius = 12,
  }) : super(key: key);

  final bool switchedOn;
  final double height;
  final double width;
  final double radius;

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: switchedOn ? Colors.white : Colors.black12,
            borderRadius: BorderRadius.circular(radius)),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
