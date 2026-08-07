import 'package:eze/core/components/gap.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  final List<MessageEntity> messages ;
  const ChatList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsetsDirectional.symmetric(vertical: UISizes.sp24),
      itemBuilder: (_, i) => ChatBubble(message: messages[i],),
      separatorBuilder: (_, i) => Gap.medium(),
      itemCount: messages.length,
    );
  }
}
