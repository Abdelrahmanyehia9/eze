import 'package:eze/core/errors/exceptions.dart';
import 'package:eze/core/helper/either.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<AppException, ProfileEntity>> getProfile([String? id]);
}
