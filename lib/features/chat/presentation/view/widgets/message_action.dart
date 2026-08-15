import 'package:eze/core/components/app_button.dart';
import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/components/app_list_tile.dart';
import 'package:eze/core/components/overlays/app_menu_overlay.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_configs.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'message_gestures.dart';

class MessageAction extends StatefulWidget {
  final ChatBubble bubble;
  final GestureTapCallback? onTap,
      onLongPress,
      onReply,
      onDelete,
      onForward,
      onReport;
  final Function(String react)? onReact;

  const MessageAction({
    super.key,
    required this.bubble,
    this.onTap,
    this.onLongPress,
    this.onReply,
    this.onDelete,
    this.onForward,
    this.onReport,
    this.onReact,
  });

  @override
  State<MessageAction> createState() => _MessageActionState();
}

class _MessageActionState extends State<MessageAction> {
  final MenuController controller = MenuController();

  @override
  Widget build(BuildContext context) {
    return AppMenuOverlay(
      controller: controller,
      offset: Offset(UISizes.sp16, 0),
      style: MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(UISizes.sp16),
          ),
        ),
      ),
      builder: (context, controller, child) {
        return MessageGestures(
          onDoubleTap: () => safeAction(controller.open),
          onReply: () => safeAction(widget.onReply),
          onTap: () => safeAction(widget.onTap),
          onLongPress: () => safeAction(widget.onLongPress),
          child: child!,
        );
      },
      children: [
        AppCard(
          child: Row(
            spacing: UISizes.sp8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: AppConfigs.reactEmojis
                .map(
                  (e) => AppButton.text(
                    e,
                    onTap: () => safeAction(() => widget.onReact?.call(e)),
                    style: context.textTheme.headlineSmall,
                  ),
                )
                .toList(),
          ),
        ),
        AppChip(
          marginVr: UISizes.sp8,
          color: context.colors.surface,
          child: Column(
            children: [
              _action("رد", AppIcons.reply, onTap: widget.onReply),
              _action("حذف", AppIcons.deleteFilled, onTap: widget.onDelete),
              _action("تحويل", AppIcons.forward, onTap: widget.onForward),
              _action("بلاغ", AppIcons.block, onTap: widget.onReport),
            ],
          ).paddingAll,
        ),
      ],
      child: AbsorbPointer(child: widget.bubble),
    );
  }

  Widget _action(String title, IconData icon, {GestureTapCallback? onTap}) =>
      Builder(
        builder: (context) => AppListTile(
          onTap: () => safeAction(onTap),
          title: title,
          leading: icon,
          showTrailing: false,
          leadingIconSize: UISizes.sp24,
          titleStyle: context.textTheme.labelLarge,
        ),
      );

  void safeAction(GestureTapCallback? action) {
    controller.close();
    action?.call();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}
