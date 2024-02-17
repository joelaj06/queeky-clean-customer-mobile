import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/onboarding/screens/onboarding_screen.dart';
import 'package:queeky_clean/core/presentation/routes/app_routes.dart';
import 'package:queeky_clean/features/authentication/presentation/login/getx/login_bindings.dart';
import 'package:queeky_clean/features/authentication/presentation/login/screens/login_screen.dart';

class Pages {
  static List<GetPage<AppRoutes>> pages = <GetPage<AppRoutes>>[
    GetPage<AppRoutes>(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
  ];
}
