import 'package:eze/core/components/app_logo.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:flutter/material.dart';

import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/components/app_text.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool hasLeading;
  final Widget? leading;
  final Color? foregroundColor, backgroundColor;

  const DefaultAppBar({
    super.key,
    this.hasLeading = true,
    this.centerTitle = false,
    this.actions,
    this.title,
    this.leading,
    this.backgroundColor,
    this.foregroundColor,
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
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      title: AppText(
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

    if (context.canPop()) {
      return const AppBackButton().appPaddingHr(12).appPaddingVr(6);
    }

    return null;
  }

  @override
  Size get preferredSize => Size.fromHeight(UISizes.h40);
}
