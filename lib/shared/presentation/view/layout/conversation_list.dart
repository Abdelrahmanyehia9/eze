import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
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

    return ImplicitlyAnimatedList<ConversationEntity>(
      padding: EdgeInsets.zero,
      physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      shrinkWrap: shrinkWrap,
      clipBehavior: Clip.antiAlias,
      items: c,
      areItemsTheSame: (a, b) => a.peer.uid == b.peer.uid,
      itemBuilder: (context, animation, item, index) {
        return SizeFadeTransition(
          sizeFraction: .8,
          curve: Curves.easeInOut,
          animation: animation,
          child: _buildTile(context, item),
        );
      },
      updateItemBuilder: (context, animation, item) {
        return FadeTransition(
          opacity: animation,
          child: _buildTile(context, item),
        );
      },
    );
  }

  Widget _buildTile(BuildContext context, ConversationEntity item) {
    return AppClick(
      onLongPress: () => onLongPress?.call(item),
      onTap: onTap == null
          ? () => context.pushNamed(Routes.chat, arguments: item.peer)
          : () => onTap!(item),
      child: ConversationTile(
        conversation: item,
        isSelected: selected?.contains(item) ?? false,
      ),
    );
  }
}
