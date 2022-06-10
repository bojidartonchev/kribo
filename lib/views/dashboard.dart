import 'package:flutter/material.dart';
import 'package:kribo/views/components/time.dart';
import 'package:kribo/views/components/weather.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TimeComponent(),
              WeatherComponent(),
            ],
          )
        ],
      ),
    );
  }
}
