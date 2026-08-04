import 'package:eze/core/components/gap.dart';
import 'package:eze/core/enums/chat_features.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_system_control_tile.dart';
import 'package:flutter/material.dart';

class SystemControlList extends StatelessWidget {
  const SystemControlList({super.key});

  @override
  Widget build(BuildContext context) {
    final features = ChatFeatures.values;
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) =>
          SettingsSystemControlTile(feature: features[i], isEnabled: i == 0),
      separatorBuilder: (_, i) => Gap.medium(),
      itemCount: features.length,
    );
  }
}
