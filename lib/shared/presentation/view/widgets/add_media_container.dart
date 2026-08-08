import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class AddMediaContainer extends StatelessWidget {
  final Color? color ;
  final bool filled ;
  final BorderRadiusGeometry? borderRadius ;
  const AddMediaContainer({super.key,this.borderRadius, this.color, this.filled =true});

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.colors.primary ;
    final textColor = filled? context.colors.onPrimary : color ;
    return  DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: filled?  color : Colors.transparent,
        border: Border.all(color: color)
      ),
      child: Column(
        spacing: UISizes.h4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AppIcons.add,
            color: textColor,
            size: UISizes.sp32,
          ),
          AppText(
            "اضافة",
            style: context.textTheme.labelLarge,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
