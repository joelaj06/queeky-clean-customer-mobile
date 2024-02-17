import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/notification/getx/notification_controller.dart';
class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Notifications'),
      ),
    );
  }
}
