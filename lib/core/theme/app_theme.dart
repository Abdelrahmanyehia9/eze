

import 'package:eze/core/theme/app_text_theme.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

import 'app_appbar_theme.dart';
import 'app_card_theme.dart';
import 'app_color_scheme.dart';
import 'app_colors.dart';


class AppTheme {
  const AppTheme._();
  static ThemeData  lightTheme() => ThemeData(
    cardTheme: AppCardTheme.light,
     fontFamily: TextStyles.arFontFamily,
    shadowColor: const Color.fromRGBO(12, 12, 12, 0.3),
    scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColorLight,
    appBarTheme: AppAppBarTheme.light,
    disabledColor: AppColors.grey400,
    textTheme: AppTextTheme.textTheme,
    dividerTheme: const DividerThemeData(color: AppColors.grey300, thickness: 1),
    colorScheme:  AppColorScheme.light,

  );
  

  static ThemeData  darkTheme() => ThemeData(
    cardTheme: AppCardTheme.dark,
    fontFamily: TextStyles.arFontFamily,
    shadowColor: const Color.fromRGBO(200, 200, 200, 0.1),
    scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColorDark,
    appBarTheme: AppAppBarTheme.dark,
    textTheme: AppTextTheme.textTheme,
    disabledColor: AppColors.grey700,
  );
}