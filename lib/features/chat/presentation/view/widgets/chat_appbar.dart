part of '../chat_screen.dart';

class _ChatAppbar extends StatefulWidget implements PreferredSizeWidget {
  final ConversationPeerEntity peer;
  final ChatStyle style;

  const _ChatAppbar(this.peer, {required this.style});

  @override
  State<_ChatAppbar> createState() => _ChatAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(UISizes.sp72);
}

class _ChatAppbarState extends State<_ChatAppbar> {
  @override
  Widget build(BuildContext context) {
    final peer = widget.peer;
    final style = widget.style;
    final h = UISizes.sp72;
    final foreground = style.appBarForegroundColor;

    return SelectionBuilder<MessageEntity>(
      builder: (cubit, state) => DefaultAppBar(
        toolbarHeight: h,
        backgroundColor: style.appBarBackgroundColor,
        leadingWidth: h * .8,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: UISizes.w16),
          child: AppBackButton(
            backgroundColor: foreground.withAppOpacity(.05),
            iconColor: foreground,
          ).paddingVr,
        ),
        customTitle: Row(
          spacing: UISizes.w8,
          children: [
            UserCircleAvatar(
              size: h - UISizes.sp16,
              username: peer.name,
              image: peer.image,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(peer.name, color: foreground),
                  AppText(
                    peer.lastOnlineStr,
                    style: context.textTheme.bodySmall,
                    color: foreground.withAppOpacity(.8),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: _actions(state, cubit),
      ),
    );
  }

  List<Widget> _actions(
    SelectionState<MessageEntity> state,
    SelectionCubit<MessageEntity> cubit,
  ) {
    final color = widget.style.appBarForegroundColor;

    Widget button(IconData icon, {GestureTapCallback? onTap}) {
      return AppIconButton(
        icon: icon,
        color: color,
        backgroundColor: color.veryLight,
        onTap: onTap,
      );
    }

    if (!state.isSelectionMode) {
      return [AppMenuAnchor(anchorColor: color, items: const [])];
    }

    return [button(AppIcons.delete), Gap.small(), button(AppIcons.copy)];
  }
}
