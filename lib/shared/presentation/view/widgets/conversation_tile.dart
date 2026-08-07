import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/enums/message_status.dart';
import 'package:eze/core/extensions/date_time.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/variables.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/time_message.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:eze/features/chat/presentation/view/widgets/message_recipt_icon.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  final ConversationEntity conversation;
  const ConversationTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    final peer = conversation.peer;
    final status = conversation.messageStatus;

    return AppClick(
      onTap: () => context.pushNamed(Routes.chat, arguments: peer),
      child: AbsorbPointer(
        child: Row(
          spacing: UISizes.w8,
          children: [
            UserCircleAvatar(size: UISizes.sp64, username: peer.name, image: peer.image),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(peer.name, style: context.textTheme.labelMedium),
                  AppIconText(
                    textStyle: context.textTheme.bodySmall,
                    maxLines: 1,
                    customIcon: conversation.lastMessage.isMe ?  MessageReceiptIcon(status: status.status,): null,
                    textOverflow: TextOverflow.ellipsis,
                    color: context.colors.surfaceContainerHigh,
                    text: _message(),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                AppText(
                  status.lastMessageTime.timeAgoAbbr(messages: const TimeMessagesAr()),
                  style: TextStyles.bodySmall,
                  color: context.colors.surfaceContainer,
                  fontSize: UISizes.sp12,
                ),
                if (status.unReadCount > 0)
                  Badge(
                    label: AppText(status.unReadCount.compactNumber),
                    backgroundColor: context.colors.primary,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _message() {
    final last = conversation.lastMessage;
    final showSender = !last.isMe && conversation.peer.type.isGroup;
    return showSender ? "${last.sender.username} : ${last.message()}" : last.message();
  }


}