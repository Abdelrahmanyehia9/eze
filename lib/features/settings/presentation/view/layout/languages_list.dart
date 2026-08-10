import 'package:eze/core/components/gap.dart';
import 'package:eze/core/enums/app_locale.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_language_tile.dart';
import 'package:flutter/material.dart';

class LanguagesList extends StatelessWidget {
  final AppLocale currentLocal;

  final ValueChanged<AppLocale>? onChanged;

  const LanguagesList({super.key, required this.currentLocal, this.onChanged});

  void _onSelect(AppLocale local) {
    if (local != currentLocal) return onChanged?.call(local);
  }

  @override
  Widget build(BuildContext context) {
    final locals = AppLocale.values;
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, _) => Gap.medium(),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: locals.length,
      itemBuilder: (_, i) => SettingsLanguageTile(
        locale: locals[i],
        isSelected: locals[i] == currentLocal,
        onTap: () => _onSelect(locals[i]),
      ),
    );
  }
}
