import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/extensions/chat_theme.dart';
import 'package:eze/core/extensions/date_time.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/core/theme/app_decorations.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

@immutable
class BubbleStyle {
  final Color bubbleColor;
  final Color textColor;
  final Color senderNameColor;
  final Color replyBackgroundColor;
  final Color replyBorderColor;

  const BubbleStyle({
    required this.bubbleColor,
    required this.textColor,
    required this.senderNameColor,
    required this.replyBackgroundColor,
    required this.replyBorderColor,
  });

  Color get statusIconColor => textColor;
}


class ChatBubble extends StatelessWidget {
  final ChatStyle? theme ;
  const ChatBubble({super.key,  this.theme, required this.isMe});

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final theme = (this.theme ?? context.chatTheme).bubble(isMe);
    return Row(
      spacing: UISizes.sp4,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        ChatBubbleContainer(
          isMe: isMe,
          bubbleColor: theme.bubbleColor,
          child: Column(
            spacing: UISizes.sp4,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ReplyPreview(bubbleStyle: theme),
              Gap.small(),
              _ChatMessageBody(bubbleStyle: theme, showSenderName: !isMe),
              _ChatMessageStatus(bubbleStyle: theme),
            ],
          ),
        ),
        if (!isMe) UserCircleAvatar(size: UISizes.sp56),
      ],
    );
  }
}

class ChatBubbleContainer extends StatelessWidget {
  final Widget child;
  final bool isMe;
  final Color bubbleColor;

  const ChatBubbleContainer({super.key,
    required this.child,
    required this.isMe,
    required this.bubbleColor,
  });

  @override
  Widget build(BuildContext context) {
    final radius = UISizes.r20  ;
    return Container(
      constraints: BoxConstraints(maxWidth: context.width * .7),
      padding: EdgeInsets.all(UISizes.sp12),
      decoration: BoxDecoration(
        color: bubbleColor,
        boxShadow: AppDecorations.cardShadow,
        borderRadius: BorderRadiusDirectional.only(
          topStart: isMe ? Radius.zero : Radius.circular(radius),
          topEnd: Radius.circular(radius),
          bottomStart: Radius.circular(radius),
          bottomEnd: isMe ? Radius.circular(radius) : Radius.zero,
        ),
      ),
      child: child,
    );
  }
}
class _ChatMessageStatus extends StatelessWidget {
  final BubbleStyle bubbleStyle;

  const _ChatMessageStatus({required this.bubbleStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: UISizes.sp2,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (true)
          Icon(
            Icons.check,
            size: UISizes.sp12,
            color: bubbleStyle.statusIconColor,
          ),
         AppText(
          DateTime.now()
              .subtract(const Duration(minutes: 30))
              .time12Only(locale: "ar"),
          style: context.textTheme.bodySmall,
          fontSize: UISizes.sp14,
          color: bubbleStyle.textColor,
        ),
      ],
    );
  }
}
class _ChatMessageBody extends StatelessWidget {
  final BubbleStyle bubbleStyle;
  final bool showSenderName;
  const _ChatMessageBody({required this.bubbleStyle, required this.showSenderName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showSenderName) AppText("مريم خالد", color: bubbleStyle.senderNameColor),
        AppText(
          "ممنونك انا عالبعاد ممنونك... عم عيش بهنا يا حبيبي من دونك هجرك ما ضيعني انت اللى قلبك ضاع ندمان شو يعني مطرح ما كنت ارجع ♥",
          style: context.textTheme.labelMedium,
          color: bubbleStyle.textColor,
        ),
      ],
    );
  }
}
class _ReplyPreview extends StatelessWidget {
  final BubbleStyle bubbleStyle;
  const _ReplyPreview({required this.bubbleStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UISizes.sp8),
      decoration: BoxDecoration(
        color: bubbleStyle.replyBackgroundColor,
        borderRadius: BorderRadius.circular(UISizes.r12),
        border: BorderDirectional(
          start: BorderSide(color: bubbleStyle.replyBorderColor, width: UISizes.sp4),
        ),
      ),
      child: _ChatMessageBody(bubbleStyle: bubbleStyle, showSenderName: true),
    );
  }
}
