import 'package:flutter/material.dart';
import 'package:github_api_fetch/constants/app_values.dart';

class AppHelpers {
  //function to unfocus text fields
  static void unfocusNodes(List<FocusNode> nodes) {
    for (FocusNode node in nodes) {
      node.unfocus();
    }
  }

  //function to show dialog
  static void showMsgDialog(context, Widget content) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Text(
                    'X',
                    style: TextStyle(
                      fontSize: AppValues.fontSize_20,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 8),
            content: content,
          ));
}
