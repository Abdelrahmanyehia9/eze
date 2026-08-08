import 'package:eze/features/settings/domain/entities/settings_entity.dart';

abstract class SettingsRepository{
Future<SettingsEntity?> getAppSettings();
}

