import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/features/settings/domain/entities/chat_feature_entity.dart';
import 'package:eze/features/settings/domain/entities/system_control_entity.dart';
import 'package:eze/features/settings/presentation/controller/base_settings_cubit.dart';
import 'package:eze/features/settings/presentation/view/layout/chat_feature_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingSystemControl extends StatelessWidget {
  const SettingSystemControl({super.key});

  void _onChange(ChatFeatureEntity feature, SystemControlCubit controlCubit) {
    controlCubit.edit(controlCubit.value.updateFeature(feature));
  }

  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.read<SystemControlCubit>();
    return BaseBlocConsumer(
      bloc: settingsCubit,
      builder: (_) => ChatFeaturesList(
        features: settingsCubit.value.features,
        onChanged: (entity) => _onChange(entity, settingsCubit),
      ),
    );
  }
}
