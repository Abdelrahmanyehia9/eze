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
  final EdgeInsetsGeometry? margin ;
  final AlignmentGeometry align ;
  const EditOverlay({super.key,
    this.margin , this.align = AlignmentGeometry.bottomStart,
    this.onEdit, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppWidgetOverlay(
      overlay: [(align, _buildIcon())],
      child: child,
    );
  }

  Widget _buildIcon() => Builder(
    builder: (context) {
      return AppClick(
        onTap: onEdit,
        child: Container(
          margin: margin,
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
