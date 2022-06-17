import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeComponent extends StatefulWidget {
  const TimeComponent({Key? key}) : super(key: key);

  @override
  State<TimeComponent> createState() => _TimeComponentState();
}

class _TimeComponentState extends State<TimeComponent> {
  late Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (Timer t) => setState(() {
            _now = DateTime.now();
      }),
    );

    _now = DateTime.now();

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMMM dd, yyyy').format(_now);
    String formattedTime = DateFormat('HH:mm').format(_now);

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(formattedDate, style: const TextStyle(fontSize: 30)),
          RichText(
              text: TextSpan(
                text: formattedTime,
                style: const TextStyle(fontSize: 60),
                children: <InlineSpan>[
                WidgetSpan(
                  alignment: PlaceholderAlignment.top,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                      child: Text(_now.second.toString().padLeft(2, '0'), style: const TextStyle(fontSize: 30)))),
                ],
              )),
        ]
      ),
    );
  }
}
