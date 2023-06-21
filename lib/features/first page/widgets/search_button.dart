import 'package:flutter/material.dart';

import '../../../common widgets/custom_elevated_button.dart';
import '../../../constants/app_strings.dart';

Padding buildSearchButton(BuildContext context, {required onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: CustomElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        AppStrings.search,
      ),
    ),
  );
}
