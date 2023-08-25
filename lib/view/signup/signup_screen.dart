import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meelmedicose/view/login/login_screen.dart';
import 'package:meelmedicose/view/signup/widgets/imput_sp_contact_widget.dart';
import 'package:meelmedicose/view/signup/widgets/imput_sp_email_widget.dart';
import 'package:meelmedicose/view/signup/widgets/imput_sp_fullname_widget.dart';
import 'package:meelmedicose/view/signup/widgets/imput_sp_password_widgit.dart';
import 'package:meelmedicose/view/signup/widgets/imput_sp_pincode_widget.dart';

import 'package:meelmedicose/view/signup/widgets/signup_button.dart';

import 'package:meelmedicose/view_models/controller/signup/signup_screen_model.dart';

import '../../res/assets/image_assets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signupSM = Get.put(SignUpScreenModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      //   title: Text('Sign Up'.tr),
      // ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 130,
                  width: 240,
                  child: Image.asset(
                    ImageAssets.logo,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  Text(
                    ' SignUp Now',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Please fill the details for Sign Up',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 40),

              Form(
                key: _formkey,
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      InputSPFullNameWidget(),
                      const SizedBox(height: 20),
                      InputSPEmailWidget(),
                      const SizedBox(height: 20),
                      const InputSPPasswordWidget(),
                      const SizedBox(height: 20),
                      InputSPContactlWidget(),
                      const SizedBox(height: 20),
                      InputSPPincodeWidget(),
                    ],
                  ),
                ),
              ),

              // const SizedBox(height: 40),
              // LoginButtonWidget(
              //   formkey: _formkey,
              // ),
              const SizedBox(height: 40),
              SignUpButton(formkey: _formkey),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Text(
                      'Log in instead!',
                      style: TextStyle(
                          color: Color(0xFF37a494),
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
