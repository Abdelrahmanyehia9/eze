import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/enums/app_locale.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsLanguageTile extends StatelessWidget {
  final AppLocale locale;
  final bool isSelected;
  final GestureTapCallback? onTap ;

  const SettingsLanguageTile({
    super.key,
    required this.locale,
    this.isSelected = false,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? context.colors.primary : Colors.transparent;
    return AppClick(
      onTap: onTap,
      child: AppChip(
        color: isSelected ? color.veryLight : Colors.transparent,
        paddingVr: 8,
        paddingHr: 16,
        borderColor: color,
        child: Row(
          spacing: UISizes.w8,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(UISizes.r12),
              child: SvgPicture.asset(locale.svg, width: UISizes.sp48),
            ),
            AppText(
              locale.title,
              style: context.textTheme.labelMedium,
              color: isSelected ? color : null,
            ),
            const Spacer(),
            if (isSelected)
              Icon(AppIcons.checkCircle, color: context.colors.primary),
          ],
        ),
      ),
    );
  }
}
