import 'package:eze/features/settings/domain/entities/settings_entity.dart';
import 'package:eze/features/settings/domain/entities/theme_entity.dart';

class SettingsLocalDatasource {
  Future<SettingsEntity?> getSettings() async {
    return null;
  }

  Future<SettingsEntity> saveSettings(SettingsEntity settings) async {
    return settings;
  }
}
