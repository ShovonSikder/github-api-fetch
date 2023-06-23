import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/local/app_shared_pref.dart';

AppBar buildAppBar(BuildContext context) {
  final currentThemeMode = Theme.of(context).brightness;
  return AppBar(
    actions: [
      StatefulBuilder(
        builder: (context, setState) => IconButton(
          onPressed: () {
            final newThemeMode = currentThemeMode == Brightness.light
                ? ThemeMode.dark
                : ThemeMode.light;
            Get.changeThemeMode(newThemeMode);
            AppSharedPref.setThemeMode(newThemeMode == ThemeMode.light ? 0 : 1);
            setState(() {});
          },
          icon: Icon(
            currentThemeMode == Brightness.light
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
        ),
      ),
    ],
  );
}
