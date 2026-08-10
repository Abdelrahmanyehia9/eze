import 'package:flutter/material.dart';

import 'package:eze/core/theme/app_colors.dart';

abstract class AppColorScheme {
  const AppColorScheme._();

  static Color scaffoldBackgroundColorLight = const Color.fromRGBO(
    250,
    250,
    250,
    1,
  );
  static Color scaffoldBackgroundColorDark = const Color.fromRGBO(
    14,
    14,
    16,
    1,
  );

  static final ColorScheme dark = const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onTertiary: AppColors.white,
    surface: Color(0xFF141418),
    surfaceContainerLowest: AppColors.grey900,
    surfaceContainerLow: AppColors.grey700,
    surfaceContainer: AppColors.grey500,
    surfaceContainerHigh: AppColors.grey300,
    surfaceContainerHighest: AppColors.grey100,
    error: AppColors.error400,
    onError: AppColors.white,
    shadow: Colors.white24,
  );
  static final ColorScheme light = const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    onTertiary: AppColors.white,
    tertiary: AppColors.tertiary,
    surfaceContainerLowest: AppColors.grey100,
    surfaceContainerLow: AppColors.grey300,
    surfaceContainer: AppColors.grey500,
    surfaceContainerHigh: AppColors.grey600,
    surfaceContainerHighest: AppColors.grey700,
    error: AppColors.error,
    shadow: Colors.black26,
  );
}
