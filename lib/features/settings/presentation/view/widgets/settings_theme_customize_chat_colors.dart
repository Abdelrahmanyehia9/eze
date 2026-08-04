import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/features/settings/presentation/view/layout/chat_themes_wrap.dart';
import 'package:flutter/material.dart';

class SettingsThemeCustomizeChatColors extends StatelessWidget {
  const SettingsThemeCustomizeChatColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: UISizes.h4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: " الدردشة",
          action: "تخصيص",
          actionStyle: context.textTheme.titleSmall,
        ),
        const ChatThemesWrap(),
      ],
    );
  }
}
