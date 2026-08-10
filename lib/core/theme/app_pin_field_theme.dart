import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:eze/core/theme/app_colors.dart';

abstract final class AppPinFieldTheme {
  AppPinFieldTheme._();

  static const MaterialPinTheme dark = MaterialPinTheme(
    fillColor: AppColors.grey800,
    errorBorderWidth: 0.5,
    borderColor: AppColors.grey500,
    focusedFillColor: AppColors.grey800,
    cursorColor: AppColors.white,
    focusedBorderColor: AppColors.grey300,
    focusedBorderWidth: 0.5,
    focusedElevation: 4,
    errorFillColor: AppColors.error600,
    filledFillColor: AppColors.grey800,
    filledBorderColor: AppColors.grey500,
    borderWidth: 0.5,
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );
  static MaterialPinTheme light = MaterialPinTheme(
    fillColor: AppColors.grey100,
    borderColor: AppColors.grey300,
    borderWidth: 1,
    textStyle: TextStyle(color: AppColors.success600, fontSize: UISizes.sp20),
    errorTextStyle: TextStyle(
      color: AppColors.error600,
      fontSize: UISizes.sp20,
    ),
    disabledTextStyle: TextStyle(
      color: AppColors.grey400,
      fontSize: UISizes.sp20,
    ),
    focusedFillColor: AppColors.grey100,
    focusedBorderColor: AppColors.primary600,
    focusedBorderWidth: 1.5,
    focusedElevation: 4,
    cursorColor: AppColors.primary600,
    filledFillColor: AppColors.success100,
    filledBorderColor: AppColors.success600,
    errorFillColor: AppColors.error100,
    errorBorderColor: AppColors.error600,
    errorBorderWidth: 1.5,

    borderRadius: const BorderRadius.all(Radius.circular(12)),
  );
}
