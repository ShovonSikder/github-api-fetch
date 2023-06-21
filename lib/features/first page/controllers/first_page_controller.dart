import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:github_api_fetch/constants/app_strings.dart';
import 'package:github_api_fetch/constants/http_codes.dart';
import 'package:github_api_fetch/data/api/api_clients.dart';
import 'package:github_api_fetch/features/first%20page/models/user_model.dart';

class FirstPageController {
  final apiClients = ApiClients();
  fetchUser(username) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      final response = await apiClients.fetchUser(username);

      if (response.statusCode == HttpCodes.success) {
        log(response.data.toString());
        return UserModel.fromJson(response.data);
      } else {
        print(response.data);
      }
    } else {
      throw SocketException(AppStrings.noInternet);
    }
  }
}
