import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_fetch/common_controllers/get_state_controller.dart';
import 'package:github_api_fetch/data/local/app_shared_pref.dart';
import 'package:github_api_fetch/utils/helper_function.dart';

import '../widgets/app_bar.dart';
import '../widgets/body.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _usernameController = TextEditingController();
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Get.put(UserController());
    //this init should be at launcher page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppSharedPref.getThemeMode().then((value) {
        Get.changeThemeMode(value == 0 ? ThemeMode.light : ThemeMode.dark);
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppHelpers.unfocusNodes([_focusNode]);
      },
      child: Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(context, _usernameController, _focusNode, _formKey),
      ),
    );
  }
}
