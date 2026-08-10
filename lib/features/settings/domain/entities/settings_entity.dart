import 'package:equatable/equatable.dart';
import 'package:eze/core/enums/app_locale.dart';
import 'package:eze/core/enums/chat_features.dart';
import 'package:eze/core/theme/app_chat_theme.dart';
import 'package:eze/features/settings/domain/entities/chat_feature_entity.dart';
import 'package:eze/features/settings/domain/entities/system_control_entity.dart';
import 'package:eze/features/settings/domain/entities/theme_entity.dart';
import 'package:flutter/material.dart';

class SettingsEntity extends Equatable {
  final SystemControlEntity sysControl;
  final ThemeEntity theme;
  final AppLocale locale;

  const SettingsEntity({
    required this.sysControl,
    required this.theme,
    required this.locale,
  });

  @override
  List<Object?> get props => [sysControl, theme, locale];

  static SettingsEntity fake() => SettingsEntity(
    sysControl: SystemControlEntity.fake(),
    theme: ThemeEntity.fake(),
    locale: AppLocale.ar,
  );


  SettingsEntity copyWith({
    SystemControlEntity? sysControl,
    bool? enabledNotification,
    ThemeEntity? theme,
    AppLocale? locale,
  }) => SettingsEntity(
      sysControl: sysControl ?? this.sysControl,
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );

  static SettingsEntity get defaultSettings => SettingsEntity(
      sysControl: SystemControlEntity(
        features: ChatFeature.values
            .map((e) => ChatFeatureEntity(feature: e))
            .toList(),
      ),
      theme:  const ThemeEntity(
          mode: ThemeMode.system,
          chatTheme: AppChatTheme.defaultLight
      ),
      locale: AppLocale.ar
  );

}
