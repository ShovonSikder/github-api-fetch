import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_fetch/common_controllers/get_state_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
          '${userController.userModel.toJson().toString()}',
        ));
  }
}
