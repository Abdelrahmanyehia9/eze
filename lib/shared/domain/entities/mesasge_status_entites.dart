import 'package:eze/core/enums/message_status.dart';
import 'package:eze/core/utils/fake_data.dart';

class MessageStatusEntity {
  final MessageStatus status;
  final int unReadCount;
  final DateTime lastMessageTime;

  const MessageStatusEntity({
    required this.status,
    this.unReadCount = 0,
    required this.lastMessageTime,
  });

  static MessageStatusEntity fake = MessageStatusEntity(
    status: MessageStatus.unRead,
    lastMessageTime: FakeData.dateTime,
    unReadCount: FakeData.integer,
  );
}
