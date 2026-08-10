part of "base_settings_cubit.dart" ;

class ThemeCubit extends BaseSettingsCubit<ThemeEntity> {
  ThemeCubit(
      super.getUseCase,
      super.editUseCase,
      );
  @override
  ThemeEntity select(SettingsEntity settings) {
    return settings.theme;
  }
  Future<void> edit(ThemeEntity theme) {
    return _edit(
      _settings.copyWith(theme: theme),
    );
  }

}