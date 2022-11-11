import 'package:flutter/material.dart';

class ACControlItem extends StatelessWidget {
  const ACControlItem({Key? key, required this.title, required this.child, required this.activeColor}) : super(key: key);

  final String title;
  final Widget child;
  final Color activeColor;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: activeColor.withOpacity(0.3),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16,),
            child,
          ],
        ),
      );
  }
}
