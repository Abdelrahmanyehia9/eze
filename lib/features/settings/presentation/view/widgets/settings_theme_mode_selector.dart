part of "settings_theme.dart";

class _SettingsThemeModeSelector extends StatelessWidget {
  final ThemeMode themeMode ;
  const _SettingsThemeModeSelector(this.themeMode);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      paddingVr: 0,
      paddingHr: 0,
      child: ListTile(
        leading: Icon(themeMode.icon, size: UISizes.sp28),
        title: AppText(
          "السمة ",
          style: context.textTheme.labelMedium,
          height: 0,
        ),
        subtitle: AppText(
          themeMode.title,
          style: context.textTheme.bodySmall,
          height: 0,
          color: context.colors.surfaceContainer,
        ),
        trailing: AppText(
          "تغيير",
          color: context.colors.primary,
          style: context.textTheme.titleSmall,
        ),
      ),
    );
  }
}
