import 'package:flutter/material.dart';

import '../extensions/color.dart';
import '../helper/ui_sizes.dart';

class AppDecorations {
  const AppDecorations._() ;


  static List<BoxShadow> get cardShadow =>[
    BoxShadow(
        color: Colors.black.withAppOpacity(0.1),
        blurRadius: UISizes.r2,
        offset: Offset(0 ,1)
    )
  ];


}