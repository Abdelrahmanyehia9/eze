import 'package:eze/core/components/gap.dart';
import 'package:eze/features/settings/domain/entities/chat_feature_entity.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_system_control_tile.dart';
import 'package:flutter/material.dart';

class ChatFeaturesList extends StatelessWidget {
  final List<ChatFeatureEntity> features;
  final ValueChanged<ChatFeatureEntity> onChanged ;
  const ChatFeaturesList({super.key, required this.features, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) => SettingsSystemControlTile(features[i], onChanged: onChanged,),
      separatorBuilder: (_, i) => Gap.medium(),
      itemCount: features.length,
    );
  }
}
