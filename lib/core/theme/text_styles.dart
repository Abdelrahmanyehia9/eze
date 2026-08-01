import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  const TextStyles._();
  static const String enFontFamily = 'noto_sans';
  static const String arFontFamily = 'tajawal';
  static final TextStyle displayLarge = TextStyle(
    fontSize: 56.sp,
    fontWeight: FontWeightHelper.regular,
    letterSpacing: -0.25,
  );
  static final TextStyle displayMedium = TextStyle(
    fontSize: 48.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static final TextStyle displaySmall = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static final TextStyle headlineLarge = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static final TextStyle headlineMedium = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static final TextStyle headlineSmall = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static final TextStyle titleLarge = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static final TextStyle titleMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static final TextStyle titleSmall = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static final TextStyle bodyLarge = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static final TextStyle bodyMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static final TextStyle bodySmall = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static final TextStyle labelLarge = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static final TextStyle labelMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static final TextStyle labelSmall = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );
}

class FontWeightHelper {
  const FontWeightHelper._();
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}
