import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/signup/signup_screen_model.dart';

class InputSPContactlWidget extends StatelessWidget {
  InputSPContactlWidget({super.key});
  final signupSM = Get.put(SignUpScreenModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupSM.contactController.value,
      focusNode: signupSM.contactFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackbar('Contact', 'Enter contact');
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, signupSM.contactFocusNode.value,
            signupSM.contactFocusNode.value);
      },
      decoration: InputDecoration(
          label: Text(
            'Contact'.tr,
          ),
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: const Icon(LineAwesomeIcons.phone)),
      keyboardType: TextInputType.phone,
    );
  }
}
