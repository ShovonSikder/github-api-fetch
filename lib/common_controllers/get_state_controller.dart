import 'package:get/get.dart';
import 'package:github_api_fetch/features/first%20page/models/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel?> userModel = Rx<UserModel?>(null);
  void initUser(UserModel user) {
    userModel.value = user;
  }
}
