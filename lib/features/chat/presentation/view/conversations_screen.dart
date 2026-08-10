import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/overlays/app_menu_anchor.dart';
import 'package:eze/core/enums/message_status.dart';
import 'package:eze/core/enums/settings_detail_type.dart';
import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/chat/presentation/controller/all_conversations_cubit.dart';
import 'package:eze/features/chat/presentation/controller/conversation_requests_cubit.dart';
import 'package:eze/features/chat/presentation/view/mixin/mark_read_mixin.dart';
import 'package:eze/features/chat/presentation/view/mixin/pin_mixin.dart';
import 'package:eze/features/settings/data/model/settings_details_screen_args.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/presentation/controllers/selection_cubit.dart';
import 'package:eze/shared/presentation/view/layout/conversation_list.dart';
import 'package:eze/shared/presentation/view/widgets/filter_chips.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/search_field.dart';
import 'package:flutter/material.dart';
part 'widgets/conversation_new_chat_floating_button.dart';
part 'widgets/conversation_chat_request_tile.dart';
part 'widgets/conversation_header.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionBuilder<ConversationEntity>(
      builder: (selectionCubit, selectionState) => AppScaffold(
        hPadding: 0,
        appBar: const _ConversationHeader(),
        floatingActionButton: const _ConversationNewChatFloatingButton(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: UISizes.h16,
            children: [
              const SearchField().paddingHr,
              const FilterChips(
                filters: [
                  "الجميع",
                  "المجموعات",
                  "القنوات",
                  "المفضلة",
                  "الارشيف",
                  "+اضافة",
                ],
                activeIndex: 1,
              ).paddingHr,
              const ConversationChatRequestTile().paddingHr,
              BaseBlocConsumer<AllConversationsCubit, List<ConversationEntity>>(
                onSuccess: selectionCubit.setAll,
                successBuilder: (c) => ConversationList(
                  conversations: c,
                  onTap: selectionState.isSelectionMode
                      ? selectionCubit.toggle
                      : null,
                  onLongPress: selectionCubit.toggle,
                  selected: selectionState.selected.toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
