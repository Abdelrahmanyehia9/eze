import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final double? size;
  final IconData icon;
  final GestureTapCallback? onTap;
  final double? radius;
  final Color? backgroundColor;
  final Color? color;

  const AppIconButton({
    super.key,
    this.radius,
    this.size,
    this.onTap,
    this.color,
    required this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = this.size ?? UISizes.sp24;
    final smallSize = size * .3;
    return AppClick(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(smallSize),
        decoration: BoxDecoration(
          color:
              backgroundColor ??
              context.colors.surfaceContainerHighest.withAppOpacity(0.1),
          borderRadius: BorderRadius.circular(radius ?? smallSize),
        ),
        child: Icon(icon, size: size, color: color),
      ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: AppIcons.arrowBackward,
      onTap: () {
        if (context.canPop()) {
          context.pop();
        }
      },
    );
  }
}
