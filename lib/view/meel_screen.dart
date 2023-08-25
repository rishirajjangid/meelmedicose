import 'package:flutter/material.dart';

import 'package:meelmedicose/view_models/services/meel_services.dart';

import '../res/assets/image_assets.dart';

class MeelScreen extends StatefulWidget {
  const MeelScreen({super.key});

  @override
  State<MeelScreen> createState() => _MeelScreenState();
}

class _MeelScreenState extends State<MeelScreen> {
  MeelServices meelServices = MeelServices();
  @override
  void initState() {
    super.initState();
    meelServices.isLogin();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 130,
                  width: 280,
                  child: Image.asset(
                    ImageAssets.logo,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 50),
              const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
