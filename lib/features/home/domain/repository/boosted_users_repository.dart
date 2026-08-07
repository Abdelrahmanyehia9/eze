import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';

abstract class BoostedUsersRepository {
  Future<Either<AppException, List<ConversationPeerEntity>>>getBoostedUsers() ;
}