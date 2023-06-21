import 'package:flutter/material.dart';

import '../../../common widgets/custom_elevated_button.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/helper_function.dart';

Padding buildSearchButton(BuildContext context, focusNode) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: CustomElevatedButton(
      onPressed: () {
        AppHelpers.unfocusNodes([focusNode]);
      },
      child: Text(
        AppStrings.search,
      ),
    ),
  );
}
