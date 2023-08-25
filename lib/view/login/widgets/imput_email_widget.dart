import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:meelmedicose/view_models/controller/login/login_screen_model.dart';

import '../../../utils/utils.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});
  final loginSM = Get.put(LoginScreenModel());

  // final _fomfield = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: loginSM.emailController.value,
      focusNode: loginSM.emailFocusNode.value,
      validator: (value) {
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!);
        if (value.isEmpty) {
          return "Enter Email";
        } else if (!emailValid) {
          return "Enter Valid Email";
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, loginSM.emailFocusNode.value,
            loginSM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          label: Text(
            'Email'.tr,
          ),
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: const Icon(LineAwesomeIcons.envelope)),
    );
  }
}
