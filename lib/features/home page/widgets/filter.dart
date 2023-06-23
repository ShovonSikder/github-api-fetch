import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:github_api_fetch/common_controllers/get_state_controller.dart';
import 'package:github_api_fetch/constants/app_values.dart';
import 'package:github_api_fetch/core/enums/filter_enum.dart';

import '../../../constants/app_strings.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RepoFilters repoFilters = RepoFilters.all;
  final filters = [
    PopupMenuItem(
      value: RepoFilters.all,
      child: Text(AppStrings.all),
    ),
    PopupMenuItem(
      value: RepoFilters.byDate,
      child: Text(AppStrings.byDate),
    ),
    PopupMenuItem(
      value: RepoFilters.byName,
      child: Text(AppStrings.byName),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => filters,
      position: PopupMenuPosition.under,
      onSelected: (value) {
        setState(() {
          repoFilters = value;
          EasyLoading.show(status: '${AppStrings.filtering}...');
          Get.find<UserController>().filter(value);
          EasyLoading.dismiss();
        });
        print(value);
      },
      tooltip: "",
      child: Container(
        padding: EdgeInsets.all(AppValues.commonPadding).copyWith(
            bottom: AppValues.commonPadding / 2,
            top: AppValues.commonPadding / 2),
        decoration: BoxDecoration(
            border: Border.all(width: AppValues.containerButtonBorder),
            borderRadius:
                BorderRadius.circular(AppValues.containerButtonBorderRadius)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(repoFilters == RepoFilters.all
                ? AppStrings.all
                : repoFilters == RepoFilters.byDate
                    ? AppStrings.byDate
                    : AppStrings.byName),
            const Icon(Icons.sort),
          ],
        ),
      ),
    );
  }
}
