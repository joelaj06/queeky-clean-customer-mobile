import 'package:get/get.dart';

class SignupController extends GetxController{

  //reactive variables
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString name = ''.obs;
  RxString phone = ''.obs;
  RxString confirmPassword = ''.obs;


  void onEmailInputChanged(String value) {
    email(value);
  }

  void onPasswordInputChanged(String value) {
    password(value);
  }

  void onNameInputChanged(String value){
    name(value);
  }

  void onConfirmPasswordInputChanged(String value){
    confirmPassword(value);
  }

  void onContactInputChanged(String value){
    phone(value);
  }


  String? validatePasswordConfirmation(String value){
    String? errorMessage;
    if(password.value != value){
      errorMessage = 'Password do not match';
    }
    return errorMessage;
  }


  String? validateName(String value){
    String? errorMessage;
    if(name.isEmpty){
      errorMessage = 'Name field cannot be empty';
    }
    return errorMessage;
  }

  String? validateContact(String? contact) {
    String? errorMessage;
    if (contact!.isNotEmpty) {
      if(contact.length < 10){
        errorMessage = 'Phone number must be 10 digits';
      }
    }else{
      errorMessage = 'Please enter a phone number';
    }
    return errorMessage;
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
          validatePassword(password.value) == null &&
          validatePasswordConfirmation(confirmPassword.value) == null &&
      validateContact(phone.value) == null &&
      validateName(name.value) == null).obs;
}