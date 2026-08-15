import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/chat/data/model/message_request.dart';
import 'package:eze/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessageCubit extends Cubit<BaseState<MessageEntity>> {
  final SendMessageUseCase _useCase;
  SendMessageCubit(this._useCase) : super(const .initial());

  final ValueNotifier<MessageEntity?> _repliedMessage = ValueNotifier(null);

  Future<void> sendMessage(MessageRequest request) async {
    safeEmit(const .loading());
    final result = await _useCase.call(request);
    safeEmit(.success(result));
  }

  void addMessageReply(MessageEntity? message) {
    _repliedMessage.value = message;
  }

  ValueNotifier<MessageEntity?> get repliedMessage => _repliedMessage;

  @override
  Future<void> close() {
    _repliedMessage.dispose();
    return super.close();
  }
}
