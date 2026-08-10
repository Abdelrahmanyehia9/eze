import 'package:equatable/equatable.dart';
import 'package:eze/core/enums/chat_features.dart';

class ChatFeatureEntity extends Equatable {
  final ChatFeature feature;
  final bool enabled;

  const ChatFeatureEntity({
    required this.feature,
    this.enabled = false,
  });

  ChatFeatureEntity copyWith({
    ChatFeature? feature,
    bool? enabled,
  }) {
    return ChatFeatureEntity(
      feature: feature ?? this.feature,
      enabled: enabled ?? this.enabled,
    );
  }

  static ChatFeatureEntity fake() => const ChatFeatureEntity(
    feature: ChatFeature.autoTranslate,
  );

  @override
  List<Object?> get props => [
    feature,
    enabled,
  ];
}

