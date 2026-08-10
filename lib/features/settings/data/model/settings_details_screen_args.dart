import 'package:eze/core/enums/settings_detail_type.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';

class SettingDetailsScreenArgs {
  const SettingDetailsScreenArgs({required this.type, this.profile});

  final SettingDetailType type;
  final ProfileEntity? profile;
}
