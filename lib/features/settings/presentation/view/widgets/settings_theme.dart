import 'package:eze/core/components/app_button.dart';
import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/features/settings/domain/entities/theme_entity.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_theme_customize_chat_colors.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_theme_customize_chat_font.dart';
import 'package:flutter/material.dart';

part 'settings_theme_mode_selector.dart';

class SettingsTheme extends StatelessWidget {
  final ThemeEntity theme;

  const SettingsTheme({super.key, required this.theme});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: UISizes.h24,
    children: [
      _section(
        context,
        "التطبيق",
        _SettingsThemeModeSelector(theme.mode),
      ),
      _section(
        context,
        "الدردشة",
        AppCard(
          child: Column(
            spacing: UISizes.h16,
            children: [
              SettingsThemeCustomizeChatColors(
                selectedChatStyle: theme.chatTheme,
              ),
               SettingsThemeCustomizeChatFont(
                 theme: theme,
               ),
            ],
          ),
        ),
      ),
      AppButton.filled("تاكيد التغييرات"),
    ],
  );

  Widget _section(
      BuildContext context,
      String title,
      Widget child,
      ) =>
      Column(
        children: [
          SectionHeader.smallHeader(
            title,
            context: context,
            paddingVr: 4,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.surfaceContainerHigh,
              fontSize: UISizes.sp12,
            ),
          ),
          child,
        ],
      );
}