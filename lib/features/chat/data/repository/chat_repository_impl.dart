import 'package:eze/features/chat/data/datasource/chat_local_datasource.dart';
import 'package:eze/features/chat/data/datasource/chat_remote_datasource.dart';
import 'package:eze/features/chat/domain/entities/chat_entity.dart';
import 'package:eze/features/chat/domain/repository/chat_repository.dart';

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
}
