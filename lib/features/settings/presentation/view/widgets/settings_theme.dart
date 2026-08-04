import 'package:eze/core/components/app_button.dart';
import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_theme_customize_chat_colors.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_theme_customize_chat_font.dart';
import 'package:flutter/material.dart';
part 'settings_app_theme_selector.dart';

class SettingsTheme extends StatelessWidget {
  const SettingsTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: UISizes.h24,
      children: [
        const _SettingsAppThemeSelector(),
        const SettingsThemeCustomizeChatColors(),
        const SettingsThemeCustomizeChatFont(),
        AppButton.filled("تاكيد التغييرات"),
      ],
    );
  }
}
