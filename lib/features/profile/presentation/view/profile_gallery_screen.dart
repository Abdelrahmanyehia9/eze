import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/profile/presentation/view/layout/profile_gallery_grid.dart';
import 'package:flutter/material.dart';

class ProfileGalleryScreen extends StatelessWidget {
  const ProfileGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const DefaultAppBar(title: "معرض الصور", centerTitle: true),
      body: ProfileGalleryGrid(start: _addNew()),
    );
  }

  Widget _addNew() => Builder(
    builder: (context) {
      return ColoredBox(
        color: context.colors.primary,
        child: Column(
          spacing: UISizes.h4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AppIcons.add,
              color: context.colors.onPrimary,
              size: UISizes.sp32,
            ),
            AppText(
              "اضافة",
              style: context.textTheme.labelLarge,
              color: context.colors.onPrimary,
            ),
          ],
        ),
      );
    },
  );
}
