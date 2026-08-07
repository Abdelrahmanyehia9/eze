import 'package:eze/core/enums/message_status.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MessageReceiptIcon extends StatelessWidget {
  final MessageStatus status;

  final double? size;
  final Color? sentColor;
  final Color? readColor;

  const MessageReceiptIcon({
    super.key,
    required this.status,
    this.size,
    this.sentColor,
    this.readColor,
  });

  @override
  Widget build(BuildContext context) {
    final isSent = status != MessageStatus.notArrived;
    final isRead = status == MessageStatus.read;
    final effectiveSize = size ?? UISizes.sp20;
    final effectiveSentColor = sentColor ?? context.colors.surfaceContainer;
    final effectiveReadColor = readColor ?? AppColors.info;

    return Icon(
      isSent ? Icons.done_all : Icons.done,
      size: effectiveSize,
      color: isRead ? effectiveReadColor : effectiveSentColor,
    );
  }
}