import 'package:flutter/material.dart';
import 'package:github_api_fetch/constants/app_paths.dart';
import 'package:github_api_fetch/constants/app_values.dart';

import '../../../constants/app_strings.dart';

TextFormField buildTextFormField(usernameController, focusNode,
    {required onSubmit}) {
  return TextFormField(
    controller: usernameController,
    focusNode: focusNode,
    autofocus: true,
    textInputAction: TextInputAction.search,
    onFieldSubmitted: (value) {
      onSubmit(value);
    },
    decoration: InputDecoration(
      labelText: AppStrings.username,
      prefixIcon: Padding(
        padding: EdgeInsets.all(AppValues.commonPadding),
        child: Image.asset(
          AppPaths.githubLogoImg,
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
