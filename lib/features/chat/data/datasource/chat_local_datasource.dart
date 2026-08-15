import 'package:country_picker/country_picker.dart';
import 'package:eze/core/enums/message_status.dart';
import 'package:eze/features/chat/data/model/message_request.dart';
import 'package:eze/features/chat/domain/entities/chat_entity.dart';
import 'package:eze/shared/data/models/localized_string_model.dart';
import 'package:eze/shared/domain/entities/message_entity.dart';
import 'package:eze/shared/domain/entities/user_entity.dart';

class ChatLocalDatasource {
  Future<ChatEntity> getChat(String chatId) async {
    return ChatEntity(
      chatId: chatId,
      message: [
        MessageEntity(
          id: "1",
          originalMessage: LocalizedStringModel(
            "السلام عليكم",
            Country.parse("EG"),
          ),
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 20)),
        ),
        MessageEntity(
          id: "2",
          originalMessage: LocalizedStringModel(
            "وعليكم السلام، أخبارك إيه؟",
            Country.parse("EG"),
          ),
          sender: const UserEntity(
            uid: "uid0",
            username: "حازم احمد",
            image:
                "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",
          ),
          messageTime: DateTime.now().subtract(const Duration(minutes: 19)),
        ),
        MessageEntity(
          id: "3",
          originalMessage: LocalizedStringModel(
            "الحمد لله، كله تمام. وإنت؟",
            Country.parse("EG"),
          ),
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 18)),
        ),
        MessageEntity(
          id: "4",
          originalMessage: LocalizedStringModel(
            "تمام الحمد لله.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(
            uid: "uid0",
            username: "حازم احمد",
            image:
                "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",
          ),
          messageTime: DateTime.now().subtract(const Duration(minutes: 17)),
        ),
        MessageEntity(
          id: "5",
          originalMessage: LocalizedStringModel(
            "هتيجي القهوة النهارده؟",
            Country.parse("EG"),
          ),
          sender: const UserEntity(
            uid: "uid0",
            username: "حازم احمد",
            image:
                "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",
          ),
          messageTime: DateTime.now().subtract(const Duration(minutes: 16)),
        ),
        MessageEntity(
          id: "6",
          originalMessage: LocalizedStringModel(
            "آه إن شاء الله بعد الشغل.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 15)),
        ),
        MessageEntity(
          id: "7",
          originalMessage: LocalizedStringModel(
            "تمام، أنا هبقى هناك حوالي ٨.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(
            uid: "uid0",
            username: "حازم احمد",
            image:
                "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",
          ),
          messageTime: DateTime.now().subtract(const Duration(minutes: 14)),
        ),
        MessageEntity(
          id: "8",
          originalMessage: LocalizedStringModel(
            "ممتاز، هكلمك قبل ما أتحرك.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 13)),
        ),
        MessageEntity(
          id: "9",
          originalMessage: LocalizedStringModel(
            "ما تنساش تجيب الشاحن معاك.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(
            uid: "uid0",
            username: "حازم احمد",
            image:
                "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",
          ),
          messageTime: DateTime.now().subtract(const Duration(minutes: 12)),
        ),
        MessageEntity(
          id: "10",
          originalMessage: LocalizedStringModel(
            "😂 حاضر مش هنساه.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 11)),
        ),
        MessageEntity(
          id: "11",
          originalMessage: LocalizedStringModel(
            "طيب أشوفك بالليل.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(
            uid: "uid0",
            username: "حازم احمد",
            image:
                "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",
          ),
          messageTime: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
        MessageEntity(
          id: "12",
          repliedMessage: MessageEntity(
            id: "11",
            originalMessage: LocalizedStringModel(
              "طيب أشوفك بالليل.",
              Country.parse("EG"),
            ),
            sender: const UserEntity(
              uid: "uid0",
              username: "حازم احمد",
              image:
                  "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",
            ),
            messageTime: DateTime.now().subtract(const Duration(minutes: 10)),
          ),
          originalMessage: LocalizedStringModel(
            "تم، أشوفك على خير ❤️",
            Country.parse("EG"),
          ),
          status: MessageStatus.unRead,
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 9)),
        ),
      ],
    );
  }

  Future<MessageEntity> sendMessage(MessageRequest message) async {
    return MessageEntity(
      status: MessageStatus.notArrived,
      id: "1",
      originalMessage: LocalizedStringModel(
        message.message,
        Country.parse("EG"),
      ),
      sender: const UserEntity(uid: "1", username: "مريم"),
      messageTime: DateTime.now(),
    );
  }
}
