import 'package:eze/shared/data/models/conversation_filters.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';

class ConversationLocalDatasource {
  Future<void> saveConversations(List<ConversationEntity> conversations) async {
    return;
  }

  Future<List<ConversationEntity>?> getConversations(
    ConversationFiltersRequest? filters,
  ) async {
    return null;
  }

  Future<List<String>> getFilters() async {
    return ["الاصدقاء", "العائلة"];
  }
}
