import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_fetch/common_controllers/get_state_controller.dart';
import 'package:github_api_fetch/constants/app_values.dart';
import 'package:github_api_fetch/features/home%20page/models/repos_model.dart';

import 'user_image.dart';

class Details extends StatelessWidget {
  final ReposModel repo;
  const Details({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserImage(
              imgURL: repo.owner!.avatarUrl ?? '',
              width: 150,
              padding: 0,
              clipRadius: 100),
          Text(
            '${Get.find<UserController>().userModel.value!.name}',
            style: TextStyle(
              fontSize: AppValues.fontSize_20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text(
                      '${repo.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('${repo.language}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star_border),
                        Text('${repo.stargazersCount}'),
                      ],
                    ),
                    contentPadding: EdgeInsets.all(0),
                  ),
                  Text('${repo.description}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
