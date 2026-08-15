import 'package:eze/shared/data/models/conversation_filters_response.dart';
import 'package:eze/shared/domain/repository/conversation_repository.dart';

class GetAllConversationFiltersUseCase {
  final ConversationRepository _repository;
  GetAllConversationFiltersUseCase(this._repository);

  Future<List<ConversationFiltersResponse>> call() async {
    return _repository.getConversationFilters();
  }
}
