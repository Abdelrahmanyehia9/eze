import 'package:equatable/equatable.dart';
import 'package:eze/core/enums/conversation_type.dart';
import 'package:eze/core/enums/message_status.dart';

class ConversationFilters extends Equatable{
  final ConversationType? type;
  final MessageStatus? status;
  final String? query;
  final int? limit;
  final bool? archivedChat;
  final String? inFolder ;
  final bool isFriends ;

  const ConversationFilters({
    this.type,
    this.archivedChat,
    this.limit,
    this.status,
    this.query,
    this.inFolder,
    this.isFriends = true
  });

  @override
  List<Object?> get props => [type,inFolder, isFriends ,status, query, limit, archivedChat];


}
