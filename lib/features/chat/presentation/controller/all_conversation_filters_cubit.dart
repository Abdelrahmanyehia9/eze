import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/chat/domain/usecases/get_all_conversation_filters_use_case.dart';
import 'package:eze/shared/data/models/conversation_filters_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllConversationFiltersCubit
    extends Cubit<BaseState<List<ConversationFiltersResponse>>> {
  final GetAllConversationFiltersUseCase _useCase;
  AllConversationFiltersCubit(this._useCase) : super(const .initial());
  late final ValueNotifier<int> _selectedIndex;

  Future<void> init() async {
    safeEmit(const .loading());
    final result = await _useCase.call();
    if (result.isEmpty) return safeEmit(const .empty());
    _selectedIndex = ValueNotifier(0);
    safeEmit(.success(result));
  }

  Future<void> onSelect(int i) async {
    _selectedIndex.value = i;
  }

  ValueNotifier<int> get selectedIndexNotifier => _selectedIndex;
}
