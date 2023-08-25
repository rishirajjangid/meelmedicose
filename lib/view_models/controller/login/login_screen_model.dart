import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meelmedicose/models/login/user_model.dart';
import 'package:meelmedicose/repository/login_repository/login_repository.dart';
import 'package:meelmedicose/res/routes/routes_name.dart';
import 'package:meelmedicose/view_models/controller/user_preference/user_preference_screen_model.dart';

import '../../../utils/utils.dart';

class LoginScreenModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackbar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true,
        );
        userPreference.saveUser(userModel).then((value) {
          Get.delete<LoginScreenModel>();
          Get.toNamed(RouteName.homeScreen)!.then((value) {});
          Utils.snackbar('Login', 'Login successfully');
        }).onError((error, stackTrace) {});
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackbar('Error', error.toString());
    });
  }
}
