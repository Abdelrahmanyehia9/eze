import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/shared/data/models/conversation_filters.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/domain/repository/conversation_repository.dart';

class GetAllConversationsUseCase {
  final ConversationRepository _repository;
  const GetAllConversationsUseCase(this._repository);

  Future<Either<AppException, List<ConversationEntity>>> call([
    ConversationFilters? filters,
  ]) async {
    return _repository.getConversations(filters);
  }
}
