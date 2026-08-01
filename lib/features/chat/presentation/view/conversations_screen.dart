import 'package:eze/core/components/app_menu_anchor.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/shared/presentation/view/layout/conversation_list.dart';
import 'package:eze/shared/presentation/view/widgets/filter_chips.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/search_field.dart';
import 'package:flutter/material.dart';

part 'widgets/conversation_new_chat_floating_button.dart';
part 'widgets/chat_request_tile.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: DefaultAppBar.logo(
        title: "المحادثات",
        actions: const [AppMenuAnchor(items: [])],
      ),
      floatingActionButton: const _ConversationNewChatFloatingButton(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: UISizes.h16,
          children: const [
            SearchField(),
            FilterChips(
              filters: ["الجميع", "المجموعات", "القنوات", "المفضلة", "الارشيف"],
              activeIndex: 1,
            ),
            ChatRequestTile(),
            ConversationList(count: 12),
          ],
        ),
      ),
    );
  }
}
