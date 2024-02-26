import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/orders/screens/order_preview_screen.dart';

import '../../../../authentication/data/models/response/user/user_response.dart';
import '../../../data/models/response/orders/order_response.dart';
import '../../../data/models/response/product/product_response.dart';

class OrderController extends GetxController {
  //reactive variables
  RxString query = ''.obs;
  RxString selectedDate = DateTime.now().toIso8601String().obs;
  RxDouble totalDue = (0.0).obs;

  //text editing controllers
  final Rx<TextEditingController> queryTextEditingController =
      TextEditingController().obs;



  @override
  void onInit() {
    getOrderTotalAmount();
    super.onInit();
  }




  void getOrderTotalAmount() {
    final double total = order.items.fold(
        0, (double prev, Product prod) => prev += (prod.quantity * prod.price));
    totalDue(total);
  }

  void navigateToOrderPreviewScreen() {
    Get.to(() => const OrderPreviewScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 500));
  }

  void clearSearchField() {
    queryTextEditingController.value.text = '';
    query('');
  }

  void onProductSearchInputChanged(String? value) {
    query(value);
  }

  void onDateSelected(BuildContext context) async {
    final DateTime? response = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(DateTime.now().year),
    );
    if (response != null) {
      selectedDate(response.toIso8601String());
    }
  }

  final Order order = const Order(
    id: 1,
    orderCode: 'ORD123',
    totalPrice: 62.93,
    discount: 5.0,
    note: 'Handle with care',
    items: <Product>[
      Product(id: 1, name: 'T-Shirt', price: 5.99, quantity: 3),
      Product(id: 2, name: 'Jeans', price: 12.99, quantity: 2),
      Product(id: 3, name: 'Bed Sheets', price: 9.99, quantity: 1),
    ],
    customer: User(
        id: 101,
        name: 'John Doe',
        phone: '+1234567890',
        email: 'john@example.com'),
    discountType: 'Percentage',
    pickupDate: '2024-02-25',
    deliveryDate: '2024-02-28',
    status: 'Pending',
    couponCode: 'SALE20',
  );
}
