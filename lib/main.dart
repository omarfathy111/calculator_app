import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task1/calculater_screen.dart';

void main() {
    DevicePreview.enable();

  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: ,
      // supportedLocales: ,
      // routes: ,
      home: HomeScreen(),

    );
  }

}
