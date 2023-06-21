import 'package:flutter/material.dart';
import 'package:github_api_fetch/constants/app_values.dart';

class CustomElevatedButton extends StatelessWidget {
  Function() onPressed;
  Widget child;
  CustomElevatedButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppValues.customButtonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).secondaryHeaderColor,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
