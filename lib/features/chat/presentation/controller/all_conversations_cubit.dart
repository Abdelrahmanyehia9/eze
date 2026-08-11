import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/chat/domain/usecases/get_all_conversations_use_case.dart';
import 'package:eze/shared/domain/usecases/toggle_pin_use_case.dart';
import 'package:eze/shared/data/models/conversation_filters.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllConversationsCubit extends Cubit<BaseState<List<ConversationEntity>>> {
  final GetAllConversationsUseCase _useCase;
  final TogglePinUseCase<ConversationEntity> _togglePinUseCase;

  AllConversationsCubit(this._useCase, this._togglePinUseCase)  : super(const .initial());

  List<ConversationEntity> _conversation = [];

  Future<void> getAllConversations([ConversationFiltersRequest? filters]) async {
    safeEmit(const .loading());
    final result = await _useCase.call(filters);
    result.fold((e) => safeEmit(.failure(e)), (conv) {
      if (conv.isEmpty) return safeEmit(const .empty());
      _conversation = conv;
      safeEmit(.success(conv));
    });
  }

  Future<void> pinConversations({
    required List<ConversationEntity> conversations,
  }) async {
    final updated = _togglePinUseCase.call(
      allItems: _conversation,
      target: conversations,
      pinned: true,
      idSelector: (c) => c.peer.uid,
      copyWithPinned: (c, pinned) => c.copyWith(pinned: pinned),
      pinnedSelector: (c) => c.pinned,
    );
    _conversation = updated;
    safeEmit(state.copyWith(data: updated));
  }

  Future<void> unpinConversations({
    required List<ConversationEntity> conversations,
  }) async {
    final updated = _togglePinUseCase.call(
      allItems: _conversation,
      target: conversations,
      pinned: false,
      idSelector: (c) => c.peer.uid,
      copyWithPinned: (c, pinned) => c.copyWith(pinned: pinned),
      pinnedSelector: (c) => c.pinned,
    );
    _conversation = updated;
    safeEmit(state.copyWith(data: updated));
  }
}