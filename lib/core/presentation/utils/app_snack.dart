import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class AppSnack{

  static void show({required String title,
  required String message,IconData? icon,Color? color}){
    Get.showSnackbar(
       GetSnackBar(
        title: title,
        message: message,
        duration: const Duration(milliseconds: 1000),
         icon:   Icon( icon ?? Iconsax.tick_circle,
         color: color ?? Colors.white,),
         snackStyle: SnackStyle.GROUNDED,
      ),
    );
  }
}