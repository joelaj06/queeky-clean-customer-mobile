import 'package:get/get.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/orders/getx/order_controller.dart';

class OrderBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<OrderController>(
      OrderController(),
    );
  }

}