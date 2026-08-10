import 'package:eze/features/chat/domain/entities/chat_entity.dart';
import 'package:eze/features/chat/domain/repository/chat_repository.dart';

class GetChatMessagesByIdUseCase {
  final ChatRepository _repository;
  const GetChatMessagesByIdUseCase(this._repository);

  Future<ChatEntity> getChatById(String id) async {
    return _repository.getChatById(id);
  }
}
