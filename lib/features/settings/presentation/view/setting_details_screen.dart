import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class SettingDetailsScreenArgs {
  final String title;
  final String? info;
  final Widget body;

  SettingDetailsScreenArgs({
    required this.title,
     this.info,
    required this.body,
  });
}
class SettingDetailsScreen extends StatelessWidget {
  final SettingDetailsScreenArgs args ;
  const SettingDetailsScreen({super.key,required this.args});

  @override
  Widget build(BuildContext context) {
      return AppScaffold(
        appBar:  DefaultAppBar(title: args.title,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            spacing: UISizes.h16,
            children: [
              if(args.info!=null)
              _buildHeading(),
              args.body,
            ],
          ),
        ),
      );
    }

    Widget _buildHeading() =>  AppCard(
      color: AppColors.warning.veryLight,
      shadow: false,
      child: AppIconText(
        expandedText: true,
        icon: AppIcons.lamp,
        color: AppColors.warning,
        text: args.info
      ),
    );
}

