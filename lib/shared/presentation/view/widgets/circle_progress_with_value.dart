import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';

class CircleProgressWithValue extends StatelessWidget {
  final double? size;
  final double value;
  final Color? color;
  const CircleProgressWithValue({
    super.key,
    this.color,
    required this.value,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final size = this.size ?? UISizes.sp48;
    final color = this.color ?? context.colors.primary;
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        SizedBox.square(
          dimension: size,
          child: CircularProgressIndicator(
            padding: EdgeInsets.zero,
            value: value,
            strokeWidth: UISizes.sp6,
            valueColor: AlwaysStoppedAnimation(color),
            backgroundColor: context.colors.surfaceContainerLow,
          ),
        ),
        AppText(
          color: color,
          fontSize: size * .3,
          textAlign: TextAlign.center,
          style: context.textTheme.labelMedium,

          "${(value * 100).toStringAsFixed(0)}%",
        ),
      ],
    );
  }
}
