import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/cache_manger.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/shared/data/datasource/conversation_local_datasource.dart';
import 'package:eze/shared/data/datasource/conversation_remote_datasource.dart';
import 'package:eze/shared/data/models/conversation_filters.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/domain/repository/conversation_repository.dart';

class ConversationRepositoryImpl implements ConversationRepository {
  final ConversationRemoteDatasource _remoteDatasource;
  final ConversationLocalDatasource _localDatasource;

  ConversationRepositoryImpl({
    required this._remoteDatasource,
    required this._localDatasource,
  });

  @override
  Future<Either<AppException, List<ConversationEntity>>> getConversations(
    ConversationFilters? filters,
  ) async {
    return CacheManger.instance.cacheFirst(
        getLocal:()=> _localDatasource.getConversations(filters),
        getRemote: ()=>_remoteDatasource.getConversations(filters),
        saveLocal: _localDatasource.saveConversations,
        cacheMiss: (c)=>c == null);
  }
}
