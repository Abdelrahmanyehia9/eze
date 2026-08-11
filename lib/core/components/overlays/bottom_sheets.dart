import 'dart:ui';
import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/services/navigation_service.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';

class BottomSheets {
  const BottomSheets._();

  // ─── Private helpers ───────────────────────────────────────────

  static Widget _buildBlurredBackdrop({
    required double blurAmount,
    VoidCallback? onTap,
  }) {
    return AppClick(
      onTap: onTap,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
        child: const SizedBox.expand(),
      ),
    );
  }

  static Widget _buildSheetDecoration({
    required BuildContext context,
    required Widget child,
    bool showCloseButton = false,
    Color? backgroundColor,
    double? borderRadius,
    List<BoxShadow>? shadow,
  }) {
    return ClipRSuperellipse(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(borderRadius ?? UISizes.r12),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: shadow,
          color: backgroundColor ?? context.colors.surfaceContainerLowest,
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: context.safeBottomArea),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              child.appPaddingVr(showCloseButton ? 24 : 0),
              if (showCloseButton)
                AppIconButton(
                  icon: AppIcons.close,
                  onTap: context.pop,
                ).paddingAll,
            ],
          ),
        ),
      ),
    );
  }

  // ─── Public API ────────────────────────────────────────────────

  static Future<T?> show<T>({
    required Widget child,
    bool dismissible = true,
    bool enableDrag = false,
    bool showCloseButton = false,
    Color? backgroundColor,
    double? borderRadius,
    List<BoxShadow>? shadow,
    double padding = 16,
  }) {
    return showModalBottomSheet<T>(
      context: NavigationService.context!,
      isScrollControlled: true,
      isDismissible: dismissible,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _buildBlurredBackdrop(
              blurAmount: 8,
              onTap: dismissible ? context.pop : null,
            ),
            _buildSheetDecoration(
              context: context,
              child: child.appPaddingAll(padding),
              showCloseButton: showCloseButton,
              backgroundColor: backgroundColor,
              borderRadius: borderRadius,
              shadow: shadow,
            ),
          ],
        );
      },
    );
  }

  // static Future<void> showWarning(
  //     BuildContext context, {
  //       String title = "Are you sure?",
  //       IconData icon = AppIcons.warning,
  //       Color iconColor = AppColors.warning,
  //       VoidCallback? onConfirm,
  //       String message = "Are you sure you want to do this action?",
  //     }) async
  // {
  //   final result = await show(
  //     context,
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       spacing: 4.h,
  //       children: [
  //         Icon(icon, size: 80.sp, color: iconColor),
  //         4.spaceVr,
  //         AppText.bodyLarge(title, textAlign: TextAlign.center),
  //         AppText.titleMedium(message, textAlign: TextAlign.center),
  //         6.spaceVr,
  //         Row(
  //           children: [
  //             Expanded(child: AppButton.gradient(gradient: AppGradients.primary, "Confirm", onTap: () => context.pop(true))),
  //             Expanded(child: AppButton.text("Cancel", onTap: () => context.pop(false))),
  //           ],
  //         )
  //
  //       ],
  //     ).paddingAll,
  //   );
  //   if (!context.mounted) return;
  //   if (result == true) {
  //     onConfirm?.call();
  //   }
  // }
}
