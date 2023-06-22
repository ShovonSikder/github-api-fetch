import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_fetch/common_controllers/get_state_controller.dart';
import 'package:github_api_fetch/constants/app_strings.dart';
import 'package:github_api_fetch/core/exceptions/empty_value_exception.dart';
import 'package:github_api_fetch/features/home%20page/controllers/home_controler.dart';
import 'package:github_api_fetch/utils/helper_function.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HomeController()
            .fetchUserRepo(userController.userModel.value!.login),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(userController.userRepos.value);
            return userController.userRepos.value != null &&
                    userController.userRepos.value!.isNotEmpty
                ? Obx(() => ListView(
                      children: userController.userRepos.value!
                          .map((e) => Text('${e.name}'))
                          .toList(),
                    ))
                : Center(
                    child: AppHelpers.exceptionToErrorWidget(
                        EmptyValueException(AppStrings.empty), onAction: () {
                      setState(
                        () {},
                      );
                    }, actionTxt: AppStrings.reload),
                  );
          }
          if (snapshot.hasError) {
            return Center(
              child: AppHelpers.exceptionToErrorWidget(snapshot.error!,
                  onAction: () {
                setState(() {});
              }, actionTxt: AppStrings.retry),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
