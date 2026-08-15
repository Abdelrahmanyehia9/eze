import 'package:eze/core/enums/message_status.dart';
import 'package:eze/shared/data/models/localized_string_model.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/shared/domain/entities/user_entity.dart';

class MessageEntity {
  final String id;
  final LocalizedStringModel originalMessage;
  final LocalizedStringModel? translatedMessage;
  final UserEntity sender;
  final MessageEntity? repliedMessage;
  final DateTime messageTime;
  final MessageStatus status;
  final bool isPinned;

  const MessageEntity({
    required this.id,
    this.translatedMessage,
    required this.originalMessage,
    required this.sender,
    this.repliedMessage,
    required this.messageTime,
    this.status = MessageStatus.read,
    this.isPinned = false,
  });

  static MessageEntity fake() => MessageEntity(
    id: FakeData.string(),
    translatedMessage: LocalizedStringModel.fake(),
    originalMessage: LocalizedStringModel.fake("US"),
    sender: UserEntity.fake(),
    messageTime: FakeData.dateTime,
  );
  MessageEntity copyWith({
    LocalizedStringModel? originalMessage,
    LocalizedStringModel? translatedMessage,
    UserEntity? sender,
    MessageEntity? repliedMessage,
    DateTime? messageTime,
    MessageStatus? status,
    bool? isPinned,
    String? id,
  }) => MessageEntity(
    id: id ?? this.id,
    originalMessage: originalMessage ?? this.originalMessage,
    translatedMessage: translatedMessage ?? this.translatedMessage,
    sender: sender ?? this.sender,
    repliedMessage: repliedMessage ?? this.repliedMessage,
    messageTime: messageTime ?? this.messageTime,
    status: status ?? this.status,
    isPinned: isPinned ?? this.isPinned,
  );
}

extension MessageEntityExt on MessageEntity {
  String message({bool autoTranslate = false}) {
    if (!autoTranslate) return originalMessage.string;
    return translatedMessage?.string ?? originalMessage.string;
  }

  bool get isMe => sender.isMe;
}
