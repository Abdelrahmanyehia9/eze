import 'package:eze/core/components/app_lottie.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/enums/message_alert_type.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';

class MessageAlert extends StatelessWidget {
  final MessagesAlertType type;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final String? customMessage;
  final String? customTitle;
  final double? iconSize;
  final Widget? customIcon;

  const MessageAlert(
    this.type, {
    super.key,
    this.titleStyle,
    this.messageStyle,
    this.customTitle,
    this.customMessage,
    this.iconSize,
    this.customIcon,
  });

  @override
  Widget build(BuildContext context) {
    final icoSize = iconSize ?? UISizes.sp180;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child:
              customIcon ??
              AppLottie(type.lottie, width: icoSize, repeat: false),
        ),
        AppText(
          customTitle ?? type.title,
          textAlign: TextAlign.center,
          style: titleStyle ?? context.textTheme.labelLarge,
        ),
        AppText(
          customMessage ?? type.subtitle,
          textAlign: TextAlign.center,
          style: messageStyle ?? context.textTheme.bodyMedium,
          color: context.colors.surfaceContainer,
        ),
      ],
    );
  }
}
