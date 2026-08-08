import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:eze/features/settings/domain/entities/theme_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsThemeCustomizeChatFont extends StatelessWidget {
  final ThemeEntity theme;

  const SettingsThemeCustomizeChatFont({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    final fontSize =theme.chatTheme.fontSize ;
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
            "هذا مثال بسيط لمعاينة النص بالحجم الحالى (${theme.fontSizeStr}).",
            color: context.colors.onPrimary,
            fontSize: fontSize.sp,
          ),
        ),
      ],
    );
  }
}
