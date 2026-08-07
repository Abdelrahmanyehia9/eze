import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/features/home/domain/repository/boosted_users_repository.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';

class GetBoostedUserUseCase {
  final BoostedUsersRepository _repository ;
  const GetBoostedUserUseCase(this._repository);
  Future<Either<AppException, List<ConversationPeerEntity>>>call(){
    return _repository.getBoostedUsers() ;
  }

}