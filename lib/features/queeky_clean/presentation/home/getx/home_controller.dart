import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/routes/app_routes.dart';
import 'package:queeky_clean/features/queeky_clean/data/models/response/category/category.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/orders/screens/order_screen.dart';

import '../../../../../core/presentation/utils/app_asset_images.dart';

class HomeController extends GetxController {



  void navigateToProductsScreen(Category category) {
    Get.toNamed(AppRoutes.products, arguments: category);
  }

  void navigateToOrdersScreen() {
    Get.to(() => const OrderScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(
          milliseconds: 500,
        ));
  }

  final List<Category> categories = [
    const Category(
      id: 1,
      name: 'Washing',
      image: AppAssetImages.washingMachine,
    ),  const Category(
      id: 2,
      name: 'Steam Press',
      image: AppAssetImages.steamPress,
    ),  const Category(
      id: 1,
      name: 'Dry Cleaning',
      image: AppAssetImages.cleaningSpray,
    ),  const Category(
      id: 1,
      name: 'Deep Cleaning',
      image: AppAssetImages.deepClean,
    ),  const Category(
      id: 1,
      name: 'Formal Wash',
      image: AppAssetImages.cleanClothes,
    ),  const Category(
      id: 1,
      name: 'Others',
      image: AppAssetImages.brush,
    ),
  ];
}
