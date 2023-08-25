import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meelmedicose/res/colors/app_color.dart';

import 'package:meelmedicose/res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        //title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColor.appColor),
            // fontFamily: 'Raleway'
            textTheme: GoogleFonts.poppinsTextTheme()),
        getPages: AppRoutes.appRoutes());
  }
}
