import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/chat/domain/entities/chat_entity.dart';
import 'package:eze/features/chat/domain/usecases/get_chat_messages_by_id_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatByIdCubit extends Cubit<BaseState<ChatEntity>> {
  final GetChatMessagesByIdUseCase _useCase;

  ChatByIdCubit(this._useCase) : super(const .initial());

  Future<void> getChatById({required String id}) async {
    safeEmit(const .loading());
    final result = await _useCase.getChatById(id);
    if (result.message.isEmpty) return safeEmit(const .empty());
    safeEmit(.success(result));
  }
}
