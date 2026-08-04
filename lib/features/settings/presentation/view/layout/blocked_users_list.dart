import 'package:eze/core/components/gap.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_blocked_user_tile.dart';
import 'package:flutter/material.dart';

class BlockedUsersList extends StatelessWidget {
  const BlockedUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) => const SettingsBlockedUserTile(),
      separatorBuilder: (_, i) => Gap.medium(),
      itemCount: 15,
    );
  }
}
