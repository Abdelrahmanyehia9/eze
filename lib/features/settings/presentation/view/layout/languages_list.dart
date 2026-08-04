import 'package:eze/core/components/gap.dart';
import 'package:eze/core/enums/app_locale.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_language_tile.dart';
import 'package:flutter/material.dart';

class LanguagesList extends StatelessWidget {
  const LanguagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, _) => Gap.medium(),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: AppLocale.values.length,
      itemBuilder: (_, i) =>
          SettingsLanguageTile(locale: AppLocale.values[i], isSelected: i == 0),
    );
  }
}
