import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenModel extends GetxController {
  final fullnameController = TextEditingController().obs;
  final spemailController = TextEditingController().obs;
  final sppasswordController = TextEditingController().obs;
  final contactController = TextEditingController().obs;
  final pincodeController = TextEditingController().obs;

  final fullnameFocusNode = FocusNode().obs;
  final spemailFocusNode = FocusNode().obs;
  final sppasswordFocusNode = FocusNode().obs;
  final contactFocusNode = FocusNode().obs;
  final pincodeFocusNode = FocusNode().obs;
}
