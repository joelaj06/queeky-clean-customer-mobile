import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/routes/app_routes.dart';
import 'package:queeky_clean/core/presentation/routes/pages.dart';

import '../presentation/theme/app_light_theme.dart';
import '../presentation/theme/app_theme.dart';
class QueekyCleanApp extends StatelessWidget {
  const QueekyCleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (  BuildContext context,
          Widget? child,) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Marketline StoreFront',
          theme: AppTheme(AppLightTheme()).data,
          getPages: Pages.pages,
          initialRoute:  AppRoutes.onboarding
      ),
    );
  }
}
