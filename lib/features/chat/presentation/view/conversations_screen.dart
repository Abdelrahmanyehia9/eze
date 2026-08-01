import 'package:eze/core/components/app_logo.dart';
import 'package:eze/core/components/app_menu_anchor.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/shared/presentation/view/layout/conversation_list.dart';
import 'package:eze/shared/presentation/view/layout/recent_people_chats_list.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/search_field.dart';
import 'package:flutter/material.dart';

part 'widgets/conversation_new_chat_floating_button.dart';
part 'widgets/conversation_appbar.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const _ConversationAppbar(),
      hPadding: 0,
      floatingActionButton: const _ConversationNewChatFloatingButton(),
      body: SingleChildScrollView(
        child: Column(
          spacing: UISizes.h16,
          children: const [
            RecentPeopleChatsList(),
            SearchField(),
            ConversationList(count: 12),
          ],
        ).paddingHr,
      ),
    );
  }
}
