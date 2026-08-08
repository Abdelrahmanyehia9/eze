import 'package:equatable/equatable.dart';
import 'package:eze/core/enums/app_locale.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/features/settings/domain/entities/system_control_entity.dart';
import 'package:eze/features/settings/domain/entities/theme_entity.dart';

class SettingsEntity extends Equatable{
  final SystemControlEntity sysControl;
  final bool enabledNotification;
  final ThemeEntity theme;
  final AppLocale locale ;

 const SettingsEntity({
    required this.sysControl,
    required this.enabledNotification,
    required this.theme,
   required this.locale
  });

  @override
  // TODO: implement props
  List<Object?> get props => [sysControl, enabledNotification, theme];


  static SettingsEntity fake()=> SettingsEntity(
      sysControl: SystemControlEntity.fake(),
      enabledNotification: FakeData.boolean,
      theme: ThemeEntity.fake(),
      locale: AppLocale.ar);
}



