import 'package:eze/core/enums/chat_features.dart';
import 'package:eze/core/extensions/fake_data.dart';

class SystemControlEntity {
  final List<ChatFeatureEntity>features;

  SystemControlEntity({required this.features});

  static SystemControlEntity fake() =>
      SystemControlEntity(features: ChatFeatureEntity.fake().fakeList(4));
}


class ChatFeatureEntity {
  final ChatFeature feature;
  final bool enabled;

  const ChatFeatureEntity({required this.feature, this.enabled = false});

  static ChatFeatureEntity fake() =>
      const ChatFeatureEntity(
          feature: ChatFeature.autoTranslate
      );

}