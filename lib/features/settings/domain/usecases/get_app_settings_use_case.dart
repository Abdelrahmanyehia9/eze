import 'package:eze/core/enums/app_locale.dart';
import 'package:eze/core/enums/chat_features.dart';
import 'package:eze/core/theme/app_chat_theme.dart';
import 'package:eze/features/settings/domain/entities/settings_entity.dart';
import 'package:eze/features/settings/domain/entities/system_control_entity.dart';
import 'package:eze/features/settings/domain/entities/theme_entity.dart';
import 'package:eze/features/settings/domain/repository/settings_repository.dart';
import 'package:flutter/material.dart';

class GetAppSettingsUseCase {
  final SettingsRepository _repository;

  const GetAppSettingsUseCase(this._repository);
  Future<SettingsEntity> call() async {
    final settings = await _repository.getAppSettings();
    return settings ??
        SettingsEntity(
          sysControl: SystemControlEntity(
            features: ChatFeature.values
                .map((e) => ChatFeatureEntity(feature: e))
                .toList(),
          ),
          enabledNotification: false,
          theme: const ThemeEntity(
            mode: ThemeMode.light,
            chatTheme: AppChatTheme.hotStyle,
          ),
          locale: AppLocale.ar,
        );
  }
}
