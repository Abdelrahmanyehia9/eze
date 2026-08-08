import 'package:eze/core/theme/app_chat_theme.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

extension ToBubble on ChatStyle {
  BubbleStyle bubble(bool isMe) {
    return BubbleStyle(
      bubbleColor: isMe ? outgoingBubbleColor : incomingBubbleColor,
      textColor: isMe ? outgoingTextColor : incomingTextColor,
      senderNameColor: isMe ? incomingBubbleColor : senderNameColor,
      replyBackgroundColor: replyBackgroundColor,
      replyBorderColor: isMe ? incomingBubbleColor : replyBorderColor,
      fontSize: fontSize
    );
  }
}

extension ChatThemeX on BuildContext {
  ChatStyle get chatTheme =>
      Theme.of(this).extension<ChatStyle>() ?? AppChatTheme.defaultLight;
}
