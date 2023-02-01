import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  const Switcher({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SwitcherState();
  }
}

class _SwitcherState extends State<Switcher> {
  List<bool> isSelected = [true, false];
  bool isStarted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: Colors.lightBlue.shade900,
      renderBorder: false,
      //splashColor: Colors.red,
      highlightColor: Colors.orange,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('アラーム', style: TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('タイマー', style: TextStyle(fontSize: 18)),
        ),
      ],
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
    );
  }
}
