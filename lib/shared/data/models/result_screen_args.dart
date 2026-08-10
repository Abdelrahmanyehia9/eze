import 'package:eze/core/enums/message_alert_type.dart';
import 'package:flutter/material.dart';

class ResultScreenArgs {
  final MessagesAlertType type;
  final String? customMessage;
  final String? customTitle;
  final Widget? customIcon;
  final bool showAppbar;
  final Widget Function(BuildContext)? action;
  const ResultScreenArgs({
    required this.type,
    this.showAppbar = false,
    this.customIcon,
    this.customMessage,
    this.action,
    this.customTitle,
  });
}
