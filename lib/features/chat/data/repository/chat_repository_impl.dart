import 'package:eze/features/chat/data/datasource/chat_local_datasource.dart';
import 'package:eze/features/chat/data/datasource/chat_remote_datasource.dart';
import 'package:eze/features/chat/data/model/message_request.dart';
import 'package:eze/features/chat/domain/entities/chat_entity.dart';
import 'package:eze/features/chat/domain/repository/chat_repository.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatLocalDatasource localDatasource;
  final ChatRemoteDatasource remoteDatasource;

  const ChatRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<ChatEntity> getChatById(String id) async {
    return localDatasource.getChat(id);
  }

  @override
  Future<MessageEntity> sendMessage(MessageRequest message) async {
    final localMessage = await localDatasource.sendMessage(message);
    var result = localMessage;
    try {
      result = await remoteDatasource.sendMessage(localMessage);
      return result;
    } catch (_) {
      return result;
    }
  }
}
