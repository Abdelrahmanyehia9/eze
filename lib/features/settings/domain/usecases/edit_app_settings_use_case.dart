import 'package:eze/features/settings/domain/entities/settings_entity.dart';
import 'package:eze/features/settings/domain/repository/settings_repository.dart';

class EditAppSettingsUseCase {
  final SettingsRepository _repository ;
 const EditAppSettingsUseCase(this._repository);



Future<SettingsEntity>call(SettingsEntity settings)async{
  return _repository.editAppSettings(settings: settings) ;
}

}