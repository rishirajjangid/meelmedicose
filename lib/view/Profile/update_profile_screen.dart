import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:meelmedicose/view/Profile/picker_controller/image_picker_controller.dart';
import 'package:meelmedicose/view/home/home_screen.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImagePickerController controller = Get.put(ImagePickerController());

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                LineAwesomeIcons.angle_left,
                size: 25,
              ),
              color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Obx(() {
                  return Column(
                    children: [
                      CircleAvatar(
                          radius: 55.0,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 15.0,
                                child: IconButton(
                                    onPressed: () {
                                      controller.getImage();
                                    },
                                    icon: Icon(LineAwesomeIcons.camera,
                                        size: 15, color: Color(0xFF404040)))),
                          ),
                          backgroundImage: controller.imagePath.isNotEmpty
                              ? FileImage(File(controller.imagePath.toString()))
                              : null),
                    ],
                  );
                }),

                const SizedBox(height: 50),

                // -- Form Fields
                Form(
                    child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        label: Text("FullName"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: Icon(LineAwesomeIcons.user)),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      label: Text('Email'),
                      prefixIcon: Icon(LineAwesomeIcons.envelope_1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      label: Text("PhoneNo"),
                      prefixIcon: Icon(LineAwesomeIcons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      label: const Text("Password"),
                      prefixIcon: const Icon(Icons.fingerprint),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      suffixIcon: IconButton(
                          icon: const Icon(LineAwesomeIcons.eye_slash),
                          onPressed: () {}),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // -- Form Submit Button
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const HomeScreen()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF37a497),
                        // side: BorderSide.none,
                        // shape: const StadiumBorder()
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: const Text('Seva',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(height: 20),
                ]))
              ],
            ),
          ),
        ));
  }
}
