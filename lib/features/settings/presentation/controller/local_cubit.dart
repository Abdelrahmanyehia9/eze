part of "base_settings_cubit.dart";

class LocalCubit extends BaseSettingsCubit<AppLocale> {
  LocalCubit(super.getUseCase, super.editUseCase);

  @override
  AppLocale select(SettingsEntity settings) {
    return settings.locale;
  }

  Future<void> edit(AppLocale local) async {
    return _edit(_settings.copyWith(locale: local));
  }
}
