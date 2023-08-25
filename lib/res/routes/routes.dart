import 'package:get/get.dart';
import 'package:meelmedicose/res/routes/routes_name.dart';
import 'package:meelmedicose/view/Profile/update_profile_screen.dart';
import 'package:meelmedicose/view/home/home_screen.dart';
import 'package:meelmedicose/view/login/login_screen.dart';
import 'package:meelmedicose/view/meel_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.meelScreen,
          page: () => const MeelScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.homeScreen,
          page: () => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.updateprofilescreen,
          page: () => const UpdateProfileScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
