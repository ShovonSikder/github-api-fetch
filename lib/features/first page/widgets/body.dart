import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:github_api_fetch/features/first%20page/controllers/first_page_controller.dart';
import 'package:github_api_fetch/features/first%20page/widgets/search_button.dart';
import 'package:github_api_fetch/features/first%20page/widgets/text_field.dart';
import 'package:github_api_fetch/utils/helper_function.dart';

import '../../../constants/app_values.dart';

Center buildBody(BuildContext context, usernameController, focusNode) {
  final formKey = GlobalKey<FormState>();
  return Center(
    child: ListView(
      padding: EdgeInsets.all(AppValues.bodyPadding),
      shrinkWrap: true,
      children: [
        Form(
          key: formKey,
          child: buildTextFormField(
            usernameController,
            focusNode,
            onSubmit: (value) {
              _fetchUser(context, formKey, usernameController, focusNode);
            },
          ),
        ),
        buildSearchButton(
          context,
          onPressed: () {
            _fetchUser(context, formKey, usernameController, focusNode);
          },
        ),
      ],
    ),
  );
}

void _fetchUser(
    context, formKey, usernameController, FocusNode focusNodes) async {
  if (!formKey.currentState!.validate()) return;

  AppHelpers.unfocusNodes([focusNodes]);
  EasyLoading.show();
  try {
    final user =
        await FirstPageController().fetchUser(usernameController.text.trim());
    EasyLoading.dismiss();
  } catch (e) {
    print(e.toString());
    AppHelpers.showMsgDialog(
      context,
      AppHelpers.exceptionToErrorWidget(
        e,
        onAction: () {
          Navigator.pop(context);
        },
      ),
    );
    EasyLoading.dismiss();
  }
}
