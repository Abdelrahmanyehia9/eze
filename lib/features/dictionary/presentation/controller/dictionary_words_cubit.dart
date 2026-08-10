import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/extensions/safe_emit.dart';
import 'package:eze/features/dictionary/data/models/dictionary_filters.dart';
import 'package:eze/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:eze/features/dictionary/domain/usecase/get_all_dictionary_words_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryWordsCubit extends Cubit<BaseState<List<DictionaryEntity>>> {
  final GetAllDictionaryWordsUseCase _useCase;
  DictionaryWordsCubit(this._useCase) : super(const .initial());

  Future<void> getAllWordsByFilters([DictionaryFilters? filters]) async {
    safeEmit(const .loading());
    final words = await _useCase.call(filters: filters);
    if (words.isEmpty) return safeEmit(const .empty());
    return safeEmit(.success(words));
  }
}
