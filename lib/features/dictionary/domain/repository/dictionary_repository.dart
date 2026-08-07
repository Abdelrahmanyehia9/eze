import 'package:eze/features/dictionary/data/models/dictionary_filters.dart';
import 'package:eze/features/dictionary/domain/entities/dictionary_entity.dart';

abstract class DictionaryRepository {

  Future<List<DictionaryEntity>>getAllDictionary({DictionaryFilters? filters});

}