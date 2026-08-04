import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/theme/app_decorations.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final double paddingHr, paddingVr;
  final Widget child;
  final Color? color;
  final double? height;
  final bool shadow;

  const AppCard({
    super.key,
    this.paddingHr = 16,
    this.paddingVr = 16,
    required this.child,
    this.color,
    this.height,
    this.shadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppChip(
      height: height,
      paddingVr: paddingVr,
      paddingHr: paddingHr,
      color: color ?? context.colors.surface,
      boxShadow: shadow ? AppDecorations.cardShadow : null,
      child: child,
    );
  }
}
