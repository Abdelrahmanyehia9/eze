import 'package:collection/collection.dart';
import 'package:eze/core/enums/message_status.dart';
import 'package:eze/shared/data/models/localized_string_model.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/shared/data/models/conversation_filters.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';
import 'package:eze/shared/domain/entities/mesasge_status_entites.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';
import 'package:eze/shared/domain/entities/user_entity.dart';

class ConversationRemoteDatasource {
  Future<List<ConversationEntity>> getConversations(
    ConversationFilters? filters,
  ) async {
    return [
      ConversationEntity(
        peer: ConversationPeerEntity(
          uid: "uid0",
          name: "حازم احمد",
          image:
              "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",
          lastOnline: DateTime.now(),
        ),
        messageStatus: MessageStatusEntity(
          status: MessageStatus.unRead,
          unReadCount: 434,
          lastMessageTime: DateTime.now().subtract(const Duration(days: 2)),
        ),
        lastMessage: MessageEntity(
          originalMessage: LocalizedStringModel.fake(),
          messageTime: FakeData.dateTime,
          sender: const UserEntity(uid: "uid1", username: "اميرة"),
        ),
      ),
      ConversationEntity(
        pinned: true,
        peer: ConversationPeerEntity(
          uid: "uid1",
          name: "اميرة",
          lastOnline: FakeData.dateTime,
          image:
              "https://img.magnific.com/free-photo/front-view-business-woman-suit_23-2148603018.jpg?semt=ais_test_b&w=740&q=80",
        ),
        messageStatus: MessageStatusEntity(
          status: MessageStatus.unRead,
          unReadCount: 2,
          lastMessageTime: DateTime.now().subtract(const Duration(minutes: 22)),
        ),
        lastMessage: MessageEntity(
          messageTime: FakeData.dateTime,
          originalMessage: LocalizedStringModel.fake(),
          sender: const UserEntity(uid: "uid1", username: "اميرة"),
        ),
      ),
    ].sorted((a, b) {
      if (a.pinned != b.pinned) {
        return a.pinned ? -1 : 1;
      }

      return b.messageStatus.lastMessageTime.compareTo(
        a.messageStatus.lastMessageTime,
      );
    }).toList();
  }
}
