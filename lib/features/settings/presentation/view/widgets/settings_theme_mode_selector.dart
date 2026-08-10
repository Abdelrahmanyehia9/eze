part of "settings_theme.dart";

class _SettingsThemeModeSelector extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode>? onChanged;

  const _SettingsThemeModeSelector(this.themeMode, {this.onChanged});

  Future<void> onSelect(BuildContext context) async {
    final modes = ThemeMode.values;
    final result = await BottomSheets.show(
      child: SelectorBottomSheet(
        data: List.generate(modes.length, (i) {
          bool isSelected = themeMode == modes[i];
          return SelectorBottomSheetData<ThemeMode>(
            title: modes[i].title,
            id: modes[i],
            selected: isSelected,
            leading: Icon(
              modes[i].icon,
              color: isSelected ? context.colors.onPrimary : null,
            ),
          );
        }),
      ),
    );
    if (result != null && result != themeMode) return onChanged?.call(result);
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      paddingVr: 0,
      paddingHr: 0,
      child: AppListTile(
        onTap: () => onSelect(context),
        leading: themeMode.icon,
        title: "السمة ",
        subtitle: themeMode.title,
        leadingIconSize: UISizes.sp28,
        customTrailing: AppText(
          "تغيير",
          color: context.colors.primary,
          style: context.textTheme.titleSmall,
        ),
      ),
    );
  }
}
