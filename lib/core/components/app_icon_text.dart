import 'package:eze/core/components/app_text.dart';
import 'package:flutter/material.dart';

import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';

class AppIconText extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Widget? customIcon;
  final double? iconSize, gap , textSize;
  final TextStyle? textStyle;
  final Color? iconColor, textColor, color;
  final bool reverse;
  final MainAxisAlignment mainAxisAlignment;

  const AppIconText({
    super.key,
    this.color,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.customIcon,
    this.reverse = false,
    this.gap,
    this.icon,
    this.iconColor,
    this.text,
    this.iconSize,
    this.textColor,
    this.textStyle,
    this.textSize
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = this.iconColor ?? color;
    final textColor = this.textColor ?? color;
    final style = textStyle ?? context.textTheme.bodySmall;

    final children = <Widget>[
      if (customIcon != null)
        customIcon!
      else if (icon != null)
        Icon(icon, size: iconSize, color: iconColor),

      if (text != null) AppText(text!, style: style?.copyWith(color: textColor, fontSize: textSize)),
    ];

    return Row(
      spacing: gap ?? UISizes.w6,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: reverse ? children.reversed.toList() : children,
    );
  }
}
