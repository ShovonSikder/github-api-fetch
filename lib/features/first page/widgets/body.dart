import 'package:flutter/material.dart';
import 'package:github_api_fetch/features/first%20page/widgets/search_button.dart';
import 'package:github_api_fetch/features/first%20page/widgets/text_field.dart';

import '../../../constants/app_values.dart';

Center buildBody(BuildContext context, usernameController, focusNode) {
  return Center(
    child: ListView(
      padding: EdgeInsets.all(AppValues.bodyPadding),
      shrinkWrap: true,
      children: [
        buildTextFormField(usernameController, focusNode),
        buildSearchButton(context, focusNode),
      ],
    ),
  );
}
