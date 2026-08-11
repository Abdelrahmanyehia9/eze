import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/date_time.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_decorations.dart';
import 'package:eze/features/chat/presentation/view/widgets/message_recipt_icon.dart';
import 'package:eze/features/settings/domain/entities/theme_entity.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class BubbleStyle {
  final Color bubbleColor;
  final Color textColor;
  final Color senderNameColor;
  final Color replyBackgroundColor;
  final Color replyBorderColor;
  final ChatFontTypes? font;

  const BubbleStyle({
    required this.bubbleColor,
    required this.textColor,
    required this.senderNameColor,
    required this.replyBackgroundColor,
    required this.replyBorderColor,
    this.font,
  });

  Color get statusIconColor => textColor;
}

class ChatBubble extends StatelessWidget {
  final MessageEntity message;
  final BubbleStyle style;
  final bool isSelected;
  const ChatBubble({
    super.key,
    this.isSelected = false,
    required this.style,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMe = message.isMe;
    return ColoredBox(
      color: isSelected ? context.primaryColor.softLight : Colors.transparent,
      child: Row(
        spacing: UISizes.sp4,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: isMe
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          ChatBubbleContainer(
            isMe: isMe,
            bubbleColor: style.bubbleColor,
            child: Column(
              spacing: UISizes.sp4,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (message.repliedMessage != null)
                  Padding(
                    padding: EdgeInsets.only(bottom: UISizes.sp8),
                    child: _ReplyPreview(
                      bubbleStyle: style,
                      repliedMessage: message.repliedMessage!,
                    ),
                  ),
                _ChatMessageBody(
                  bubbleStyle: style,
                  message: message,
                  showSenderName: !isMe,
                ),
                _ChatMessageStatus(bubbleStyle: style, message: message),
              ],
            ),
          ),
          if (!isMe)
            UserCircleAvatar(
              size: UISizes.sp56,
              username: message.sender.username,
              image: message.sender.image,
            ),
        ],
      ).paddingHr.appPaddingVr(4),
    ).appPaddingVr(2);
  }
}

class ChatBubbleContainer extends StatelessWidget {
  final Widget child;
  final bool isMe;
  final Color bubbleColor;

  const ChatBubbleContainer({
    super.key,
    required this.child,
    required this.isMe,
    required this.bubbleColor,
  });

  @override
  Widget build(BuildContext context) {
    final radius = UISizes.r16;
    return ClipRSuperellipse(
      borderRadius: BorderRadiusDirectional.only(
        topStart: isMe ? Radius.zero : Radius.circular(radius),
        topEnd: Radius.circular(radius),
        bottomStart: Radius.circular(radius),
        bottomEnd: isMe ? Radius.circular(radius) : Radius.zero,
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: context.width * .65),
        padding: EdgeInsets.all(UISizes.sp8),
        decoration: BoxDecoration(
          color: bubbleColor,
          boxShadow: AppDecorations.cardShadow,
        ),
        child: child,
      ),
    );
  }
}

class _ChatMessageStatus extends StatelessWidget {
  final BubbleStyle bubbleStyle;
  final MessageEntity message;

  const _ChatMessageStatus({required this.bubbleStyle, required this.message});

  @override
  Widget build(BuildContext context) {
    final fontSize = bubbleStyle.font?.size != null
        ? bubbleStyle.font!.size.sp * .8
        : UISizes.sp14;
    return Row(
      spacing: UISizes.sp2,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (message.isMe) MessageReceiptIcon(status: message.status),
        AppText(
          message.messageTime.time12Only(locale: "ar"),
          style: context.textTheme.bodySmall,
          fontSize: fontSize,
          color: bubbleStyle.textColor,
        ),
      ],
    );
  }
}

class _ChatMessageBody extends StatelessWidget {
  final BubbleStyle bubbleStyle;
  final MessageEntity message;

  final bool showSenderName;

  const _ChatMessageBody({
    required this.bubbleStyle,
    required this.message,
    required this.showSenderName,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = bubbleStyle.font?.size != null
        ? bubbleStyle.font!.size.sp
        : UISizes.sp18;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showSenderName)
          AppText(
            message.sender.username,
            color: bubbleStyle.senderNameColor,
            style: context.textTheme.labelSmall,
            fontSize: fontSize * .8,
          ),
        AppText(
          message.message(),
          style: context.textTheme.labelMedium,
          color: bubbleStyle.textColor,
          fontSize: fontSize,
        ),
      ],
    );
  }
}

class _ReplyPreview extends StatelessWidget {
  final BubbleStyle bubbleStyle;
  final MessageEntity repliedMessage;

  const _ReplyPreview({
    required this.bubbleStyle,
    required this.repliedMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UISizes.sp8),
      decoration: BoxDecoration(
        color: bubbleStyle.replyBackgroundColor,
        borderRadius: BorderRadius.circular(UISizes.r12),
        border: BorderDirectional(
          start: BorderSide(
            color: bubbleStyle.replyBorderColor,
            width: UISizes.sp4,
          ),
        ),
      ),
      child: _ChatMessageBody(
        bubbleStyle: bubbleStyle,
        message: repliedMessage,
        showSenderName: true,
      ),
    );
  }
}
