import 'package:flutter/material.dart';
import 'dart:async';
import 'package:timer_app_neo/timerApp/home_page.dart';
import '../widget/button.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class CountDown extends StatefulWidget {
  final Duration duration;
  const CountDown(this.duration, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CountDownState();
  }
}

class _CountDownState extends State<CountDown> {
  Timer? countdownTimer;
  Duration? myDuration;
  bool isStarted = true;
  @override
  void initState() {
    myDuration = widget.duration;
    startTimer();
    super.initState();
  }

  void startTimer() {
    setState(() {
      isStarted = true;
    });
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    isStarted = false;
    setState(() => countdownTimer!.cancel());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    if (mounted) {
      setState(() {
        final seconds = myDuration!.inSeconds - reduceSecondsBy;
        if (seconds < 0 && countdownTimer != null) {
          countdownTimer!.cancel();
          notfifyTimeUp();
          _showDialog(context);
        } else {
          myDuration = Duration(seconds: seconds);
        }
      });
    }
  }

  void notfifyTimeUp() {
    FlutterRingtonePlayer.play(
      android: AndroidSounds.notification, // Android用のサウンド
      ios: const IosSound(1023), // iOS用のサウンド
      looping: true, // Androidのみ。ストップするまで繰り返す
      asAlarm: false, // Androidのみ。サイレントモードでも音を鳴らす
      volume: 0.0, // Androidのみ。0.0〜1.0
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('終了しました'),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/',
              ),
              child: const Text('閉じる'),
            )
          ],
        );
      },
    );
  }

  void backToHomePage() {
    setState(() {
      Navigator.pop(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const HomePage(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration!.inHours.remainder(24));
    final minutes = strDigits(myDuration!.inMinutes.remainder(60));
    final seconds = strDigits(myDuration!.inSeconds.remainder(60));
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
            const SizedBox(height: 48),
            Column(
              children: [
                const SizedBox(height: 24),
                SizedBox(
                    height: 180,
                    child: Text(
                      '$hours:$minutes:$seconds',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 50),
                    )),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Button(
                        title: "キャンセル", isEnabled: true, onTap: backToHomePage),
                    const SizedBox(width: 100),
                    (isStarted)
                        ? Button(
                            title: "一時停止", isEnabled: true, onTap: stopTimer)
                        : Button(
                            title: "再開", isEnabled: true, onTap: startTimer)
                  ],
                ),
              ],
            ),
          ],
        )));
  }
}
