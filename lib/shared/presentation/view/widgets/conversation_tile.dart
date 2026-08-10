import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/overlays/app_widget_overlay.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/date_time.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/variables.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/core/utils/time_message.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:eze/features/chat/presentation/view/widgets/message_recipt_icon.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  final ConversationEntity conversation;

  final bool isSelected;

  const ConversationTile({
    super.key,
    required this.conversation,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final peer = conversation.peer;
    final status = conversation.messageStatus;

    return AbsorbPointer(
      child: AppChip(
        paddingHr: 16,
        radius: 0,
        color: isSelected
            ? context.colors.primary.softLight
            : Colors.transparent,
        child: Row(
          spacing: UISizes.w8,
          children: [
            AppWidgetOverlay(
              overlay: [
                if (conversation.pinned)
                  (
                    AlignmentGeometry.topStart,
                    CircleAvatar(
                      radius: UISizes.sp10,
                      foregroundColor: context.colors.onPrimary,
                      backgroundColor: context.colors.primary,
                      child: Icon(AppIcons.pin, size: UISizes.sp14),
                    ),
                  ),
              ],
              child: UserCircleAvatar(
                size: UISizes.sp64,
                username: peer.name,
                image: peer.image,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(peer.name, style: context.textTheme.labelMedium),
                  AppIconText(
                    expandedText: true,
                    textStyle: context.textTheme.bodyMedium,
                    textSize: UISizes.sp18,
                    maxLines: 1,
                    customIcon: conversation.lastMessage.isMe
                        ? MessageReceiptIcon(status: status.status)
                        : null,
                    textOverflow: TextOverflow.ellipsis,
                    color: context.colors.surfaceContainerHigh,
                    text: _message(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  status.lastMessageTime.timeAgoAbbr(
                    messages: const TimeMessagesAr(),
                  ),
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
    return showSender
        ? "${last.sender.username} : ${last.message()}"
        : last.message();
  }
}
