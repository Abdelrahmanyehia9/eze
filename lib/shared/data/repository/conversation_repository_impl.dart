import 'package:eze/core/enums/conversation_type.dart';
import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/cache_manger.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/shared/data/datasource/conversation_local_datasource.dart';
import 'package:eze/shared/data/datasource/conversation_remote_datasource.dart';
import 'package:eze/shared/data/models/conversation_filters.dart';
import 'package:eze/shared/data/models/conversation_filters_response.dart';
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
    ConversationFiltersRequest? filters,
  ) async {
    return CacheManger.instance.cacheFirst(
      getLocal: () => _localDatasource.getConversations(filters),
      getRemote: () => _remoteDatasource.getConversations(filters),
      saveLocal: _localDatasource.saveConversations,
      cacheMiss: (c) => c == null,
    );
  }

  @override
  Future<List<ConversationFiltersResponse>> getConversationFilters() async {
    final folders = await _localDatasource.getFilters();

    return [
      const ConversationFiltersResponse(
        label: 'الجميع',
        filters: ConversationFiltersRequest(),
      ),
      const ConversationFiltersResponse(
        label: 'المجموعات',
        filters: ConversationFiltersRequest(type: ConversationType.group),
      ),
      const ConversationFiltersResponse(
        label: 'القنوات',
        filters: ConversationFiltersRequest(type: ConversationType.channel),
      ),
      const ConversationFiltersResponse(
        label: 'المفضلة',
        filters: ConversationFiltersRequest(isFavorite: true),
      ),
      const ConversationFiltersResponse(
        label: 'الأرشيف',
        filters: ConversationFiltersRequest(archivedChat: true),
      ),

      ...folders.map(
        (folder) => ConversationFiltersResponse(
          label: folder,
          filters: ConversationFiltersRequest(inFolder: folder),
        ),
      ),
    ];
  }
}
