import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/profile/domain/usecases/get_my_profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<BaseState<ProfileEntity>> {
  final GetProfileInfoUseCase _useCase;

  ProfileCubit(this._useCase) : super(const .initial());

  Future<void> getProfileData([String? id]) async {
    safeEmit(const .loading());
    final result = await _useCase.getProfile(id);
    result.fold((e) => safeEmit(.failure(e)), (p) => safeEmit(.success(p)));
  }
}
