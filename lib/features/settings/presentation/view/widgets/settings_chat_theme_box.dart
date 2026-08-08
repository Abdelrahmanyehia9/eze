import 'package:eze/core/components/app_ribbon.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class SettingsChatThemeBox extends StatelessWidget {
  final ChatStyle theme;
  final bool isSelected;

  const SettingsChatThemeBox({
    super.key,
    required this.theme,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = theme.chatBackgroundColor;
    final background = theme.chatBackgroundImage;
    final outgoingColor = theme.outgoingBubbleColor;
    final incomingColor = theme.incomingBubbleColor;

    return AppRibbon(
      enabled: isSelected,
      data: const RibbonData(text: "المختار"),
      child: Container(
        padding: EdgeInsets.all(UISizes.sp8),
        height: UISizes.sp110,
        width: UISizes.sp96,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: isSelected
                ? context.primaryColor
                : context.colors.surfaceContainerLowest,
          ),
          borderRadius: BorderRadius.circular(UISizes.r12),
          image: background == null
              ? null
              : DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(background),
                ),
        ),
        child: Column(
          spacing: UISizes.sp12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentGeometry.topStart,
              child: ChatBubbleContainer(
                isMe: true,
                bubbleColor: outgoingColor,
                child: SizedBox(width: UISizes.sp48),
              ),
            ),
            Align(
              alignment: AlignmentGeometry.bottomEnd,
              child: ChatBubbleContainer(
                isMe: false,
                bubbleColor: incomingColor,
                child: SizedBox(width: UISizes.sp48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
