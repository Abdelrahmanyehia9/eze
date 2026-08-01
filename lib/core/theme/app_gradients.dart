import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

abstract class AppGradients {
  const AppGradients._();

  static Gradient get primary => const LinearGradient(
    colors: [AppColors.primary, AppColors.secondary, AppColors.tertiary],
  );

  static Gradient mono(
    Color color, {
    AlignmentGeometry begin = AlignmentGeometry.topStart,
    AlignmentGeometry end = AlignmentGeometry.bottomEnd,
  }) => LinearGradient(
    colors: [color.darken(), color, color.lighten()],
    begin: begin,
    end: end,
  );

  static Gradient monoRadial(Color color) =>
      RadialGradient(colors: [color.darken(0.2), color, color.lighten(0.2)]);
}
