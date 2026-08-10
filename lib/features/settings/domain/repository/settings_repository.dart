import 'package:eze/features/settings/domain/entities/settings_entity.dart';

abstract class SettingsRepository {

  Future<SettingsEntity?> getSettings();
  Future<SettingsEntity>editAppSettings({required SettingsEntity settings})  ;
}
