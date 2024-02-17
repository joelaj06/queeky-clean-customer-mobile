import 'package:get/get.dart';
import 'package:queeky_clean/features/authentication/presentation/signup/getx/signup_controller.dart';

class SignupBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<SignupController>(
      SignupController(),
    );
  }

}