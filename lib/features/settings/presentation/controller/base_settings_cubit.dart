import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/enums/app_locale.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/settings/domain/entities/settings_entity.dart';
import 'package:eze/features/settings/domain/entities/system_control_entity.dart';
import 'package:eze/features/settings/domain/entities/theme_entity.dart';
import 'package:eze/features/settings/domain/usecases/edit_app_settings_use_case.dart';
import 'package:eze/features/settings/domain/usecases/get_app_settings_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'local_cubit.dart';
part 'system_control_cubit.dart';
part 'theme_cubit.dart';
part 'notification_cubit.dart';

abstract class BaseSettingsCubit<T> extends Cubit<BaseState<T>> {
  final GetAppSettingsUseCase _getUseCase;
  final EditAppSettingsUseCase _editUseCase;

  BaseSettingsCubit(this._getUseCase, this._editUseCase)
    : super(const .initial());

  SettingsEntity _settings = SettingsEntity.defaultSettings;
  T get value => select(_settings);
  T select(SettingsEntity settings);

  Future<void> load() async {
    safeEmit(const .loading());

    final settings = await _getUseCase.call();

    _settings = settings;

    safeEmit(.success(select(settings)));
  }

  Future<void> _edit(SettingsEntity settings) async {
    safeEmit(const .loading());

    final result = await _editUseCase.call(settings);

    _settings = result;

    safeEmit(.success(select(result)));
  }
}
