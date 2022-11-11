import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iot_ui_challenge/ui/pages/home/home_page.dart';

void main() {
  runApp(DevicePreview(builder:(context)=> const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage()
    );
  }
}

