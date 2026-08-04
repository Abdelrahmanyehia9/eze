import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/date_time.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/variables.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/models/time_message.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppClick(
      onTap: () => context.pushNamed(Routes.chat),
      child: Row(
        spacing: UISizes.w8,
        children: [
          UserCircleAvatar(size: UISizes.sp64),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText("مريم خالد", style: context.textTheme.labelMedium),
                AppText(
                  style: context.textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  color: context.colors.surfaceContainerHigh,
                  "مرحبا يا محمد  , الطقس جيد اليوم ما رايك فى عشاء",
                ),
              ],
            ),
          ),
          Column(
            children: [
              AppText(
                style: TextStyles.bodySmall,
                color: context.colors.surfaceContainer,
                fontSize: UISizes.sp12,
                DateTime.now()
                    .subtract(const Duration(seconds: 8))
                    .timeAgoAbbr(messages: const TimeMessagesAr()),
              ),
              Badge(
                label: AppText(5.compactNumber),
                backgroundColor: context.colors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
