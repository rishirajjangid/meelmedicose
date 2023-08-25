import 'dart:async';

import 'package:get/get.dart';
import 'package:meelmedicose/view_models/controller/user_preference/user_preference_screen_model.dart';

import '../../res/routes/routes_name.dart';

class MeelServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      print(value.token);
      // print(value.isLogin);
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(
          const Duration(seconds: 1),
          () => Get.toNamed(RouteName.loginScreen),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => Get.toNamed(RouteName.homeScreen),
        );
      }
    });
  }
}
