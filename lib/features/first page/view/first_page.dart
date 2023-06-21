import 'package:flutter/material.dart';
import 'package:github_api_fetch/utils/helper_function.dart';

import '../widgets/body.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _usernameController = TextEditingController();
  final _focusNode = FocusNode();

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
        body: buildBody(context, _usernameController, _focusNode),
      ),
    );
  }
}
