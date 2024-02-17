import 'package:get/get.dart';
import 'package:queeky_clean/features/authentication/presentation/login/getx/login_controller.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(),
    );
  }

}