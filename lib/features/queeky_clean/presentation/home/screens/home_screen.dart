import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/home/getx/home_controller.dart';
class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
