part of 'base_settings_cubit.dart';

class SystemControlCubit extends BaseSettingsCubit<SystemControlEntity> {
  SystemControlCubit(super.getUseCase, super.editUseCase);

  @override
  SystemControlEntity select(SettingsEntity settings) {
    return settings.sysControl;
  }

  Future<void> edit(SystemControlEntity control) async {
    return _edit(_settings.copyWith(sysControl: control));
  }
}
