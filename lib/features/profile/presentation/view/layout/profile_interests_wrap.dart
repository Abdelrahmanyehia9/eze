import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/enums/profile_interests.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class ProfileInterestsWrap extends StatelessWidget {
  final List<ProfileInterests>? interests;
  final List<ProfileInterests>? selected;
  final ValueChanged<ProfileInterests>? onTap;
  const ProfileInterestsWrap({
    super.key,
    this.selected,
    this.interests,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final baseInterests = interests ?? [];
    final selectedList = selected ?? [];

    final mergedInterests = [
      ...selectedList,
      ...baseInterests.where((i) => !selectedList.contains(i)),
    ];

    return Wrap(
      spacing: UISizes.w4,
      runSpacing: UISizes.w4,
      children: List.generate(mergedInterests.length, (i) {
        final interest = mergedInterests[i];
        final isSelected = selectedList.contains(interest);
        return AppChip(
          color: isSelected || selected == null
              ? context.colors.primary
              : context.colors.surfaceContainerLow,
          marginHr: 0,
          onTap: onTap == null ? null : () => onTap!(interest),
          child: AppIconText(
            text: interest.text,
            iconSize: UISizes.sp14,
            color: isSelected || selected == null
                ? context.colors.onPrimary
                : context.colors.surfaceContainerHigh,
            icon: selected == null
                ? null
                : isSelected
                ? AppIcons.check
                : AppIcons.add,
          ),
        );
      }),
    );
  }
}
