import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppCardTheme {
 const AppCardTheme._();


  static CardThemeData light= _common.copyWith(
    color: AppColors.white,
    shadowColor: Colors.black12,
    elevation: 1,
  );

  static CardThemeData dark= _common.copyWith(
    color: AppColors.grey900,
    shadowColor: Colors.black54,
    elevation: 1,
  );


 static final CardThemeData  _common = const CardThemeData(
    margin: EdgeInsets.zero,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );


}