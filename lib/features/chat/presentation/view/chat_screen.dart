import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/components/app_menu_anchor.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/app_text_field.dart';
import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/extensions/chat_theme.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/date_time.dart';
import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/core/utils/time_message.dart';
import 'package:eze/features/chat/domain/entities/chat_entity.dart';
import 'package:eze/features/chat/presentation/controller/chat_by_id_cubit.dart';
import 'package:eze/features/chat/presentation/view/layout/chat_list.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

part 'widgets/chat_appbar.dart';

part 'widgets/chat_input_bar.dart';

part 'widgets/chat_background_container.dart';

class ChatScreen extends StatelessWidget {
  final ConversationPeerEntity sender;

  const ChatScreen({super.key, required this.sender});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomPadding: false,
      hPadding: 0,
      topPadding: false,
      appBar: _ChatAppbar(sender),
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          const _ChatBackgroundContainer(),
          Column(
            children: [
               Expanded(
                child: BaseBlocConsumer<ChatByIdCubit, ChatEntity>(
                  successBuilder:(chat)=> _buildChatList(chat.message),
                  loadingBuilder: ()=>_buildChatList(MessageEntity.fake().fakeList(12)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: context.safeBottomArea),
                child: const _ChatInputBar(),
              ),
            ],
          ).paddingHr,
        ],
      ),
    );
  }

  Widget _buildChatList(List<MessageEntity> messages) => ChatList(messages: messages,);
}
