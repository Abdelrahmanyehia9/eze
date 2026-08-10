enum ConversationType {
  single,
  group,
  channel;

  bool get isSingle => this == single;
  bool get isGroup => this == group;
  bool get isChannel => this == channel;
}
