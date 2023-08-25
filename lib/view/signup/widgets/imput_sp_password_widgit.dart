import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:meelmedicose/view_models/controller/signup/signup_screen_model.dart';

import '../../../utils/utils.dart';

class InputSPPasswordWidget extends StatefulWidget {
  const InputSPPasswordWidget({super.key});

  @override
  State<InputSPPasswordWidget> createState() => _InputSPPasswordWidgetState();
}

class _InputSPPasswordWidgetState extends State<InputSPPasswordWidget> {
  final signupSM = Get.put(SignUpScreenModel());
  final _fomfield = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _fomfield,
      controller: signupSM.sppasswordController.value,
      focusNode: signupSM.sppasswordFocusNode.value,
      obscureText: passToggle,
      // obscuringCharacter: '*',

      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackbar('Password', 'Enter password');
        }
        return null;
      },
      onFieldSubmitted: (value) {
        // Utils.fieldFocusChange(context, loginSM.emailFocusNode.value, loginSM.passwordFocusNode.value)
      },
      decoration: InputDecoration(
        label: Text(
          'Password'.tr,
        ),
        prefixIcon: const Icon(LineAwesomeIcons.lock),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              passToggle = !passToggle;
            });
          },
          child: Icon(passToggle ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
