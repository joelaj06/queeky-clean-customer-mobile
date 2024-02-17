import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/routes/app_routes.dart';

class LoginController extends GetxController{

  //reactive variables
  RxString email = ''.obs;
  RxString password = ''.obs;



  void onUserLogin(){
    Get.toNamed<dynamic>(AppRoutes.base);
  }

  void onEmailInputChanged(String value) {
    email(value);
  }

  void onPasswordInputChanged(String value) {
    password(value);
  }

  String? validateEmail(String? email) {
    String? errorMessage;
    if (email!.isEmpty) {
      errorMessage = 'Please enter email address';
    } else if (!email.contains('@')){
      errorMessage = 'Please enter a valid email';
    }
    return errorMessage;
  }

  String? validatePassword(String? password) {
    String? errorMessage;
    if (password!.isEmpty) {
      errorMessage = 'Please enter password';
    }else if (password.length < 8){
      errorMessage = 'Password should be more than 8 characters';
    }
    return errorMessage;
  }


  RxBool get formIsValid =>
      (validateEmail(email.value) == null &&
          validatePassword(password.value) == null).obs;




}