import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/onboarding/screens/onboarding_screen.dart';
import 'package:queeky_clean/core/presentation/routes/app_routes.dart';
import 'package:queeky_clean/features/authentication/presentation/login/getx/login_bindings.dart';
import 'package:queeky_clean/features/authentication/presentation/login/screens/login_screen.dart';
import 'package:queeky_clean/features/authentication/presentation/signup/getx/signup_bindings.dart';
import 'package:queeky_clean/features/authentication/presentation/signup/screens/signup_screen.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/base/screens/base_screen.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/cart/getx/cart_bindings.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/cart/screens/cart_screen.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/home/getx/home_bindings.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/home/screens/home_screen.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/notification/getx/notification_bindings.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/orders/getx/order_bindings.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/orders/screens/order_preview_screen.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/orders/screens/order_screen.dart';

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
    GetPage<AppRoutes>(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: SignupBindings(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      bindings: <Bindings>[
        HomeBindings(),
      ],
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
      binding: CartBindings(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.base,
      page: () => const BaseScreen(),
      bindings: <Bindings>[
        OrderBindings(),
        HomeBindings(),
        CartBindings(),
        NotificationBindings(),
      ],
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.orders,
      page: () => const OrderScreen(),
      binding: OrderBindings(),
    ),
    GetPage<AppRoutes>(
      name: AppRoutes.orderPreview,
      page: () => const OrderPreviewScreen(),
      binding: OrderBindings(),
    ),
  ];
}
