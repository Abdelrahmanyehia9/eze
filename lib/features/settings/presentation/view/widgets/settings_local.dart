import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/enums/app_locale.dart';
import 'package:eze/features/settings/presentation/controller/base_settings_cubit.dart';
import 'package:eze/features/settings/presentation/view/layout/languages_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsLocal extends StatelessWidget {
  const SettingsLocal({super.key});

  
  void _onChange(AppLocale local, LocalCubit settingCubit)=>settingCubit.edit(local);

  @override
  Widget build(BuildContext context) {
    final settingCubit = context.read<LocalCubit>();
    return BaseBlocConsumer(
      bloc: settingCubit,
      builder:(_)=> LanguagesList(
        currentLocal: settingCubit.value,
        onChanged: (locale)  => _onChange(locale, settingCubit)
      ),
    );
  }
}
