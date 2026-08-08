import 'package:eze/features/profile/presentation/controller/profile_cubit.dart';
import 'package:eze/features/settings/presentation/controller/settings_cubit.dart';

class SettingsScreenArgs {
  final SettingsCubit settingsCubit;
  final ProfileCubit profileCubit;

  const SettingsScreenArgs({
    required this.profileCubit,
    required this.settingsCubit,
  });
}
