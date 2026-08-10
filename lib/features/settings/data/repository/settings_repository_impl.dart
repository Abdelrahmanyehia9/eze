import 'package:eze/features/settings/data/datasource/settings_local_datasource.dart';
import 'package:eze/features/settings/domain/entities/settings_entity.dart';
import 'package:eze/features/settings/domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDatasource localDatasource;
  const SettingsRepositoryImpl({required this.localDatasource});

  @override
  Future<SettingsEntity> editAppSettings({required SettingsEntity settings}) {
    return localDatasource.saveSettings(settings);
  }

  @override
  Future<SettingsEntity?> getSettings() {
    return localDatasource.getSettings();
  }
}
