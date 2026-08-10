import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  final String? title, subtitle;
  final double? leadingIconSize, trailingIconSize, minTileHeight;
  final TextStyle? titleStyle, subtitleStyle;
  final IconData? trailing, leading;
  final bool showTrailing;
  final bool showLeading;

  final GestureTapCallback? onTap;

  final Widget? customLeading, customTitle, customSubtitle, customTrailing;

  const AppListTile({
    super.key,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.trailing,
    this.onTap,
    this.leading,
    this.showTrailing = true,
    this.customLeading,
    this.customTitle,
    this.customSubtitle,
    this.customTrailing,
    this.leadingIconSize,
    this.minTileHeight,
    this.trailingIconSize,
    this.showLeading = true
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        onTap: onTap,
        minTileHeight: minTileHeight,
        leading: showLeading ? customLeading ?? Icon(leading, size: leadingIconSize ??  UISizes.sp40) : null,
        trailing: showTrailing
            ? customTrailing ??
                  Icon(trailing ?? AppIcons.arrowForward, size:trailingIconSize?? UISizes.sp18)
            : null,
        title:
            customTitle ??
            AppText(
              title,
              style: titleStyle ?? context.textTheme.labelMedium,
              height: 0,
            ),
        subtitle:
            customSubtitle ??
            (subtitle == null
                ? null
                : AppText(
                    subtitle,
                    style: subtitleStyle ?? context.textTheme.bodySmall,
                    color: context.colors.surfaceContainer,
                    height: 0,
                  )),
      ),
    );
  }
}
