import 'package:flutter/material.dart';
import 'package:github_api_fetch/features/home%20page/widgets/details.dart';
import 'package:github_api_fetch/features/home%20page/widgets/user_image.dart';
import 'package:github_api_fetch/utils/helper_function.dart';

import '../../../constants/app_values.dart';
import '../models/repos_model.dart';

class RepoListTile extends StatelessWidget {
  const RepoListTile({
    super.key,
    required this.repo,
  });

  final ReposModel repo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppHelpers.showMsgDialog(
          context,
          Details(
            repo: repo,
          ),
          largeDialog: true,
        );
      },
      borderRadius: BorderRadius.circular(AppValues.repoListTileBorderRadius),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppValues.repoListTileYMargin),
        padding:
            EdgeInsets.symmetric(horizontal: AppValues.repoListTileXPadding),
        decoration: BoxDecoration(
          // color: Colors.red,
          border: Border.all(width: AppValues.repoListTileBorderWidth),
          borderRadius:
              BorderRadius.circular(AppValues.repoListTileBorderRadius),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(AppValues.repoListTileContentPadding),
          title: Text(
            repo.name ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            repo.owner!.login ?? '',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          leading: UserImage(
            imgURL: repo.owner!.avatarUrl ?? '',
            width: AppValues.repoListTileLeadingWidth,
            padding: AppValues.repoListTileLeadingImgPadding,
            clipRadius: AppValues.repoListTileLeadingImgClipR,
          ),
          trailing:
              Text(repo.createdAt!.split(AppValues.repoDateSplitPatter)[0]),
        ),
      ),
    );
  }
}
