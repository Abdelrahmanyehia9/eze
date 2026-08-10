import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/extensions/chat_theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';

typedef ChatCallBack = Function(MessageEntity m);

class ChatList extends StatelessWidget {
  final List<MessageEntity> messages;
  final ChatStyle chatStyle;
  final ChatCallBack? onTap, onLongPress;
  final List<MessageEntity> selectedMessage;

  const ChatList({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.chatStyle,
    required this.messages,
    this.selectedMessage = const [],
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.symmetric(vertical: UISizes.sp24),
      itemBuilder: (_, i) {
        final bubbleStyle = chatStyle.bubble(messages[i].isMe);
        return AppClick(
          onTap: () => onTap?.call(messages[i]),
          onLongPress: () => onLongPress?.call(messages[i]),
          child: ChatBubble(
            message: messages[i],
            isSelected: selectedMessage.contains(messages[i]),
            style: bubbleStyle,
          ),
        );
      },
      itemCount: messages.length,
    );
  }
}
