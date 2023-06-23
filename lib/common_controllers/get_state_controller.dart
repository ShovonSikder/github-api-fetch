import 'package:get/get.dart';
import 'package:github_api_fetch/core/enums/filter_enum.dart';
import 'package:github_api_fetch/features/first%20page/models/user_model.dart';
import 'package:github_api_fetch/features/home%20page/models/repos_model.dart';

class UserController extends GetxController {
  Rx<UserModel?> userModel = Rx<UserModel?>(null);
  Rx<List<ReposModel>?> userRepos = Rx<List<ReposModel>?>(null);
  List<ReposModel>? tempRepos;

  void initUser(UserModel user) {
    userModel.value = user;
  }

  void initReposList(List<ReposModel>? repos, {isApi = false}) {
    userRepos.value = repos ?? [];
    if (isApi) {
      //to keep a copy of initial repo list.
      tempRepos = [...repos ?? []];
    }
  }

  void filter(RepoFilters filter) {
    if (userRepos.value != null && userRepos.value!.isNotEmpty) {
      if (filter == RepoFilters.all) {
        initReposList([...tempRepos ?? []]);
      } else if (filter == RepoFilters.byDate) {
        userRepos.value!.sort(
          (a, b) => (a.createdAt ?? '').compareTo(b.createdAt ?? ''),
        );
        initReposList([...userRepos.value ?? []]);
      } else if (filter == RepoFilters.byName) {
        userRepos.value!.sort(
          (a, b) => (a.name ?? '').compareTo(b.name ?? ''),
        );
        initReposList([...userRepos.value ?? []]);
      }
      print(userRepos.value);
    }
    //others filter
  }
}
