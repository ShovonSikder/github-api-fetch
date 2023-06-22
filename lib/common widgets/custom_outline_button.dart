import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  Function() onPressed;
  String txt;
  CustomOutlineButton({super.key, required this.onPressed, required this.txt});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        txt,
      ),
    );
  }
}
