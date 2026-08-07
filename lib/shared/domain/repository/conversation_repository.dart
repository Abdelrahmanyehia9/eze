import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/shared/data/models/conversation_filters.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';

abstract class ConversationRepository {
  Future<Either<AppException, List<ConversationEntity>>> getConversations(ConversationFilters? filters) ;
}