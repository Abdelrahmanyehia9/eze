import 'package:eze/core/components/app_button.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final Widget? customChild;
  final GestureTapCallback? onTap;
  final Color backgroundColor ;
  final bool enabled ;

  const DefaultButton({super.key, this.enabled =true, this.backgroundColor = AppColors.primary, this.onTap, this.text, this.customChild});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      color: backgroundColor,
      isDisabled: !enabled,
      fixedSize: Size(double.infinity, UISizes.h48),
      child: customChild ?? AppText(text, color: AppColors.white),
    );
  }
}
