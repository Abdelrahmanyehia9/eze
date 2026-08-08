import 'package:eze/core/components/gap.dart';
import 'package:eze/core/enums/chat_features.dart';
import 'package:eze/features/settings/domain/entities/system_control_entity.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_system_control_tile.dart';
import 'package:flutter/material.dart';

class ChatFeaturesList extends StatelessWidget {
  final List<ChatFeatureEntity>features ;
  const ChatFeaturesList({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) =>
          SettingsSystemControlTile(features[i]),
      separatorBuilder: (_, i) => Gap.medium(),
      itemCount: features.length,
    );
  }
}
