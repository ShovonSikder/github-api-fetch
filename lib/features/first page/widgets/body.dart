import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:github_api_fetch/constants/app_paths.dart';
import 'package:github_api_fetch/features/first%20page/controllers/first_page_controller.dart';
import 'package:github_api_fetch/features/first%20page/models/user_model.dart';
import 'package:github_api_fetch/features/first%20page/widgets/search_button.dart';
import 'package:github_api_fetch/features/first%20page/widgets/text_field.dart';
import 'package:github_api_fetch/features/home%20page/view/home_pge.dart';
import 'package:github_api_fetch/utils/helper_function.dart';

import '../../../common_controllers/get_state_controller.dart';
import '../../../constants/app_values.dart';

Column buildBody(BuildContext context, usernameController, focusNode, formKey) {
  return Column(
    children: [
      Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.all(AppValues.bodyPadding * 3),
          child: Image.asset(AppPaths.githubTxtLogoImg),
        ),
      ),
      Expanded(
        flex: 2,
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
      ),
    ],
  );
}

void _fetchUser(
    context, formKey, usernameController, FocusNode focusNodes) async {
  if (!formKey.currentState!.validate()) return;

  AppHelpers.unfocusNodes([focusNodes]);
  EasyLoading.show();
  try {
    final UserModel userModel =
        await FirstPageController().fetchUser(usernameController.text.trim());
    Get.find<UserController>().initUser(userModel);

    EasyLoading.dismiss();
    Get.to(() => const HomePage());
  } catch (e) {
    EasyLoading.dismiss();
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
  }
}
