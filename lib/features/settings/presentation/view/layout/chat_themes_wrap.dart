import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_chat_theme.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_chat_theme_box.dart';
import 'package:flutter/material.dart';

class ChatThemesWrap extends StatelessWidget {
  final ChatStyle selectedChat;
  final ValueChanged<ChatStyle>? onChanged;

  const ChatThemesWrap({super.key, required this.selectedChat, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final chatThemes = AppChatTheme.themes;
    final selected = selectedChat;

    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      runSpacing: UISizes.sp8,
      children: [
        for (final theme in chatThemes)
          SettingsChatThemeBox(
            theme: theme,
            isSelected: theme == selected,
            onTap: () {
              if (theme != selected) {
                onChanged?.call(theme);
              }
            },
          ),
      ],
    );
  }
}
