import 'package:eze/core/components/overlays/app_menu_overlay.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/components/app_click.dart';

class AppMenuData {
  final IconData? leadingIcon, trailingIcon;
  final Color? leadingIconColor, trailingIconColor;
  final String title;
  final VoidCallback? onTap;
  final double? leadingSize, trailingSize;
  final TextStyle? style;
  final Widget? customLeading, customTrailing;

  const AppMenuData({
    this.leadingIcon,
    this.leadingSize,
    this.style,
    this.trailingSize,
    this.trailingIcon,
    this.customLeading,
    this.customTrailing,
    this.leadingIconColor,
    this.trailingIconColor,
    required this.title,
    this.onTap,
  });
}

class AppMenuAnchor extends StatelessWidget {
  final List<AppMenuData>? items;
  final double? menuWidth;
  final Widget? anchorIcon;
  final Color? anchorColor, backgroundColor, foregroundColor;
  final MenuAnchorChildBuilder? builder;

  const AppMenuAnchor({
    super.key,
    this.items,
    this.menuWidth,
    this.anchorColor,
    this.backgroundColor,
    this.foregroundColor,
    this.anchorIcon,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return AppMenuOverlay(
      offset: Offset(0, UISizes.h8),
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? context.scaffoldBackgroundColor,
        ),
        elevation: WidgetStatePropertyAll(UISizes.sp1),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: UISizes.h4),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(UISizes.r8),
              topEnd: Radius.circular(UISizes.r4),
              bottomEnd: Radius.circular(UISizes.r8),
              bottomStart: Radius.circular(UISizes.r8),
            ),
          ),
        ),
      ),
      builder:
          builder ??
          (context, controller, child) {
            return AppClick(
              child: child!,
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                  return;
                }
                controller.open();
              },
            );
          },
      children: items?.map((e) => _item(e, context)).toList() ?? [],
      child:
          anchorIcon ??
          Icon(
            AppIcons.menuVert,
            color: anchorColor ?? context.colors.onSurfaceVariant,
            size: UISizes.r22,
          ),
    );
  }

  Widget _item(AppMenuData data, BuildContext context) {
    final highest = foregroundColor ?? context.colors.surfaceContainerHighest;
    return MenuItemButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(
          Size(menuWidth ?? UISizes.w196, UISizes.h48),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: UISizes.w16),
        ),
        animationDuration: const Duration(milliseconds: 300),
        foregroundColor: WidgetStatePropertyAll(highest),
      ),
      leadingIcon:
          data.customLeading ??
          (data.leadingIcon == null
              ? null
              : Icon(
                  data.leadingIcon,
                  size: data.leadingSize ?? UISizes.sp16,
                  color: data.leadingIconColor ?? highest,
                )),
      trailingIcon:
          data.customTrailing ??
          (data.trailingIcon == null
              ? null
              : Icon(
                  data.trailingIcon,
                  size: data.trailingSize ?? UISizes.sp16,
                  color: data.trailingIconColor ?? highest,
                )),
      onPressed: data.onTap,
      child: Text(
        data.title,
        style: data.style ?? context.textTheme.bodyMedium,
      ),
    );
  }
}
