import 'package:flutter/material.dart';

class GreetingsRow extends StatelessWidget {
  const GreetingsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Hi, Ahmad!",
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
        ),
        CircleAvatar(
          radius: 18,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset('assets/images/user.webp'),
          ),
        )
      ],
    );
  }
}
