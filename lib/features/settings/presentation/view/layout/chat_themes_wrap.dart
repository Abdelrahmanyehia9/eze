import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_chat_theme.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_chat_theme_box.dart';
import 'package:flutter/material.dart';

class ChatThemesWrap extends StatelessWidget {
  const ChatThemesWrap({super.key});

  @override
  Widget build(BuildContext context) {
    final chatThemes = AppChatTheme.themes;
    return Wrap(
      spacing: UISizes.sp8,
      runSpacing: UISizes.sp8,
      children: List.generate(
        chatThemes.length,
        (i) => SettingsChatThemeBox(theme: chatThemes[i], isSelected: i == 0),
      ),
    );
  }
}
