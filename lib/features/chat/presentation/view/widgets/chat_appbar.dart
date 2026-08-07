part of '../chat_screen.dart';

class _ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  final ConversationPeerEntity peer ;
  const _ChatAppbar(this.peer);

  @override
  Widget build(BuildContext context) {
    final size = UISizes.sp72;
    final Color backgroundColor = context.chatTheme.appBarBackgroundColor;
    final Color foregroundColor = context.chatTheme.appBarForegroundColor;
    return DefaultAppBar(
      toolbarHeight: size,
      backgroundColor: backgroundColor,
      leadingWidth: size * .8,
      leading: Padding(
        padding: EdgeInsetsDirectional.only(start: UISizes.w16),
        child: AppBackButton(
          backgroundColor: foregroundColor.withAppOpacity(0.05),
          iconColor: foregroundColor,
        ).paddingVr,
      ),
      customTitle: Row(
        spacing: UISizes.w8,
        children: [
          UserCircleAvatar(size: size - UISizes.sp16,
            username: peer.name, image: peer.image,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                 peer.name,
                  style: context.textTheme.titleMedium,
                  color: foregroundColor,
                  height: 0,
                ),
                AppText(
                  peer.lastOnlineStr ,
                  style: context.textTheme.bodySmall,
                  color: foregroundColor.withAppOpacity(0.8),
                  height: 0,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [AppMenuAnchor(anchorColor: foregroundColor, items: const [])],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(UISizes.sp72);
}
