import 'package:eze/features/settings/domain/entities/settings_entity.dart';
import 'package:eze/features/settings/domain/repository/settings_repository.dart';

class GetAppSettingsUseCase {
  final SettingsRepository _repository;

  const GetAppSettingsUseCase(this._repository);
  Future<SettingsEntity> call() async {
    final settings = await _repository.getSettings();
    return settings ?? SettingsEntity.defaultSettings;
  }
}
