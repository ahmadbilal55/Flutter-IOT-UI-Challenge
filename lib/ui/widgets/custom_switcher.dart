import 'package:flutter/material.dart';

class CustomSwitcher extends StatefulWidget {
  const CustomSwitcher({
    Key? key,
    required this.value,
    required this.onChanged,
    this.enabledColor = Colors.white30,
    this.disabledColor = Colors.black,
    this.height = 30,
  }) : super(key: key);

  final bool value;
  final void Function(bool) onChanged;
  final Color enabledColor;
  final Color disabledColor;
  final double height;

  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  late bool _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        height: widget.height,
        width: widget.height*1.66,
        padding: const EdgeInsets.symmetric(vertical: 2),
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height/2),
          color: _value ? widget.enabledColor : widget.disabledColor,
        ),
        child: AnimatedAlign(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 150),
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          child:  CircleAvatar(
            radius: widget.height/2,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  void _toggleSwitch() {
    setState(() {
      _value = !_value;
      widget.onChanged(_value);
    });
  }
}
