import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';
import 'package:queeky_clean/core/presentation/utils/app_asset_images.dart';
import 'package:queeky_clean/core/presentation/utils/app_paddings.dart';
import 'package:queeky_clean/core/presentation/utils/app_spacing.dart';
import 'package:queeky_clean/core/presentation/widgets/animated_column.dart';
import 'package:queeky_clean/core/presentation/widgets/app_button.dart';
import 'package:queeky_clean/core/presentation/widgets/app_text_input.dart';

import '../getx/signup_controller.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF0A8686),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          _buildHeader(context),
          Expanded(child: _buildFormField(context)),
        ],
      ),
    );
  }

  Widget _buildFormField(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.1,
              fit: BoxFit.cover,
              image: AssetImage(
                AppAssetImages.laundryLineArt,
              )
          )
      ),
      child: Padding(
        padding: AppPaddings.mA,
        child: SingleChildScrollView(
          child: AppAnimatedColumn(
            delay: const Duration(milliseconds: 200),
            children: <Widget>[
              const AppSpacing(v: 10,),
              AppTextInput(
                hintText: 'Full Name',
                onChanged: controller.onNameInputChanged,
                validator: controller.validateName,
              ),
              const AppSpacing(v: 10,),
              AppTextInput(
                hintText: 'Contact',
                onChanged: controller.onContactInputChanged,
                validator: controller.validateContact,
                textInputType: TextInputType.number,
              ),
              const AppSpacing(v: 10,),
              AppTextInput(
                hintText: 'Email',
                onChanged: controller.onEmailInputChanged,
                validator: controller.validateEmail,
                textInputType: TextInputType.emailAddress,
              ),
              const AppSpacing(v: 10,),
              AppTextInput(
                hintText: 'Password',
                showObscureTextToggle: true,
                obscureText: true,
                onChanged: controller.onPasswordInputChanged,
                validator: controller.validatePassword,
              ),
              const AppSpacing(v: 10,),
              AppTextInput(
                hintText: 'Confirm Password',
                showObscureTextToggle: true,
                obscureText: true,
                onChanged: controller.onConfirmPasswordInputChanged,
                validator: controller.validatePasswordConfirmation,
              ),
              const AppSpacing(v: 20,),
              Obx(() => AppButton(
                key: const Key('loginButton'),
                enabled: controller.formIsValid.value,
                onPressed: () {},
                child: const Text('Sign up'),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: AppPaddings.bodyB,
      height: context.height * 0.4,
      width: context.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: <double>[0.2, 0.2, 0.4, 0.4, 0.76, 0.76],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xFF0A8686),
            Color(0xF20A8686),
            Color(0xC70A8686),
            Color(0xAD0A8686),
            Color(0x7D0A8686),
            Color(0x730A8686)
          ],
        ),
      ),
      child: AppAnimatedColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const AppSpacing(v: 56),
          Text(
            'Create Account',
            style: context.h2.copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            'Fill out your information to register.',
            style: context.h6.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
