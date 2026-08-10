import 'package:eze/features/dictionary/data/models/dictionary_filters.dart';
import 'package:eze/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:eze/features/dictionary/domain/repository/dictionary_repository.dart';

class GetAllDictionaryWordsUseCase {
  final DictionaryRepository _repository;
  const GetAllDictionaryWordsUseCase(this._repository);

  Future<List<DictionaryEntity>> call({DictionaryFilters? filters}) async {
    return _repository.getAllDictionary(filters: filters);
  }
}
