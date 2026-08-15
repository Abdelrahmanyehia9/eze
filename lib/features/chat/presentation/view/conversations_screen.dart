import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/overlays/app_menu_anchor.dart';
import 'package:eze/core/enums/message_status.dart';
import 'package:eze/core/enums/settings_detail_type.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/features/chat/presentation/controller/all_conversation_filters_cubit.dart';
import 'package:eze/features/chat/presentation/controller/all_conversations_cubit.dart';
import 'package:eze/features/chat/presentation/controller/conversation_requests_cubit.dart';
import 'package:eze/features/chat/presentation/view/mixin/mark_read_mixin.dart';
import 'package:eze/features/chat/presentation/view/mixin/pin_mixin.dart';
import 'package:eze/features/settings/data/model/settings_details_screen_args.dart';
import 'package:eze/shared/data/models/conversation_filters_response.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/presentation/controllers/selection_cubit.dart';
import 'package:eze/shared/presentation/view/layout/conversation_list.dart';
import 'package:eze/shared/presentation/view/widgets/filter_chips.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'widgets/conversation_new_chat_floating_button.dart';
part 'widgets/conversation_chat_request_tile.dart';
part 'widgets/conversation_header.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key});

  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  AllConversationFiltersCubit get _filtersCubit =>
      context.read<AllConversationFiltersCubit>();

  Future<void> _onFiltersChanged(
    int newFilterIndex,
    List<ConversationFiltersResponse> filters,
  ) async {
    _filtersCubit.onSelect(newFilterIndex);
    context.read<AllConversationsCubit>().getAllConversations(
      filters[_filtersCubit.selectedIndexNotifier.value].filters,
    );
  }

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
              BaseBlocConsumer<
                AllConversationFiltersCubit,
                List<ConversationFiltersResponse>
              >(
                successBuilder: (filters) => ValueListenableBuilder(
                  valueListenable: _filtersCubit.selectedIndexNotifier,
                  builder: (context, value, child) => _buildFilters(
                    filters: filters.map((e) => e.label).toList(),
                    active: value,
                    onChanged: (i) => _onFiltersChanged(i, filters),
                  ).paddingHr,
                ),
                loadingBuilder: () => _buildFilters(
                  filters: FakeData.list<String>(FakeData.string()),
                ),
              ),
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

  Widget _buildFilters({
    required List<String> filters,
    int active = 0,
    ValueChanged<int>? onChanged,
  }) =>
      FilterChips(filters: filters, onChanged: onChanged, activeIndex: active);
}
