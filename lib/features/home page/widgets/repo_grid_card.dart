import 'package:flutter/material.dart';
import 'package:github_api_fetch/features/home%20page/models/repos_model.dart';

import '../../../constants/app_values.dart';
import '../../../utils/helper_function.dart';
import 'details.dart';

class RepoGridCard extends StatelessWidget {
  final ReposModel repo;
  const RepoGridCard({
    super.key,
    required this.repo,
  });

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
        margin: EdgeInsets.only(
            bottom: AppValues.repoListTileGridMargin,
            right: AppValues.repoListTileGridMargin),
        padding: EdgeInsets.all(AppValues.commonPadding),
        decoration: BoxDecoration(
          // color: Colors.grey,
          border: Border.all(width: AppValues.repoListTileBorderWidth),
          borderRadius:
              BorderRadius.circular(AppValues.repoListTileBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repo.name ?? '',
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${repo.owner!.login ?? ''} | ${repo.createdAt!.split(AppValues.repoDateSplitPatter)[0]}',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            Flexible(
              child: Text(
                repo.description ?? '',
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
