import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/signup/signup_screen_model.dart';

class InputSPEmailWidget extends StatelessWidget {
  InputSPEmailWidget({super.key});
  final signupSM = Get.put(SignUpScreenModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupSM.spemailController.value,
      focusNode: signupSM.spemailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackbar('Email', 'Enter email');
        }
        return null;
      },
      // onFieldSubmitted: (value) {
      //   Utils.fieldFocusChange(context, signupSM.spemailFocusNode.value,
      //       signupSM.sppasswordFocusNode.value);
      // },
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
