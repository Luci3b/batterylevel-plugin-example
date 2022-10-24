import 'package:batterylevel_plugin/home_page.dart';
import 'package:flutter/material.dart';

class BatteryLevelPluginApp extends StatelessWidget {
  const BatteryLevelPluginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
