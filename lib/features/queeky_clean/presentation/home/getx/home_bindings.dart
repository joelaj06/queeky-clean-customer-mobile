import 'package:get/get.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/home/getx/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
    );
  }

}