import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class SettingsThemeCustomizeChatFont extends StatelessWidget {
  const SettingsThemeCustomizeChatFont({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: "الخط",
          action: "تخصيص",
          actionStyle: context.textTheme.titleSmall,
        ),
        ChatBubbleContainer(
          isMe: true,
          bubbleColor: context.colors.primary,
          child: AppText(
            "مرحبا بك يا مريم , هذا مجرد نص استعراض للخط الحجم المتوسط",
            color: context.colors.onPrimary,
            fontSize: UISizes.sp18,
          ),
        ),
      ],
    );
  }
}
