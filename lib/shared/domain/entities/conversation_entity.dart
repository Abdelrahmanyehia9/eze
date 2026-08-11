import 'package:equatable/equatable.dart';
import 'package:eze/shared/domain/entities/mesasge_status_entites.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';

class ConversationEntity extends Equatable {
  final ConversationPeerEntity peer;
  final MessageStatusEntity messageStatus;
  final MessageEntity lastMessage;
  final bool pinned;

  const ConversationEntity({
    required this.peer,
    required this.messageStatus,
    required this.lastMessage,
    this.pinned = false,
  });

  @override
  List<Object?> get props => [peer, messageStatus, lastMessage, pinned];

  static ConversationEntity fake = ConversationEntity(
    peer: ConversationPeerEntity.fake,
    messageStatus: MessageStatusEntity.fake,
    lastMessage: MessageEntity.fake(),
  );

  ConversationEntity copyWith({bool? pinned}) => ConversationEntity(
    peer: peer,
    messageStatus: messageStatus,
    pinned: pinned ?? this.pinned,
    lastMessage: lastMessage,
  );
}
