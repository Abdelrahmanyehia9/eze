import 'package:eze/features/chat/domain/entities/chat_entity.dart';

abstract class ChatRepository {

  Future<ChatEntity>getChatById(String id) ;



}