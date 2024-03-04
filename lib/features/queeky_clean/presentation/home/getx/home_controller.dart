import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/routes/app_routes.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/orders/screens/order_screen.dart';

class HomeController extends GetxController {
  void navigateToProductsScreen(String image) {
    Get.toNamed(AppRoutes.products, arguments: image);
  }

  void navigateToOrdersScreen() {
    Get.to(() => const OrderScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(
          milliseconds: 500,
        ));
  }
}
