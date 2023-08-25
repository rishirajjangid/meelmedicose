import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/signup/signup_screen_model.dart';

class InputSPPincodeWidget extends StatelessWidget {
  InputSPPincodeWidget({super.key});
  final signupSM = Get.put(SignUpScreenModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signupSM.pincodeController.value,
      focusNode: signupSM.pincodeFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackbar('Pincode', 'Enter pincode');
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, signupSM.pincodeFocusNode.value,
            signupSM.pincodeFocusNode.value);
      },
      decoration: InputDecoration(
          label: Text(
            'Pincode'.tr,
          ),
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: const Icon(LineAwesomeIcons.city)),
      keyboardType: TextInputType.phone,
    );
  }
}
