import 'package:eze/core/enums/message_status.dart';
import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/shared/data/models/conversation_filters.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/domain/repository/conversation_repository.dart';

class GetUnreadConversationsUseCase {
  final ConversationRepository _repository;
  const GetUnreadConversationsUseCase(this._repository);
  Future<Either<AppException, List<ConversationEntity>>> call() async {
    return _repository.getConversations(
      const ConversationFilters(status: MessageStatus.unRead, limit: 4),
    );
  }



}


