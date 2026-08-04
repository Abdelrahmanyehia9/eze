import 'package:eze/core/theme/app_chat_theme.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/core/theme/app_pin_field_theme.dart';
import 'package:eze/core/theme/app_text_theme.dart';
import 'package:eze/core/theme/app_input_decoration_theme.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:eze/core/theme/app_appbar_theme.dart';
import 'package:eze/core/theme/app_card_theme.dart';
import 'package:eze/core/theme/app_color_scheme.dart';
import 'package:eze/core/theme/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme() => ThemeData(
    cardTheme: AppCardTheme.light,
    primaryColor: AppColors.primary,
    fontFamily: TextStyles.arFontFamily,
    shadowColor: const Color.fromRGBO(12, 12, 12, 0.3),
    scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColorLight,
    appBarTheme: AppAppBarTheme.light,
    disabledColor: AppColors.grey400,
    textTheme: AppTextTheme.textTheme,
    splashColor: AppColors.secondary,
    inputDecorationTheme: AppInputDecorationTheme.light,
    dividerTheme: const DividerThemeData(
      color: AppColors.grey200,
      thickness: 0.8,
    ),
    colorScheme: AppColorScheme.light,
    extensions: const [
      MaterialPinThemeExtension(theme: AppPinFieldTheme.light),
      AppChatTheme.defaultLight,
    ],
  );

  static ThemeData darkTheme() => ThemeData(
    brightness: Brightness.dark,
    cardTheme: AppCardTheme.dark,
    primaryColor: AppColors.primary,
    fontFamily: TextStyles.arFontFamily,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    dividerTheme: const DividerThemeData(
      color: AppColors.grey800,
      thickness: 0.8,
    ),
    shadowColor: const Color.fromRGBO(200, 200, 200, 0.1),
    scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColorDark,
    appBarTheme: AppAppBarTheme.dark,
    textTheme: AppTextTheme.textTheme,
    disabledColor: AppColors.grey700,
    colorScheme: AppColorScheme.dark,
    extensions: const [
      MaterialPinThemeExtension(theme: AppPinFieldTheme.dark),
      AppChatTheme.defaultDark,
    ],
  );
}
