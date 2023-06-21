import 'package:flutter/material.dart';
import 'package:github_api_fetch/constants/app_paths.dart';
import 'package:github_api_fetch/constants/app_values.dart';

import '../../../constants/app_strings.dart';
import '../../../utils/helper_function.dart';

TextFormField buildTextFormField(usernameController, focusNode) {
  return TextFormField(
    controller: usernameController,
    autofocus: true,
    textInputAction: TextInputAction.search,
    focusNode: focusNode,
    onFieldSubmitted: (v) {
      AppHelpers.unfocusNodes([focusNode]);
      print(v);
    },
    decoration: InputDecoration(
      labelText: AppStrings.username,
      prefixIcon: Padding(
        padding: EdgeInsets.all(AppValues.commonPadding),
        child: Image.asset(
          AppPaths.githubLogoImgPaths,
          height: AppValues.logoHeightInTextfield,
          fit: BoxFit.contain,
        ),
      ),
      border: const OutlineInputBorder(),
    ),
    validator: (value) =>
        value == null || value.isEmpty ? AppStrings.usernameRequired : null,
  );
}
