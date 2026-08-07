import 'package:country_picker/country_picker.dart';
import 'package:eze/core/enums/message_status.dart';
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
          originalMessage: LocalizedStringModel(
            "السلام عليكم",
            Country.parse("EG"),
          ),
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 20)),
        ),
        MessageEntity(
          originalMessage: LocalizedStringModel(
            "وعليكم السلام، أخبارك إيه؟",
            Country.parse("EG"),
          ),
          sender: const UserEntity(        uid: "uid0",
            username: "حازم احمد",
            image: "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",),
          messageTime: DateTime.now().subtract(const Duration(minutes: 19)),
        ),
        MessageEntity(
          originalMessage: LocalizedStringModel(
            "الحمد لله، كله تمام. وإنت؟",
            Country.parse("EG"),
          ),
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 18)),
        ),
        MessageEntity(
          originalMessage: LocalizedStringModel(
            "تمام الحمد لله.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(        uid: "uid0",
            username: "حازم احمد",
            image: "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",),
          messageTime: DateTime.now().subtract(const Duration(minutes: 17)),
        ),
        MessageEntity(
          originalMessage: LocalizedStringModel(
            "هتيجي القهوة النهارده؟",
            Country.parse("EG"),
          ),
          sender: const UserEntity(        uid: "uid0",
            username: "حازم احمد",
            image: "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",),
          messageTime: DateTime.now().subtract(const Duration(minutes: 16)),
        ),
        MessageEntity(
          originalMessage: LocalizedStringModel(
            "آه إن شاء الله بعد الشغل.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 15)),
        ),
        MessageEntity(
          originalMessage: LocalizedStringModel(
            "تمام، أنا هبقى هناك حوالي ٨.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(        uid: "uid0",
            username: "حازم احمد",
            image: "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",),
          messageTime: DateTime.now().subtract(const Duration(minutes: 14)),
        ),
        MessageEntity(
          originalMessage: LocalizedStringModel(
            "ممتاز، هكلمك قبل ما أتحرك.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 13)),
        ),
        MessageEntity(
          originalMessage: LocalizedStringModel(
            "ما تنساش تجيب الشاحن معاك.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(        uid: "uid0",
            username: "حازم احمد",
            image: "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",),
          messageTime: DateTime.now().subtract(const Duration(minutes: 12)),
        ),
        MessageEntity(
          originalMessage: LocalizedStringModel(
            "😂 حاضر مش هنساه.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(uid: "1", username: "me"),
          messageTime: DateTime.now().subtract(const Duration(minutes: 11)),
        ),
        MessageEntity(
          originalMessage: LocalizedStringModel(
            "طيب أشوفك بالليل.",
            Country.parse("EG"),
          ),
          sender: const UserEntity(        uid: "uid0",
            username: "حازم احمد",
            image: "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",),
          messageTime: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
        MessageEntity(
          repliedMessage: MessageEntity(
            originalMessage: LocalizedStringModel(
              "طيب أشوفك بالليل.",
              Country.parse("EG"),
            ),
            sender: const UserEntity(        uid: "uid0",
              username: "حازم احمد",
              image: "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",),
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
}
