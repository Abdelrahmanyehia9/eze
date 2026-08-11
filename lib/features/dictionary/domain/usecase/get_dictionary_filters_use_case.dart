import 'package:eze/features/dictionary/data/models/dictionary_filters_response.dart';
import 'package:eze/features/dictionary/domain/repository/dictionary_repository.dart';

class GetDictionaryFiltersUseCase {
final DictionaryRepository _repository ;
const GetDictionaryFiltersUseCase(this._repository) ;

Future<List<DictionaryFiltersResponse>>call()async{
  return _repository.getFilters() ;
}

}