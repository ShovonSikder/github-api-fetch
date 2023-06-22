import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_api_fetch/common%20widgets/custom_outline_button.dart';
import 'package:github_api_fetch/common%20widgets/error_msg.dart';
import 'package:github_api_fetch/constants/app_paths.dart';
import 'package:github_api_fetch/constants/app_strings.dart';
import 'package:github_api_fetch/constants/app_values.dart';
import 'package:github_api_fetch/core/exceptions/empty_value_exception.dart';

class AppHelpers {
  //function to unfocus text fields
  static void unfocusNodes(List<FocusNode> nodes) {
    for (FocusNode node in nodes) {
      node.unfocus();
    }
  }

  //function to show dialog
  static void showMsgDialog(context, Widget content, {largeDialog = false}) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                insetPadding: largeDialog
                    ? EdgeInsets.all(AppValues.largeDialogInsetPadding)
                    : EdgeInsets.symmetric(horizontal: 40, vertical: 24),
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
          action: CustomOutlineButton(
            onPressed: onAction,
            txt: actionTxt,
          ),
        );
      case EmptyValueException:
        return ErrorMsg(
          errImgPath: AppPaths.emptyFile,
          msg: AppStrings.empty,
          subMsg: AppStrings.emptySuggestion,
          action: CustomOutlineButton(
            onPressed: onAction,
            txt: actionTxt,
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
                  action: CustomOutlineButton(
                    onPressed: onAction,
                    txt: actionTxt,
                  ),
                );
              case 403:
                return ErrorMsg(
                  errImgPath: AppPaths.restrictedImg,
                  msg: AppStrings.accessDenied,
                  subMsg: AppStrings.accessDeniedSuggestion,
                  action: CustomOutlineButton(
                    onPressed: onAction,
                    txt: actionTxt,
                  ),
                );
              case 500:
                return ErrorMsg(
                  errImgPath: AppPaths.serverErrorImg,
                  msg: AppStrings.internalServerError,
                  subMsg: AppStrings.accessDeniedSuggestion,
                  action: CustomOutlineButton(
                    onPressed: onAction,
                    txt: actionTxt,
                  ),
                );
              //TODO:other cases of dio
            }
        }
    }
    return ErrorMsg(
      msg: AppStrings.somethingWrong,
      subMsg: AppStrings.somethingWrongSuggestion,
      action: CustomOutlineButton(
        onPressed: onAction,
        txt: actionTxt,
      ),
    );
  }
}
