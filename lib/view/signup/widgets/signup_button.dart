import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/round_button.dart';
import '../../../view_models/controller/login/login_screen_model.dart';

class SignUpButton extends StatelessWidget {
  final formkey;
  SignUpButton({super.key, required this.formkey});
  final loginSM = Get.put(LoginScreenModel());
  // final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
          height: 40,
          width: 180,
          title: 'Sign Up'.tr,
          loading: loginSM.loading.value,
          onPress: () {
            if (formkey.currentState!.validate()) {
              loginSM.loginApi();
            }
          },
        ));
  }
}
