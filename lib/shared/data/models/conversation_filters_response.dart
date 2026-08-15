import 'package:eze/shared/data/models/conversation_filters.dart';

class ConversationFiltersResponse {
  final String label;
  final ConversationFiltersRequest filters;
  const ConversationFiltersResponse({
    required this.label,
    required this.filters,
  });
}
