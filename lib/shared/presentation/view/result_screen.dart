import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/shared/data/models/result_screen_args.dart';
import 'package:eze/shared/presentation/view/widgets/message_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ResultScreen extends StatelessWidget {
  final ResultScreenArgs args ;
  const ResultScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar:  args.showAppbar ?  const DefaultAppBar() : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8.h,
        children: [
          MessageAlert(
              customIcon: args.customIcon,
              customTitle: args.customTitle,
              customMessage: args.customMessage,
              args.type),
          if(args.action != null) args.action!.call(context),

        ],
      ),
    );
  }
}