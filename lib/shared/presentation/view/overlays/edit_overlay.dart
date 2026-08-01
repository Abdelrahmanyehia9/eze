import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/overlays/app_widget_overlay.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_decorations.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class EditOverlay extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onEdit;

  const EditOverlay({super.key, this.onEdit, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppWidgetOverlay(
      overlay: [(AlignmentGeometry.bottomStart, _buildIcon())],
      child: child,
    );
  }

  Widget _buildIcon() => Builder(
    builder: (context) {
      return AppClick(
        onTap: onEdit,
        child: Container(
          padding: EdgeInsets.all(UISizes.sp6),
          decoration: BoxDecoration(
            color: context.colors.surface,
            shape: BoxShape.circle,
            boxShadow: AppDecorations.cardShadow,
          ),
          child: Icon(AppIcons.edit, color: context.colors.onSurface),
        ),
      );
    },
  );
}
