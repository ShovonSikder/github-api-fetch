import 'package:flutter/material.dart';
import 'package:github_api_fetch/constants/app_paths.dart';
import 'package:github_api_fetch/constants/app_values.dart';

class ErrorMsg extends StatelessWidget {
  String errImgPath;
  String msg;
  String subMsg;
  Widget action;

  ErrorMsg({
    super.key,
    this.errImgPath = AppPaths.errorImg,
    required this.msg,
    this.subMsg = '',
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            errImgPath,
            height: AppValues.errorImgHeight,
            width: AppValues.errorImgWidth,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          msg,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppValues.fontSize_20,
          ),
        ),
        Text(
          subMsg,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: action,
        ),
      ],
    );
  }
}
