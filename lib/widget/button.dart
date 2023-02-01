import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  State<StatefulWidget> createState() {
    return _ButtonState();
  }
}

class _ButtonState extends State<Button> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Text(widget.title);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 100),
          primary: const Color.fromARGB(255, 168, 224, 105),
          onPrimary: Colors.black,
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        onPressed: () {
          widget.onTap();
        },
        child: Text(widget.title));
  }
}
