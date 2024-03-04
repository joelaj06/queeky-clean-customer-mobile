import 'package:get/get.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/products/getx/products_controller.dart';

class ProductBindings extends Bindings{
  @override
  void dependencies() {
   Get.put<ProductsController>(
     ProductsController(),
   );
  }

}