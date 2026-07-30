import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AppInputDecorationTheme {
  const AppInputDecorationTheme._();



 static InputDecorationThemeData get light =>InputDecorationThemeData(
   filled: true,
    fillColor: AppColors.grey200,
     errorStyle: TextStyles.bodySmall,
     border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(UISizes.r12),
         gapPadding: 12,
         borderSide: BorderSide(
             color: AppColors.grey400,
             width: 1
         )
     ),
     enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(UISizes.r12),
         gapPadding: 12,
         borderSide: BorderSide(
             color: AppColors.grey400,
             width: 1
         )
     ),
     focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(UISizes.r12),
         gapPadding: 12,
         borderSide: BorderSide(
             color: AppColors.grey700,
             width: 1
         )
     ),
     errorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(UISizes.r12),
         gapPadding: 12,
         borderSide: BorderSide(
             color: AppColors.error400,
             width: 1
         )
     ),
     focusedErrorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(UISizes.r12),
         gapPadding: 12,
         borderSide: BorderSide(
             color: AppColors.error600,
             width: 1
         )
     ),
    hintStyle: TextStyles.bodySmall.copyWith(
      fontSize: UISizes.sp16,
      color: AppColors.grey300
    )



  );





}