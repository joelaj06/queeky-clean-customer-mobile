import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/onboarding/screens/onboarding_screen.dart';
import 'package:queeky_clean/core/presentation/routes/app_routes.dart';
import 'package:queeky_clean/features/authentication/presentation/login/getx/login_bindings.dart';
import 'package:queeky_clean/features/authentication/presentation/login/screens/login_screen.dart';
import 'package:queeky_clean/features/authentication/presentation/signup/getx/signup_bindings.dart';
import 'package:queeky_clean/features/authentication/presentation/signup/screens/signup_screen.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/base/screens/base_screen.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/cart/getx/cart_bindings.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/home/getx/home_bindings.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/notification/getx/notification_bindings.dart';

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
    ), GetPage<AppRoutes>(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: SignupBindings(),
    ), GetPage<AppRoutes>(
      name: AppRoutes.base,
      page: () => const BaseScreen(),
      bindings: <Bindings>[
        HomeBindings(),
        CartBindings(),
        NotificationBindings(),
      ],
    ),
  ];
}
