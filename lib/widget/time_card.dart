import 'package:flutter/material.dart';

class TimeCard extends StatefulWidget {
  const TimeCard({
    Key? key,
    required this.time,
    required this.header,
  }) : super(key: key);
  final String time;
  final String header;

  @override
  State<StatefulWidget> createState() {
    return _TimeCardState();
  }
}

class _TimeCardState extends State<TimeCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Text(
          widget.time,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 72),
        ),
      ),
      const SizedBox(height: 24),
      Text(widget.header)
    ]);
  }
}
