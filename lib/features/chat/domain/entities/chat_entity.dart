import 'package:equatable/equatable.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';

class ChatEntity extends Equatable{
  final String chatId;
  final List<MessageEntity> message;

  const ChatEntity({required this.chatId, required this.message});

  @override
  List<Object?> get props => [chatId, message];
}
