import 'package:eze/core/components/gap.dart';
import 'package:eze/core/extensions/chat_theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  final List<MessageEntity> messages;
  final ChatStyle chatStyle;

  const ChatList({super.key, required this.chatStyle, required this.messages});

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      padding: EdgeInsetsDirectional.symmetric(vertical: UISizes.sp24),
      itemBuilder: (_, i) {
        final bubbleStyle = chatStyle.bubble(messages[i].isMe);
        return ChatBubble(message: messages[i], style: bubbleStyle);
      },
      separatorBuilder: (_, i) => Gap.medium(),
      itemCount: messages.length,
    );
  }
}
