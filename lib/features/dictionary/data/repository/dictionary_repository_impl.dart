import 'package:eze/features/dictionary/data/datasource/dictionary_local_data_source.dart';
import 'package:eze/features/dictionary/data/models/dictionary_filters_request.dart';
import 'package:eze/features/dictionary/data/models/dictionary_filters_response.dart';
import 'package:eze/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:eze/features/dictionary/domain/repository/dictionary_repository.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  final DictionaryLocalDataSource localDataSource;

  DictionaryRepositoryImpl({required this.localDataSource});

  @override
  Future<List<DictionaryEntity>> getAllDictionary({
    DictionaryFiltersRequest? filters,
  }) async {
    return localDataSource.getDictionaryWords();
  }

  @override
  Future<List<DictionaryFiltersResponse>> getFilters() async {
    final List<String> folders = await localDataSource.getDictionaryFolders();
    return [
      const DictionaryFiltersResponse(
        label: 'الجميع',
        request: DictionaryFiltersRequest(),
      ),
      ...folders.map(
        (folder) => DictionaryFiltersResponse(
          label: folder,
          request: const DictionaryFiltersRequest(),
        ),
      ),
    ];
  }
}
