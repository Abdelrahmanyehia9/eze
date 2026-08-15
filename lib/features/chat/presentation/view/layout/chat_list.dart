import 'package:eze/core/extensions/chat_theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/features/chat/presentation/controller/send_message_cubit.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:eze/features/chat/presentation/view/widgets/message_action.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';
import 'package:eze/shared/presentation/controllers/selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatList extends StatelessWidget {
  final List<MessageEntity> messages;
  final ChatStyle chatStyle;

  const ChatList({super.key, required this.chatStyle, required this.messages});

  @override
  Widget build(BuildContext context) {
    final sendMessageCubit = context.read<SendMessageCubit>();
    return SelectionBuilder<MessageEntity>(
      builder: (cubit, state) => ListView.builder(
        padding: EdgeInsetsDirectional.symmetric(vertical: UISizes.sp24),
        itemBuilder: (_, i) {
          final message = messages[i];
          final bubbleStyle = chatStyle.bubble(message.isMe);
          return MessageAction(
            onTap: () => state.isSelectionMode ? cubit.toggle(message) : null,
            onReply: () => sendMessageCubit.addMessageReply(message),
            onLongPress: () => cubit.toggle(message),
            bubble: ChatBubble(
              message: message,
              isSelected: state.selected.contains(message),
              style: bubbleStyle,
            ),
          );
        },
        itemCount: messages.length,
      ),
    );
  }
}
