import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/round_button.dart';
import '../../../view_models/controller/login/login_screen_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final formkey;
  LoginButtonWidget({super.key, required this.formkey});
  final loginSM = Get.put(LoginScreenModel());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
          height: 40,
          width: 180,
          title: 'Login'.tr,
          loading: loginSM.loading.value,
          onPress: () {
            if (formkey.currentState!.validate()) {
              // print("Data Added Successfully");
              // printError();
              loginSM.loginApi();
              emailController.clear();
              passwordController.clear();
            }
          },
        ));
  }
}
