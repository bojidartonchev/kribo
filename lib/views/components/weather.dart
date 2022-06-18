import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kribo/generated/l10n.dart';
import 'package:weather/weather.dart';

class WeatherComponent extends StatefulWidget {
  const WeatherComponent({Key? key}) : super(key: key);

  @override
  State<WeatherComponent> createState() => _WeatherComponentState();
}

class _WeatherComponentState extends State<WeatherComponent> {
  late Timer _timer;
  late WeatherFactory _weatherFactory;

  Weather? _weather;

  @override
  void initState() {
    _weatherFactory = WeatherFactory('a45ad855438bc1581727288bc93a611b');

    _timer = Timer.periodic(
      const Duration(minutes: 1),
          (Timer t) => _requestWeather,
    );

    _requestWeather();

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  void _requestWeather() async {
    var w = await _weatherFactory.currentWeatherByCityName('Haskovo');
    setState((){
      _weather = w;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_weather == null){
      return const SizedBox();
    }

    var degrees = (_weather!.temperature!.celsius! + 0.5).toInt();

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
          Row(
            children: [
              Image.network('https://openweathermap.org/img/w/${_weather!.weatherIcon!}.png'),
              Text(S.of(context).weather_degrees_format(degrees), style: const TextStyle(fontSize: 60))
            ],
          ),
          Text(_weather!.areaName!, style: const TextStyle(fontSize: 30)),
        ],
      )
    );
  }
}
