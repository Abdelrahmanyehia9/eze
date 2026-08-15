import 'package:eze/shared/domain/entities/message_entity.dart';

class MessageRequest {
  final String message;
  final MessageEntity? replyOn;

  MessageRequest({required this.message, this.replyOn});
}
