import 'package:get/get.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/cart/getx/cart_controller.dart';

class CartBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<CartController>(
      CartController(),
    );
  }

}