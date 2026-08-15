import 'package:eze/core/enums/message_status.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';

class ChatRemoteDatasource {
  Future<MessageEntity> sendMessage(MessageEntity requestedMessage) async {
    return requestedMessage.copyWith(status: MessageStatus.read);
  }
}
