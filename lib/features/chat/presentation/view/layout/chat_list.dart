import 'package:eze/core/components/gap.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsetsDirectional.symmetric(vertical: UISizes.sp24),
      itemBuilder: (_, i) => ChatBubble(isMe: i % 2 == 0),
      separatorBuilder: (_, i) => Gap.medium(),
      itemCount: 12,
    );
  }
}
