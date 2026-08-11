import 'package:eze/core/enums/conversation_type.dart';
import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/shared/data/models/conversation_filters.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/domain/repository/conversation_repository.dart';

class GetConversationRequestsUseCase {
  final ConversationRepository _repository;
  const GetConversationRequestsUseCase(this._repository);

  Future<Either<AppException, List<ConversationEntity>>> call() async {
    return _repository.getConversations(
      const ConversationFiltersRequest(
        isFriends: false,
        type: ConversationType.single,
      ),
    );
  }
}
