import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme.dart';

class AppTheme {
  const AppTheme(this.colors, this.context);

  final ThemeColor colors;
  final BuildContext context;

  ThemeData get data => ThemeData(
        useMaterial3: true,
        fontFamily: AppFonts.poppins,
        primaryColorLight: colors.primary,
        primarySwatch: colors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryIconTheme: IconThemeData(
          color: colors.primary,
        ),
         colorScheme: ColorScheme.fromSwatch(
          primarySwatch: colors.primary,
          //primaryColorDark: colors.primary.shade900,
          accentColor: colors.accent,
          cardColor: colors.background,
          backgroundColor: colors.background,
          errorColor: colors.error,
          brightness: colors.brightness,
        ),
        focusColor: colors.primary,
        primaryColor: colors.primary,
        brightness: colors.brightness,
        scaffoldBackgroundColor: colors.background,
        textTheme: TextTheme(
          displaySmall: displaySmall,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          labelSmall: labelSmall,
          bodySmall: bodySmall,
          labelLarge: labelLarge,

        ),
      );

  TextStyle get h2 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: AppFonts.poppins,
      );

  TextStyle get displaySmall => TextStyle(
        fontSize: AppFontSizes.h3,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.poppins,
        color: colors.secondary,
      );

  TextStyle get headlineMedium => TextStyle(
        fontSize: AppFontSizes.h4,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.poppins,
        color: colors.secondary,
      );

  TextStyle get headlineSmall => TextStyle(
        fontSize: AppFontSizes.h5,
        fontFamily: AppFonts.poppins,
        fontWeight: FontWeight.w600,
        color: colors.secondary,
      );

  TextStyle get titleLarge => TextStyle(
        fontSize: AppFontSizes.h6,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.poppins,
        // color: colors.secondary,
        //  fontFamily: AppFonts.poppins,
      );

  TextStyle get titleMedium => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        fontFamily: AppFonts.poppins,
        /* fontSize: AppFontSizes.subtitle1,
        fontWeight: FontWeight.w400,
        color: colors.text,*/
      );

  TextStyle get titleSmall => const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1,
        fontFamily: AppFonts.poppins,

      );

  TextStyle get bodyLarge => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        /*fontSize: AppFontSizes.bodyText1,
        fontWeight: FontWeight.w600,
   */
        fontFamily: AppFonts.poppins,
        color: colors.text,
      );

  TextStyle get bodyMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        fontFamily: AppFonts.poppins,
      );

  TextStyle get bodySmall => TextStyle(
        fontSize: AppFontSizes.caption,
        color: colors.hint.shade300,
        fontFamily: AppFonts.poppins,
      );

  TextStyle get labelSmall => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colors.hint,
        letterSpacing: .4,
        fontFamily: AppFonts.poppins,
      );

  TextStyle get labelLarge => const TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.25);

  TextStyle get smallest => TextStyle(
      fontSize: AppFontSizes.smallest,
      fontWeight: FontWeight.w500,
      color: colors.text,
      letterSpacing: .7,
      fontFamily: AppFonts.poppins);
}

class AppFontSizes {
  AppFontSizes._();

  static double h3 = 48.sp.toDouble();
  static double h4 = 32.sp.toDouble();
  static double h5 = 24.sp.toDouble();
  static double h6 = 20.sp.toDouble();
  static double subtitle1 = 18.sp.toDouble(); //SEMI-BOLD
  static double subtitle2 = 14.sp.toDouble(); //SEMI-BOLD
  static double bodyText1 = 16.sp.toDouble();
  static double bodyText2 = 14.sp.toDouble();
  static double caption = 12.sp.toDouble();
  static double button = 18.sp.toDouble();
  static double overline = 10.sp.toDouble();
  static double smallest = 8.sp.toDouble();
}

class AppFontWeight {
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w800;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeColor get colors => AppLightTheme();

  TextStyle get h2 => theme.textTheme.displayMedium!;

  TextStyle get h3 => theme.textTheme.displaySmall!;

  TextStyle get h4 => theme.textTheme.headlineMedium!;

  TextStyle get h5 => theme.textTheme.headlineSmall!;

  TextStyle get h6 => theme.textTheme.titleLarge!;

  TextStyle get sub1 => theme.textTheme.titleMedium!;

  TextStyle get sub2 => theme.textTheme.titleSmall!;

  TextStyle get body1 => theme.textTheme.bodyLarge!;

  TextStyle get body2 => theme.textTheme.bodyMedium!;

  TextStyle get body2Bold =>
      theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800);

  TextStyle get bodyError => theme.textTheme.bodyMedium!
      .copyWith(color: Theme.of(this).colorScheme.error);

  TextStyle get caption => theme.textTheme.bodySmall!;

  TextStyle get smallest =>
      theme.textTheme.bodyMedium!.copyWith(fontSize: AppFontSizes.smallest);

  TextStyle get captionError => theme.textTheme.bodySmall!
      .copyWith(color: Theme.of(this).colorScheme.error);

  TextStyle get button => theme.textTheme.labelLarge!;

  TextStyle get buttonSmall =>
      theme.textTheme.labelLarge!.copyWith(fontSize: AppFontSizes.caption);

  TextStyle get overline => theme.textTheme.labelSmall!;

  TextStyle get appBarTitle => theme.textTheme.bodyLarge!.copyWith(
        fontSize: AppFontSizes.h6,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.poppins,
      );

  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;
}
