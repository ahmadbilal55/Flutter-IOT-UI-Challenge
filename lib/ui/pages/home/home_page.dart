import 'package:flutter/material.dart';
import 'package:flutter_iot_ui_challenge/app/custom_colors.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/home/widgets/greetings_row.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/home/widgets/home_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            CustomColor.lightOrange.withOpacity(0.5),
            CustomColor.lightGray.withOpacity(0.1)
          ]),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                flex: 1,
                child: Center(
                  child: GreetingsRow(),
                ),
              ),
              Expanded(
                flex: 5,
                child: HomeCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
