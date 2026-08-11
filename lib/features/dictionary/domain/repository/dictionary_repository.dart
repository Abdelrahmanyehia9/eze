import 'package:eze/features/dictionary/data/models/dictionary_filters_request.dart';
import 'package:eze/features/dictionary/data/models/dictionary_filters_response.dart';
import 'package:eze/features/dictionary/domain/entities/dictionary_entity.dart';

abstract class DictionaryRepository {
  Future<List<DictionaryEntity>> getAllDictionary({DictionaryFiltersRequest? filters});
  Future<List<DictionaryFiltersResponse>>getFilters() ;


}
