import 'package:eze/features/chat/data/model/message_request.dart';
import 'package:eze/features/chat/domain/entities/chat_entity.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Future<ChatEntity> getChatById(String id);
  Future<MessageEntity> sendMessage(MessageRequest message);
}
