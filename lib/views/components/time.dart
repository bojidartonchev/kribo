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
  DateTime? _now;

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (Timer t) => setState(() {
            _now = DateTime.now();
      }),
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_now == null){
      return const SizedBox();
    }

    String formattedDate = DateFormat('EEEE, MMMM dd, yyyy').format(_now!);
    String formattedTime = DateFormat('HH:mm:ss').format(_now!);

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(formattedDate, style: const TextStyle(color: Colors.white, fontSize: 30)),
          Text(formattedTime, style: const TextStyle(color: Colors.white, fontSize: 50))
        ],
      ),
    );
  }
}
