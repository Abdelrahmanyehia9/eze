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
import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/chat/domain/entities/chat_entity.dart';
import 'package:eze/features/chat/presentation/controller/chat_by_id_cubit.dart';
import 'package:eze/features/chat/presentation/view/layout/chat_list.dart';
import 'package:eze/features/settings/presentation/controller/base_settings_cubit.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/chat_appbar.dart';

part 'widgets/chat_input_bar.dart';

part 'widgets/chat_background_container.dart';

class ChatScreen extends StatelessWidget {
  final ConversationPeerEntity sender;

  const ChatScreen({super.key, required this.sender});

  @override
  Widget build(BuildContext context) {
    final style = context.read<ThemeCubit>().value.chatTheme ?? context.chatTheme;
    return AppScaffold(
      bottomPadding: false,
      hPadding: 0,
      topPadding: false,
      appBar: _ChatAppbar(sender, style: style),
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          _ChatBackgroundContainer(style: style),
          Column(
            children: [
              Expanded(
                child: BaseBlocConsumer<ChatByIdCubit, ChatEntity>(
                  successBuilder: (chat) =>
                      ChatList(messages: chat.message, chatStyle: style),
                  loadingBuilder: () => ChatList(
                    messages: MessageEntity.fake().fakeList(12),
                    chatStyle: style,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: context.safeBottomArea),
                child: _ChatInputBar(style: style),
              ),
            ],
          ).paddingHr,
        ],
      ),
    );
  }
}
