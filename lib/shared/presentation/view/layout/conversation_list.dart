import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:flutter/material.dart';

import 'package:eze/shared/presentation/view/widgets/conversation_tile.dart';

class ConversationList extends StatelessWidget {
  final bool shrinkWrap;
  final List<ConversationEntity>? conversations;
  final List<ConversationEntity>? selected;
  final void Function(ConversationEntity c)? onTap, onLongPress;

  const ConversationList({
    super.key,
    this.conversations,
    this.shrinkWrap = true,
    this.onTap,
    this.onLongPress,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final c = conversations ?? ConversationEntity.fake.fakeList();
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      shrinkWrap: shrinkWrap,
      clipBehavior: Clip.antiAlias,
      itemBuilder: (_, i) => AppClick(
        onLongPress: () => onLongPress?.call(c[i]),
        onTap: onTap == null
            ? () => context.pushNamed(Routes.chat, arguments: c[i].peer)
            : () => onTap!(c[i]),
        child: ConversationTile(
          conversation: c[i],
          isSelected: selected?.contains(c[i]) ?? false,
        ),
      ),

      itemCount: c.length,
    );
  }
}
