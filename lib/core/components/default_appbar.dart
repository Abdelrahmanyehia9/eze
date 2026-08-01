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
  const DefaultAppBar({
    super.key,
    this.hasLeading = true,
    this.centerTitle = false,
    this.actions,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText(title),
      titleTextStyle: context.textTheme.labelMedium,
      actions: actions,
      centerTitle: centerTitle,
      leading: hasLeading && context.canPop()
          ? const AppBackButton().appPaddingHr(12).appPaddingVr(6)
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UISizes.h56);
}
