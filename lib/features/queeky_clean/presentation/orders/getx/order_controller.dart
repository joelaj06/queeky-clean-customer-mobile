import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class OrderController extends GetxController{

  //reactive variables
  RxString query = ''.obs;

  //text editing controllers
  final Rx<TextEditingController> queryTextEditingController =
      TextEditingController().obs;


  void clearSearchField() {
    queryTextEditingController.value.text = '';
    query('');
  }

  void onProductSearchInputChanged(String? value) {
    query(value);
  }


}