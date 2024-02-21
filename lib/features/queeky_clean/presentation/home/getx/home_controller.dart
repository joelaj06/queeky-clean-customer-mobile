import 'package:get/get.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/orders/screens/order_screen.dart';

class HomeController extends GetxController{



  void navigateToOrdersScreen(){
    Get.to(() => const OrderScreen(),
    transition: Transition.cupertinoDialog,
    duration: const Duration(milliseconds: 1000,));
  }

}