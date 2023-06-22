import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api_fetch/common_controllers/get_state_controller.dart';
import 'package:github_api_fetch/constants/app_strings.dart';
import 'package:github_api_fetch/features/home%20page/controllers/home_controler.dart';
import 'package:github_api_fetch/utils/helper_function.dart';

import '../widgets/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HomeController()
            .fetchUserRepo(userController.userModel.value!.login),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildBody(userController);
          }
          if (snapshot.hasError) {
            return Center(
              child: AppHelpers.exceptionToErrorWidget(snapshot.error!,
                  onAction: () {
                setState(() {});
              }, actionTxt: AppStrings.retry),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

// Obx buildBody(List<ReposModel> repoList) {
//   return Obx(
//     () => ListView.builder(
//       padding: EdgeInsets.all(AppValues.bodyPadding),
//       itemCount: repoList.length,
//       itemBuilder: (context, index) {
//         final repo = repoList[index];
//         return ListTile(
//           title: Text(
//             repo.name ?? '',
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text(
//             repo.owner!.login ?? '',
//             style: const TextStyle(
//               color: Colors.grey,
//             ),
//           ),
//           leading: SizedBox(
//             width: 20,
//             child: CachedNetworkImage(
//               imageUrl: "https://avatars.githubusercontent.com/u/55094965?v=4",
//               placeholder: (context, url) => LinearProgressIndicator(),
//               errorWidget: (context, url, error) =>
//                   Image.asset(AppPaths.personPlaceholder),
//               fit: BoxFit.contain,
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
