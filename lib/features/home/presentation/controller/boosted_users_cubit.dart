import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/home/domain/usecases/get_boosted_user_use_case.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoostedUsersCubit extends Cubit<BaseState<List<ConversationPeerEntity>>> {
  final GetBoostedUserUseCase _boostedUserUseCase;

  BoostedUsersCubit(this._boostedUserUseCase)
    : super(const BaseState.initial());

  Future<void> getBoostedUsers() async {
    safeEmit(const .loading());
    final result = await _boostedUserUseCase.call();
    result.fold((e) => safeEmit(.failure(e)), (u) {
      if (u.isEmpty) return safeEmit(const .empty());
      return safeEmit(.success(u));
    });
  }
}
