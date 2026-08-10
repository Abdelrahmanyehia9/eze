import 'package:eze/core/components/app_list_tile.dart';
import 'package:eze/core/components/app_switch.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/features/settings/domain/entities/chat_feature_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsSystemControlTile extends StatelessWidget {
  final ChatFeatureEntity entity;
  final ValueChanged<ChatFeatureEntity> onChanged ;
  const SettingsSystemControlTile(this.entity, {super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final feature = entity.feature;
    final color = entity.feature.color(context);
    return AppListTile(
      customLeading: feature.svg == null
          ? null
          : SvgPicture.asset(
              feature.svg!,
              width: UISizes.sp32,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
      title:feature.title,
      subtitle: feature.description,
      customTrailing: AppSwitch(
        value: entity.enabled,
        onChanged: (r)=>onChanged.call(entity.copyWith(enabled: r)),
        activeColor: color,
      ),
    );
  }
}
