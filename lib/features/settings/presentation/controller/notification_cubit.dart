part of 'base_settings_cubit.dart';

class NotificationCubit extends BaseSettingsCubit<bool> {
  NotificationCubit(super.getUseCase, super.editUseCase);

  @override
  bool select(SettingsEntity settings) {
    return settings.notificationEnabled;
  }

  Future<void> edit(bool notification) {
    return _edit(_settings.copyWith(notificationEnabled: notification));
  }
}
