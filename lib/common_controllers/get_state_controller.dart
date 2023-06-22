import 'package:get/get.dart';
import 'package:github_api_fetch/features/first%20page/models/user_model.dart';
import 'package:github_api_fetch/features/home%20page/models/repos_model.dart';

class UserController extends GetxController {
  Rx<UserModel?> userModel = Rx<UserModel?>(null);
  Rx<List<ReposModel>?> userRepos = Rx<List<ReposModel>?>(null);

  void initUser(UserModel user) {
    userModel.value = user;
  }

  void initReposList(List<ReposModel>? repos) {
    userRepos.value = repos ?? [];
  }
}
