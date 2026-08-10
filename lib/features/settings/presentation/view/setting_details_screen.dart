import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/features/settings/data/model/settings_details_screen_args.dart';
import 'package:eze/shared/presentation/view/widgets/chips.dart';
import 'package:flutter/material.dart';

class SettingDetailsScreen extends StatelessWidget {
  final SettingDetailsScreenArgs args;
  const SettingDetailsScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: DefaultAppBar(title: args.type.title, centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          spacing: UISizes.h16,
          children: [
            if (args.type.info != null) InfoChip(text: args.type.info!),
            args.type.buildBody(profile: args.profile),
          ],
        ),
      ),
    );
  }
}
