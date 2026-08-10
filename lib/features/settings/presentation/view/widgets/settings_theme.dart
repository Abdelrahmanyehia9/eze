import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_list_tile.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/components/overlays/bottom_sheets.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/chat_theme.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/features/settings/presentation/controller/base_settings_cubit.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_theme_customize_chat_colors.dart';
import 'package:eze/shared/presentation/view/widgets/selectors/selector_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_theme_mode_selector.dart';

class SettingsTheme extends StatelessWidget {
  const SettingsTheme({super.key});

  void _change({
    ThemeMode? mode,
    ChatStyle? chatStyle,
    required ThemeCubit cubit,
  }) {
    cubit.edit(cubit.value.copyWith(mode: mode, chatTheme: chatStyle));
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return BaseBlocConsumer(
      bloc: themeCubit,
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: UISizes.h24,
        children: [
          _section(
            "التطبيق",
            _SettingsThemeModeSelector(
              themeCubit.value.mode,
              onChanged: (mode) => _change(mode: mode, cubit: themeCubit),
            ),
          ),
          _section(
            "الدردشة",
            AppCard(
              child: Column(
                spacing: UISizes.h16,
                children: [
                  SettingsThemeCustomizeChatColors(
                    onChanged: (style) =>
                        _change(chatStyle: style, cubit: themeCubit),
                    selectedChatStyle:
                        themeCubit.value.chatTheme ?? context.chatTheme,
                  ),
                  // SettingsThemeCustomizeChatFont(
                  //   font: value.chatTheme.font,
                  //   onChanged: (font) => _change(
                  //     chatStyle: value.chatTheme.copyWith(font: font),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, Widget child) => Builder(
    builder: (context) => Column(
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
    ),
  );
}
