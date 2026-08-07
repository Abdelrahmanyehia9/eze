import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/chat/domain/usecases/get_conversation_requests_use_case.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationRequestsCubit extends Cubit<BaseState<List<ConversationEntity>>> {
  final GetConversationRequestsUseCase _useCase;

  ConversationRequestsCubit(this._useCase) : super(const BaseState.initial());

  Future<void> getConversationRequests() async {
    safeEmit(const .loading());
    final result = await _useCase.call();
    result.fold((e) => safeEmit(.failure(e)), (conv) {
      if (conv.isEmpty) return safeEmit(const .empty());
      safeEmit(.success(conv));
    });
  }
}
