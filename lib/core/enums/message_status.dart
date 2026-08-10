enum MessageStatus {
  notArrived,
  unRead,
  read;

  bool get isNotArrived => this == notArrived;
  bool get isUnread => this == unRead;
  bool get isRead => this == read;
}
