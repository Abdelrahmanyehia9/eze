import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/chat/domain/usecases/get_all_conversations_use_case.dart';
import 'package:eze/shared/data/models/conversation_filters.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllConversationsCubit extends Cubit<BaseState<List<ConversationEntity>>> {
  final GetAllConversationsUseCase _useCase;
  AllConversationsCubit(this._useCase) : super(const .initial());

  Future<void> getAllConversations([ConversationFilters? filters]) async {
    safeEmit(const .loading());
    final result = await _useCase.call();
    result.fold((e) => safeEmit(.failure(e)), (conv) {
      if (conv.isEmpty) return safeEmit(const .empty());
      safeEmit(.success(conv));
    });
  }
}
