import 'package:eze/core/enums/message_status.dart';
import 'package:eze/shared/data/models/localized_string_model.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/shared/domain/entities/user_entity.dart';

class MessageEntity {
  final LocalizedStringModel originalMessage ;
  final LocalizedStringModel? translatedMessage ;
  final UserEntity sender;
  final MessageEntity? repliedMessage ;
  final DateTime messageTime;
  final MessageStatus status ;

  const MessageEntity({
    this.translatedMessage,
    required this.originalMessage,
    required this.sender,
    this.repliedMessage,
    required this.messageTime,
     this.status = MessageStatus.read
  });

  static  MessageEntity fake()=>MessageEntity(
    translatedMessage: LocalizedStringModel.fake(),
    originalMessage: LocalizedStringModel.fake("US"),
    sender: UserEntity.fake(),
    messageTime: FakeData.dateTime
  );
  String message({bool autoTranslate = false}){
    if(!autoTranslate) return originalMessage.string ;
    return translatedMessage?.string ?? originalMessage.string ;
  }
  bool get isMe => sender.uid == "1" ;

}
