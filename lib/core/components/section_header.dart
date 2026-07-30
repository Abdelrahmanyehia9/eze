import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? action;
  final Widget? customAction;
  final GestureTapCallback? onAction;
  final bool hasAction;

  final TextStyle? titleStyle, actionStyle;

  const SectionHeader({
    super.key,
    required this.title,
    this.action,
    this.customAction,
    this.onAction,
    this.hasAction = true,
    this.actionStyle, this.titleStyle
  });

  factory SectionHeader.smallHeader(String title,
      {required BuildContext context})=>
      SectionHeader(title: title,
        hasAction: false,
        titleStyle: context.textTheme.labelSmall?.copyWith(
            fontSize: UISizes.sp14),

      );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(title, style: titleStyle,),
        if(hasAction)
          AppClick(
              onTap: onAction,
              child: buildAction())
      ],
    );
  }

  Widget buildAction() => customAction ?? AppText(action, style: actionStyle,);
}
