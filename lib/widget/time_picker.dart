// import 'package:flutter/cupertino.dart';

// class TimePicker extends StatefulWidget {
//   const TimePicker({
//     Key? key,
//   }) : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return _TimePickerState();
//   }
// }

// class _TimePickerState extends State<TimePicker> {
//   Duration duration = const Duration(hours: 0, minutes: 0, seconds: 0);

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 180,
//       child: CupertinoTimerPicker(
//         initialTimerDuration: duration,
//         mode: CupertinoTimerPickerMode.hms,
//         minuteInterval: 1,
//         secondInterval: 1,
//         onTimerDurationChanged: (duration) =>
//             setState(() => this.duration = duration),
//       ),
//     );
//   }
// }
