import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/home/domain/usecases/get_unread_conversations_use_case.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnreadConversationCubit
    extends Cubit<BaseState<List<ConversationEntity>>> {
  final GetUnreadConversationsUseCase _useCase;

  UnreadConversationCubit(this._useCase) : super(const BaseState.initial());

  Future<void> getUnreadConversations() async {
    safeEmit(const .loading());
    final result = await _useCase.call();
    result.fold((e) => safeEmit(.failure(e)), (u) {
      if (u.isEmpty) return safeEmit(const .empty());
      safeEmit(.success(u));
    });
  }
}
