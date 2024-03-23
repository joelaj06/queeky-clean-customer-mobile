import 'package:get/get.dart';
import 'package:queeky_clean/core/utils/shared_preferences_wrapper.dart';

class MainBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<SharedPreferencesWrapper>(
      SharedPreferencesWrapper(),
    );
  }

}