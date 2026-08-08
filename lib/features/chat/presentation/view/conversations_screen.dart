import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_menu_anchor.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/chat/presentation/controller/all_conversations_cubit.dart';
import 'package:eze/features/chat/presentation/controller/conversation_requests_cubit.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/presentation/view/layout/conversation_list.dart';
import 'package:eze/shared/presentation/view/widgets/filter_chips.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/search_field.dart';
import 'package:flutter/material.dart';

part 'widgets/conversation_new_chat_floating_button.dart';
part 'widgets/conversation_chat_request_tile.dart';

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
          children:  [
            const SearchField(),
            const FilterChips(
              filters: ["الجميع", "المجموعات", "القنوات", "المفضلة", "الارشيف" ,"+اضافة"],
              activeIndex: 1,
            ),
            const ConversationChatRequestTile(),
            BaseBlocConsumer<AllConversationsCubit, List<ConversationEntity>>(
                successBuilder:(c)=> ConversationList(conversations: c,),
                loadingBuilder: ()=>const ConversationList(),
            ),
          ],
        ),
      ),
    );
  }
}
