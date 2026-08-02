import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/date_time.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/theme/app_decorations.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.isMe});
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    final bubbleColor = isMe ? AppColors.white : context.colors.primary;
    final textColor = isMe ? AppColors.black : AppColors.white;
    return Row(
      spacing: UISizes.sp4,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        _ChatBubbleContainer(
        color: bubbleColor,
          isMe: isMe,
          child: Column(
            spacing: UISizes.sp4,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ReplyPreview(textColor: textColor,),
               Gap.small(),
               _ChatMessageBody(textColor: textColor,senderColor: bubbleColor,),
               _ChatMessageStatus(textColor: textColor)
            ],
          ),
        ),
        if (!isMe) UserCircleAvatar(size: UISizes.sp56),
      ],
    );
  }
}

class _ChatBubbleContainer extends StatelessWidget {
  final Widget child;
  final bool isMe;
  final Color color;
  const _ChatBubbleContainer({
    required this.child,
    required this.color,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.width * .7),
      padding: EdgeInsets.all(UISizes.sp12),
      decoration: BoxDecoration(
        color: color,
        boxShadow: AppDecorations.cardShadow,
        borderRadius: BorderRadiusDirectional.only(
          topStart: isMe ? Radius.zero : Radius.circular(UISizes.r22),
          topEnd: Radius.circular(UISizes.r22),
          bottomStart: Radius.circular(UISizes.r22),
          bottomEnd: isMe ? Radius.circular(UISizes.r22) : Radius.zero,
        ),
      ),
      child: child,
    );
  }
}
class _ChatMessageStatus extends StatelessWidget {
  final Color textColor ;
  const _ChatMessageStatus({required this.textColor});

  @override
  Widget build(BuildContext context) {
    return  Row(
      spacing: UISizes.sp2,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (true)
          Icon(Icons.check, size: UISizes.sp12, color: textColor),
        AppText(
          DateTime.now()
              .subtract(const Duration(minutes: 30))
              .time12Only(locale: "ar"),
          style: context.textTheme.bodySmall,
          fontSize: UISizes.sp14,
          color: textColor,
        ),
      ],
    );
  }
}
class _ChatMessageBody extends StatelessWidget {
  final Color? senderColor ;
  final Color textColor ;
  const _ChatMessageBody({required this.textColor , this.senderColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(5<3)
          AppText("مريم خالد", color: senderColor?.lighten(.4)),
        AppText(
          "ممنونك انا عالبعاد ممنونك... عم عيش بهنا يا حبيبي من دونك",
          style: context.textTheme.labelMedium,
          color: textColor,
        ),
      ],
    );
  }
}
class _ReplyPreview extends StatelessWidget {
  final Color textColor ;
  const _ReplyPreview({required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(UISizes.sp8),
       decoration: BoxDecoration(
         color: Colors.black.withAppOpacity(0.05),
         borderRadius: BorderRadius.circular(UISizes.r12),
         border: BorderDirectional(
           start: BorderSide(color:context.colors.secondary,width: UISizes.sp4),
         )
       ),
       child: _ChatMessageBody(textColor: textColor),
    );
  }
}



