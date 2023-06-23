import 'package:flutter/material.dart';
import 'package:github_api_fetch/common_controllers/get_state_controller.dart';
import 'package:github_api_fetch/constants/app_strings.dart';
import 'package:github_api_fetch/constants/app_values.dart';
import 'package:github_api_fetch/features/home%20page/widgets/filter.dart';
import 'package:github_api_fetch/features/home%20page/widgets/user_image.dart';

import '../../../core/enums/view_mode_enum.dart';
import 'body_content.dart';

SafeArea buildBody(UserController userController) {
  ViewMode viewMode = ViewMode.list;
  print(viewMode);
  return SafeArea(
    child: StatefulBuilder(
      builder: (context, setState) => Column(
        children: [
          //appbar
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: AppValues.narrowBorder),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppValues.bodyPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //view mode switch
                  IconButton(
                    onPressed: () {
                      viewMode == ViewMode.list
                          ? viewMode = ViewMode.grid
                          : viewMode = ViewMode.list;
                      setState(
                        () {},
                      );
                    },
                    icon: Icon(
                      viewMode == ViewMode.list ? Icons.grid_view : Icons.list,
                    ),
                  ),
                  Filter(),
                  Expanded(
                      child: buildUserInfo(userController.userModel.value)),
                ],
              ),
            ),
          ),
          Expanded(child: buildBodyContent(userController, viewMode)),
        ],
      ),
    ),
  );
}

Row buildUserInfo(user) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.min,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              user!.name ?? '',
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '${user!.followers > 999 ? '${user!.followers / 1000}K' : user!.followers ?? '0'} ${AppStrings.followers}',
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
      UserImage(
        imgURL: user.avatarUrl ?? '',
        width: AppValues.repoListTileLeadingWidth,
        padding: AppValues.repoListTileLeadingImgPadding,
        clipRadius: AppValues.repoListTileLeadingImgClipR,
      ),
    ],
  );
}
