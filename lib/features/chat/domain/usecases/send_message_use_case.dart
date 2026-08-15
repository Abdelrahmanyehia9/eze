import 'package:eze/features/chat/data/model/message_request.dart';
import 'package:eze/features/chat/domain/repository/chat_repository.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';

class SendMessageUseCase {
  final ChatRepository _repository;
  const SendMessageUseCase(this._repository);

  Future<MessageEntity> call(MessageRequest request) async {
    return _repository.sendMessage(request);
  }
}
