import 'package:eze/core/components/app_switch.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/features/settings/domain/entities/system_control_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsSystemControlTile extends StatelessWidget {
  final ChatFeatureEntity entity ;
  const SettingsSystemControlTile(this.entity);

  @override
  Widget build(BuildContext context) {
    final feature = entity.feature;
    final color = entity.feature.color(context);
    return ListTile(
      leading: feature.svg == null
          ? null
          : SvgPicture.asset(
              feature.svg!,
              width: UISizes.sp32,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
      title: AppText(
        height: 0,
        feature.title,
        style: context.textTheme.labelMedium,
      ),
      subtitle: feature.description == null
          ? null
          : AppText(
              feature.description,
              color: context.colors.surfaceContainerHigh,
              height: 0,
              style: context.textTheme.bodySmall,
            ),
      trailing: AppSwitch(
        value: entity.enabled,
        onChanged: (_) {},
        activeColor: color,
      ),
    );
  }
}
