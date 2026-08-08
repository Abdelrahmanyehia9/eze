import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/profile/domain/repository/profile_repository.dart';

class GetProfileInfoUseCase {
  final ProfileRepository _repository ;
  const GetProfileInfoUseCase(this._repository) ;

  Future<Either<AppException,ProfileEntity>>getProfile([String? id])async{
    return _repository.getProfile(id) ;
  }


}