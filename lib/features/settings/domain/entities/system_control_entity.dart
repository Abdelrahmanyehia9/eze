import 'package:equatable/equatable.dart';
import 'package:eze/core/enums/chat_features.dart';
import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/features/settings/domain/entities/chat_feature_entity.dart';

class SystemControlEntity extends Equatable {
  final List<ChatFeatureEntity> features;

  const SystemControlEntity({required this.features});

  static SystemControlEntity fake() =>
      SystemControlEntity(features: ChatFeatureEntity.fake().fakeList(4));
  SystemControlEntity copyWith({List<ChatFeatureEntity>? features}) {
    return SystemControlEntity(features: features ?? this.features);
  }

  @override
  List<Object?> get props => [features];
}

extension SystemControlEntityExt on SystemControlEntity {
  SystemControlEntity updateFeature(ChatFeatureEntity updated) {
    return copyWith(
      features: features
          .map(
            (feature) => feature.feature == updated.feature ? updated : feature,
          )
          .toList(),
    );
  }
}
