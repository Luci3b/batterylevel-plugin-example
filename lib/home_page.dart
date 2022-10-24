import 'package:batterylevel_plugin/controller/batterylevel_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final BatteryController _controller;

  double get _batteryLevel => _controller.value.batteryLevel;

  bool get _isDeviceCharging => _controller.value.isDeviceCharging;

  @override
  void initState() {
    super.initState();

    _controller = BatteryController();
  }

  Future<void> _fetchBatteryData() async {
    await _controller.fetchBatteryData();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BatteryLevel Plugin'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$_batteryLevel%',
                      style: const TextStyle(
                        fontSize: 80,
                        letterSpacing: 0.1,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      _isDeviceCharging
                          ? 'Device is charging'
                          : 'Device not charging',
                      style: const TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.4,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: _fetchBatteryData,
                  child: const Text('Get battery data'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
