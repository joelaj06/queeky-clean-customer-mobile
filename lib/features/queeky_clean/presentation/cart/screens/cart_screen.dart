import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/cart/getx/cart_controller.dart';
class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Cart'),
      ),
    );
  }
}
