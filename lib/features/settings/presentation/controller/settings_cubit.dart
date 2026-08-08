import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/settings/domain/entities/settings_entity.dart';
import 'package:eze/features/settings/domain/usecases/get_app_settings_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<BaseState<SettingsEntity>>{
  final GetAppSettingsUseCase _useCase ;
  SettingsCubit(this._useCase):super(const .initial()) ;
  Future<void>getSettings()async{
    safeEmit(const .loading()) ;
    final result = await _useCase.call() ;
    safeEmit(.success(result)) ;
  }

}