import 'package:eze/core/components/app_button.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

class SettingsBlockedUserTile extends StatelessWidget {
  const SettingsBlockedUserTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: UISizes.w8,
      children: [
        UserCircleAvatar(size: UISizes.sp64, username: FakeData.string()),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText("مريم خالد", style: context.textTheme.labelMedium),
              AppText(
                "Mariem@gmail.com",
                style: context.textTheme.bodyMedium,
                color: context.colors.surfaceContainer,
              ),
            ],
          ),
        ),
        Expanded(
          child: AppButton.filled(
            radius: UISizes.r12,
            "الغاء الحظر",
            style: context.textTheme.labelSmall,
            fixedSize: Size(double.infinity, UISizes.h32),
          ),
        ),
      ],
    );
  }
}
