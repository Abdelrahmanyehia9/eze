import 'package:eze/core/components/app_logo.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:flutter/material.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/components/app_text.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? customTitle;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool hasLeading;
  final Widget? leading;
  final double? toolbarHeight, leadingWidth;

  final Color? foregroundColor, backgroundColor;

  const DefaultAppBar({
    super.key,
    this.hasLeading = true,
    this.customTitle,
    this.centerTitle = false,
    this.actions,
    this.title,
    this.leading,
    this.backgroundColor,
    this.toolbarHeight,
    this.foregroundColor,
    this.leadingWidth
  });

  factory DefaultAppBar.logo({required String title, List<Widget>? actions}) =>
      DefaultAppBar(
        title: title,
        actions: actions,
        centerTitle: true,
        leading: const AppLogo(color: null),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      leadingWidth: leadingWidth,
      title:
          customTitle ??
          AppText(
            title,
            style: context.textTheme.titleLarge,
            color: foregroundColor,
          ),
      actions: actions,
      centerTitle: centerTitle,
      leading: _buildLeading(context),
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (!hasLeading) return null;

    if (leading != null) return leading!;
    final showBack = !(ModalRoute.of(context)?.isFirst ?? true);
    if (showBack) {
      return AppBackButton(
        backgroundColor: foregroundColor?.withAppOpacity(0.1),
        iconColor: foregroundColor,
      ).appPaddingHr(12).appPaddingVr(6);
    }

    return null;
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? UISizes.h48);
}
