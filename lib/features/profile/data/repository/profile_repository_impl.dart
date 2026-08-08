import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/cache_manger.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/features/profile/data/datasource/profile_local_datasource.dart';
import 'package:eze/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileRemoteDatasource remoteDatasource;
  final ProfileLocalDatasource localDatasource;

  const ProfileRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });


  @override
  Future<Either<AppException, ProfileEntity>> getProfile([String? id]) async {
    return CacheManger.instance.cacheFirst<ProfileEntity>(
      getLocal: () => localDatasource.getProfile(id),
      getRemote: () => remoteDatasource.getProfile(id),
      saveLocal: localDatasource.saveProfile,
      cacheMiss: (e) => e == null,
    );
  }
}
