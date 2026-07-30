import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:flutter/material.dart';

import '../extensions/widgets.dart';
import '../helper/ui_sizes.dart';
import 'app_icon_button.dart';
import 'app_text.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title ;
  final List<Widget>? actions ;
  final bool centerTitle ;
  final bool hasLeading ;
  const DefaultAppBar({super.key, this.hasLeading=true, this.centerTitle=false, this.actions, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText(title),
      titleTextStyle: context.textTheme.labelMedium,
      actions: actions,
      centerTitle: centerTitle,
      leading: hasLeading && context.canPop() ?  AppBackButton().appPaddingHr(12).appPaddingVr(6) : null,
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(UISizes.h56);
}
