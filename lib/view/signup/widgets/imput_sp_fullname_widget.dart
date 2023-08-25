import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../utils/utils.dart';
import '../../../view_models/controller/signup/signup_screen_model.dart';

class InputSPFullNameWidget extends StatelessWidget {
  InputSPFullNameWidget({super.key});
  final signupSM = Get.put(SignUpScreenModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupSM.fullnameController.value,
      focusNode: signupSM.fullnameFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackbar('Email', 'Enter full name');
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, signupSM.fullnameFocusNode.value,
            signupSM.fullnameFocusNode.value);
      },
      decoration: InputDecoration(
          label: Text(
            'Full Name'.tr,
          ),
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: const Icon(LineAwesomeIcons.user)),
    );
  }
}
