
import 'package:flutter/material.dart';

import '../helper/ui_sizes.dart';
import 'app_colors.dart';


abstract final class AppAppBarTheme {
  const AppAppBarTheme._();

  static AppBarTheme light = _common.copyWith(
    foregroundColor: AppColors.black,
  );

  static final AppBarTheme dark =  _common.copyWith(
    foregroundColor: AppColors.white,

  );

  static final AppBarTheme _common =  AppBarTheme(
    toolbarHeight: UISizes.h48,
    leadingWidth: UISizes.h72,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    actionsPadding: EdgeInsetsGeometry.directional(end: UISizes.w16),
  ) ;
}