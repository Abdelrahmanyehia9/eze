import 'package:flutter/material.dart';

import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/helper/ui_sizes.dart';

class AppDecorations {
  const AppDecorations._();

  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withAppOpacity(0.1),
      blurRadius: UISizes.r2,
      offset: const Offset(0, 1),
    ),
  ];
}
