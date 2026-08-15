import 'package:eze/features/dictionary/data/models/dictionary_filters_request.dart';

class DictionaryFiltersResponse {
  final String label;
  final DictionaryFiltersRequest request;

  const DictionaryFiltersResponse({required this.label, required this.request});
}
