import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    Key? key,
    required this.title,
    required this.isEnabled,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final bool isEnabled;
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
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 168, 224, 105),
          minimumSize: const Size(100, 100),
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        onPressed: !widget.isEnabled
            ? null
            : () {
                widget.onTap();
              },
        child: Text(widget.title));
  }
}
