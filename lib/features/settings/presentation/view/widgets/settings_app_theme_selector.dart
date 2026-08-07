part of "settings_theme.dart";

class _SettingsAppThemeSelector extends StatelessWidget {
  const _SettingsAppThemeSelector();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      paddingVr: 0,
      paddingHr: 0,
      child: ListTile(
        leading: Icon(AppIcons.lightTheme, size: UISizes.sp28),
        title: AppText(
          "سمة التطبيق",
          style: context.textTheme.labelMedium,
          height: 0,
        ),
        subtitle: AppText(
          "الوضع النهارى",
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
