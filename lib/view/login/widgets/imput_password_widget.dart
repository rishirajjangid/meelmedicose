import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:meelmedicose/view_models/controller/login/login_screen_model.dart';

import '../../../utils/utils.dart';

class InputPasswordWidget extends StatefulWidget {
  const InputPasswordWidget({super.key});

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  final loginSM = Get.put(LoginScreenModel());

  final _fomfield = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //  keyboardType: TextInputType.visiblePassword,
      key: _fomfield,
      controller: loginSM.passwordController.value,
      focusNode: loginSM.passwordFocusNode.value,
      obscureText: passToggle,

      // obscuringCharacter: '*',

      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, loginSM.emailFocusNode.value,
            loginSM.passwordFocusNode.value);
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
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Enter password';
      //   } else if (passwordController.text.length < 6) {
      //     // return const HomeScreen().toString();
      //     return "Password Length Should  be more than 6 characters";
      //   }
      //   // return const HomeScreen().toString();
      // },
    );
  }
}
