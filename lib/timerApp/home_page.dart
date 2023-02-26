import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_app_neo/timerApp/countdown_page.dart';
import 'package:timer_app_neo/widget/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> isSelected = [true, false];
  bool isStarted = false;
  Duration duration = const Duration(hours: 0, minutes: 0, seconds: 1);

  @override
  void initState() {
    super.initState();
  }

  void initTimer() {
    setState(() {
      isStarted = !isStarted;
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => CountDown(duration),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    });
  }

  void initCancel() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 72),
                SizedBox(
                    height: 180,
                    child: CupertinoTimerPicker(
                      backgroundColor: Colors.white10,
                      initialTimerDuration: duration,
                      mode: CupertinoTimerPickerMode.hms,
                      minuteInterval: 1,
                      secondInterval: 1,
                      onTimerDurationChanged: (duration) =>
                          setState(() => this.duration = duration),
                    )),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Button(title: "キャンセル", isEnabled: false, onTap: initCancel),
                    const SizedBox(width: 100),
                    Button(title: "開始", isEnabled: true, onTap: initTimer)
                  ],
                ),
              ],
            ),
          ],
        )));
  }
}
