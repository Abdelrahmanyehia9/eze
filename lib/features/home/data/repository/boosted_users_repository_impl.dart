import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/extensions/variables.dart';
import 'package:eze/core/helper/cache_manger.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/features/home/data/datacource/boosted_users_local_datasource.dart';
import 'package:eze/features/home/data/datacource/boosted_users_remote_datasource.dart';
import 'package:eze/features/home/domain/repository/boosted_users_repository.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';

class BoostedUsersRepositoryImpl implements BoostedUsersRepository {
  final BoostedUsersRemoteDatasource remoteDataSource;
  final BoostedUsersLocalDatasource localDataSource;

  const BoostedUsersRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<AppException, List<ConversationPeerEntity>>>
  getBoostedUsers() async {
    return await CacheManger.instance.cacheFirst<List<ConversationPeerEntity>>(
      getLocal: localDataSource.getBoostedUsers,
      getRemote: remoteDataSource.getBoostedUsers,
      saveLocal: localDataSource.saveLocalUsers,
      cacheMiss: (e) => e.isNullOrEmpty,
    );
  }
}
