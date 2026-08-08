import 'package:equatable/equatable.dart';
import 'package:eze/core/enums/conversation_type.dart';
import 'package:eze/core/extensions/date_time.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/core/utils/time_message.dart';

class ConversationPeerEntity extends Equatable {
  final String uid;
  final String name;
  final String? image;
  final ConversationType type;

  final DateTime lastOnline;

  const ConversationPeerEntity({
    required this.uid,
    required this.name,
    this.image,
    this.type = ConversationType.single,
    required this.lastOnline,
  });

  @override
  List<Object?> get props => [uid];

  static ConversationPeerEntity fake = ConversationPeerEntity(
    uid: FakeData.string(2),
    name: FakeData.string(),
    type: ConversationType.group,
    image: FakeData.string(4),
    lastOnline: FakeData.dateTime,
  );

  bool get isOnline {
    final threshold = DateTime.now().subtract(const Duration(minutes: 2));
    return lastOnline.isAfter(threshold);
  }

  bool get isOffline {
    final threshold = DateTime.now().subtract(const Duration(days: 40));
    return lastOnline.isBefore(threshold);
  }

  String get lastOnlineStr {
    if (isOffline) return "غير متصل";
    return isOnline
        ? "متصل الان"
        : "متصل ${lastOnline.timeAgo(messages: const TimeMessagesAr())}";
  }
}
