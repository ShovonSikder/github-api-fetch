import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_api_fetch/common%20widgets/error_msg.dart';
import 'package:github_api_fetch/constants/app_paths.dart';
import 'package:github_api_fetch/constants/app_strings.dart';
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

  //convert exceptions to readable messages
  static Widget exceptionToErrorWidget(Object e,
      {required Function() onAction, String actionTxt = AppStrings.close}) {
    switch (e.runtimeType) {
      case SocketException:
        return ErrorMsg(
          errImgPath: AppPaths.brokenRocketImg,
          msg: AppStrings.noInternet,
          subMsg: AppStrings.noInternetSuggestion,
          action: OutlinedButton(
            onPressed: onAction,
            child: Text(actionTxt),
          ),
        );
      case DioException:
        DioException exp = e as DioException;
        switch (exp.response != null ? 0 : 1) {
          case 0:
            switch (exp.response!.statusCode) {
              case 404:
                return ErrorMsg(
                  errImgPath: AppPaths.telescopeImg,
                  msg: AppStrings.invalidUsername,
                  subMsg: AppStrings.invalidUsernameSuggestion,
                  action: OutlinedButton(
                    onPressed: onAction,
                    child: Text(actionTxt),
                  ),
                );
              //TODO:other cases of dio
            }
        }
    }
    return ErrorMsg(
      msg: AppStrings.somethingWrong,
      subMsg: AppStrings.somethingWrongSuggestion,
      action: OutlinedButton(
        onPressed: onAction,
        child: Text(actionTxt),
      ),
    );
  }
}
