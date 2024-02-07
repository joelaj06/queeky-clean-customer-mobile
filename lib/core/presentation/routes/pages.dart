import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/onboarding/screens/onboarding_screen.dart';
import 'package:queeky_clean/core/presentation/routes/app_routes.dart';

 class Pages {
 static List<GetPage<AppRoutes>> pages = <GetPage<AppRoutes>>[
    GetPage<AppRoutes>(
        name: AppRoutes.onboarding, page: () => const OnboardingScreen(),
    ),
  ];
}
