import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/dictionary/data/models/dictionary_filters_response.dart';
import 'package:eze/features/dictionary/domain/usecase/get_dictionary_filters_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryFiltersCubit
    extends Cubit<BaseState<List<DictionaryFiltersResponse>>> {
  final GetDictionaryFiltersUseCase _useCase;
  DictionaryFiltersCubit(this._useCase) : super(const .initial());
  late final ValueNotifier<int> _selectedIndex;

  Future<void> init() async {
    safeEmit(const .loading());
    final result = await _useCase.call();
    if (result.isEmpty) return safeEmit(const .empty());
    _selectedIndex = ValueNotifier(0);
    safeEmit(.success(result));
  }

  void onSelect(int i) {
    _selectedIndex.value = i;
  }

  ValueNotifier<int> get selectedIndexNotifier => _selectedIndex;
}
