import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:github_api_fetch/data/api/api_clients.dart';
import 'package:github_api_fetch/features/home%20page/models/repos_model.dart';

import '../../../common_controllers/get_state_controller.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/http_codes.dart';

class HomeController {
  final apiClients = ApiClients();

  fetchUserRepo(username) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      final response = await apiClients.fetchUserRepo(username);

      if (response.statusCode == HttpCodes.success) {
        final repos = [];
        for (dynamic obj in response.data) {
          repos.add(ReposModel.fromJson(obj));
        }
        Get.find<UserController>().initReposList(repos.cast<ReposModel>());
        return repos;
        // return UserModel.fromJson(response.data);
      } else {
        print(response.data);
      }
    } else {
      throw SocketException(AppStrings.noInternet);
    }
  }
}
