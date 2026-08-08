import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class WarningChip extends StatelessWidget {
  final String? text ;
  final Color? backgroundColor ;
  const WarningChip({super.key, required this.text, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      paddingHr: 8,
      paddingVr: 8,
      color:backgroundColor ??  AppColors.error.veryLight,
      shadow: false,
      child: AppIconText(
        expandedText: true,
        icon: AppIcons.warning,
        color: AppColors.error,
        text: text,
      ),
    );
  }
}

class ErrorChip extends StatelessWidget {
  final String? text ;
  final Color? backgroundColor ;
  const ErrorChip({super.key, required this.text, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color:backgroundColor ??  AppColors.error.veryLight,
      shadow: false,
      paddingVr: 8,
      paddingHr: 8,
      child: AppIconText(
        expandedText: true,
        icon: AppIcons.error,
        color: AppColors.error,
        text: text,
      ),
    );
  }
}


class InfoChip extends StatelessWidget {
  final String? text ;
  const InfoChip({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      paddingHr: 8,
      paddingVr: 8,
      color: AppColors.warning.veryLight,
      shadow: false,
      child: AppIconText(
        expandedText: true,
        icon: AppIcons.lamp,
        color: AppColors.warning,
        text: text,
      ),
    );
  }
}
