import 'package:get/get.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/notification/getx/notification_controller.dart';

class NotificationBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<NotificationController>(
        NotificationController(),
    );
  }

}