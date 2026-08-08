import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/features/settings/presentation/view/layout/chat_themes_wrap.dart';
import 'package:flutter/material.dart';

class SettingsThemeCustomizeChatColors extends StatelessWidget {
  final ChatStyle selectedChatStyle ;
  const SettingsThemeCustomizeChatColors({super.key, required this.selectedChatStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: "الوان الدردشة",
          action: "تخصيص",
          actionStyle: context.textTheme.titleSmall,
        ),
         ChatThemesWrap(
           selectedChat: selectedChatStyle,
         ),
      ],
    );
  }
}
