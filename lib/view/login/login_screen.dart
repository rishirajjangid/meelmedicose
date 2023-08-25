import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meelmedicose/res/assets/image_assets.dart';
import 'package:meelmedicose/view/login/forgotpass/forgot_password.dart';
import 'package:meelmedicose/view/login/widgets/imput_email_widget.dart';
import 'package:meelmedicose/view/login/widgets/imput_password_widget.dart';
import 'package:meelmedicose/view/login/widgets/login_button_widget.dart';
import 'package:meelmedicose/view/signup/signup_screen.dart';
import 'package:meelmedicose/view_models/controller/login/login_screen_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginSM = Get.put(LoginScreenModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 130,
                  width: 280,
                  child: Image.asset(
                    ImageAssets.logo,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const Column(
                children: [
                  Text(
                    "Login Now",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Please fill the details for Login",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontStyle: FontStyle.normal),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    InputEmailWidget(),
                    const SizedBox(height: 20),
                    const InputPasswordWidget()
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Color(0xFF37a494),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              LoginButtonWidget(
                formkey: _formkey,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "No account? ",
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
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      'Create one heve!',
                      style: TextStyle(
                          color: Color(0xFF37a494),
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}









////////ffff////
// final List<String> _options = ["HOME", "CATEGORY", "CART", "PROFILE"];
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//       ),
//       body: Container(
//         color: const Color(0xFF37a494),
//         child: Center(
//             child: Text(
//           _options[_currentIndex],
//           style: const TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
//         )),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         buttonBackgroundColor: Colors.white,
//         backgroundColor: const Color(0xFF37a494),
//         //animationDuration: Duration(seconds: 1),
//         // animationCurve: Curves.bounceInOut,
//         items: const <Widget>[
//           Icon(Icons.home, color: Color(0xFF37a494), size: 30),
//           Icon(Icons.category, color: Color(0xFF37a494), size: 30),
//           Icon(Icons.card_travel, color: Color(0xFF37a494), size: 30),
//           Icon(Icons.person, color: Color(0xFF37a494), size: 30),
//           //Icon(Icons.person, color: Color(0xFF37a494)),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );