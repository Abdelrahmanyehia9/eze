import 'package:eze/features/dictionary/data/datasource/dictionary_local_data_source.dart';
import 'package:eze/features/dictionary/data/models/dictionary_filters.dart';
import 'package:eze/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:eze/features/dictionary/domain/repository/dictionary_repository.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  final DictionaryLocalDataSource localDataSource;
  DictionaryRepositoryImpl({required this.localDataSource});

  @override
  Future<List<DictionaryEntity>> getAllDictionary({
    DictionaryFilters? filters,
  }) async {
    return localDataSource.getDictionaryWords();
  }
}
