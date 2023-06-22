import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_fetch/core/enums/view_mode_enum.dart';

import '../../../common_controllers/get_state_controller.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_values.dart';
import '../../../core/exceptions/empty_value_exception.dart';
import '../../../utils/helper_function.dart';
import '../controllers/home_controler.dart';
import 'repo_grid_card.dart';
import 'repo_list_tile.dart';

Obx buildBodyContent(UserController userController, ViewMode viewMode) {
  return Obx(
    () {
      print('State: building');
      final repoList = userController.userRepos.value;
      return repoList != null && repoList.isNotEmpty
          ? viewMode == ViewMode.list
              ? ListView.builder(
                  padding: EdgeInsets.all(AppValues.bodyPadding / 2),
                  itemCount: repoList.length,
                  itemBuilder: (context, index) {
                    final repo = repoList[index];
                    return RepoListTile(repo: repo);
                  },
                )
              : Padding(
                  padding: EdgeInsets.all(AppValues.bodyPadding / 2),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: repoList.length,
                    itemBuilder: (context, index) =>
                        RepoGridCard(repo: repoList[index]),
                  ),
                )
          : Center(
              child: AppHelpers.exceptionToErrorWidget(
                  EmptyValueException(AppStrings.empty), onAction: () {
                HomeController()
                    .fetchUserRepo(userController.userModel.value!.login);
              }, actionTxt: AppStrings.reload),
            );
    },
  );
}
