import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/components/app_text.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavItem> items;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  }) : assert(items.length >= 3, 'Items must be at least 3');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.safeBottomArea),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: UISizes.w8,
          vertical: UISizes.h8,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAppOpacity(0.05),
              blurRadius: UISizes.r4,
              offset: Offset(0, -UISizes.h1),
            ),
          ],
          color: context.scaffoldBackgroundColor,
        ),
        child: Row(
          children: List.generate(items.length, (index) {
            return Expanded(
              child: _NavBarItem(
                key: ValueKey('nav_item_$index'),
                item: items[index],
                isSelected: currentIndex == index,
                onTap: () => onTap(index),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final BottomNavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget icon = Icon(
      (isSelected && item.selectedIcon != null)
          ? item.selectedIcon!
          : item.icon,
      color: isSelected ? AppColors.white : context.colors.surfaceContainerHigh,
      size: UISizes.sp28,
    ).appPaddingAll(4);
    return AppClick(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: isSelected ? context.primaryColor : null,
              borderRadius: BorderRadius.circular(UISizes.r8),
            ),
            child: Badge(
              offset: Offset(0, UISizes.sp1),
              backgroundColor: AppColors.secondary,
              isLabelVisible: item.badge != null,
              label: AppText(height: 0, item.badge, fontSize: UISizes.sp12),
              child: icon,
            ),
          ),
          if (item.title != null)
            AppText(
              item.title!,
              height: 0,
              style: TextStyles.labelSmall,
              maxLines: 2,
              textAlign: TextAlign.center,
              fontSize: UISizes.sp16,
              color: isSelected
                  ? context.colors.onSurface
                  : context.colors.surfaceContainerHigh,
            ),
        ],
      ),
    );
  }
}

class BottomNavItem {
  final IconData icon;
  final String? title;
  final IconData? selectedIcon;
  final String? badge;
  const BottomNavItem({
    required this.icon,
    this.badge,
    this.selectedIcon,
    this.title,
  });
}
