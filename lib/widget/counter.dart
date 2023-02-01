import 'package:flutter/material.dart';
import 'dart:async';

class Counter extends StatefulWidget {
  final Duration duration;
  const Counter(this.duration, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  Timer? countdownTimer;
  Duration? myDuration;
  @override
  void initState() {
    myDuration = widget.duration;
    startTimer();
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    if (mounted) {
      setState(() {
        final seconds = myDuration!.inSeconds - reduceSecondsBy;
        if (seconds < 0 && countdownTimer != null) {
          countdownTimer!.cancel();
        } else {
          myDuration = Duration(seconds: seconds);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration!.inHours.remainder(24));
    final minutes = strDigits(myDuration!.inMinutes.remainder(60));
    final seconds = strDigits(myDuration!.inSeconds.remainder(60));
    return SizedBox(
        height: 180,
        child: Text(
          '$hours:$minutes:$seconds',
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
        ));
  }
}
