import 'package:eze/core/components/gap.dart';
import 'package:flutter/material.dart';

import 'package:eze/shared/presentation/view/widgets/conversation_tile.dart';

class ConversationList extends StatelessWidget {
  final bool shrinkWrap;
  final int count;
  const ConversationList({super.key, this.count = 2, this.shrinkWrap = true});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      shrinkWrap: shrinkWrap,
      itemBuilder: (_, _) => const ConversationTile(),
      separatorBuilder: (_, _) => Gap.small(),
      itemCount: count,
    );
  }
}
