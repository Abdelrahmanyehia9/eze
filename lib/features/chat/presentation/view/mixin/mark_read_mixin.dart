import 'package:eze/core/enums/message_status.dart';

mixin MarkReadMixin<T> {
  MessageStatus status(T item);
  bool hasUnread(Set<T> items) => items.any((e) => status(e).isUnread);
}
