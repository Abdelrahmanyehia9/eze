import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_chat_theme.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_chat_theme_box.dart';
import 'package:flutter/material.dart';

class ChatThemesWrap extends StatelessWidget {
  final ChatStyle? selectedChat;

  const ChatThemesWrap({super.key, this.selectedChat});

  @override
  Widget build(BuildContext context) {
    final chatThemes = AppChatTheme.themes;
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      runSpacing: UISizes.sp8,
      children: List.generate(chatThemes.length, (i) {
        final bool isSelected = selectedChat != null
            ? chatThemes[i] == selectedChat
            : i == 2;
        return SettingsChatThemeBox(
          theme: chatThemes[i],
          isSelected: isSelected,
        );
      }),
    );
  }
}
