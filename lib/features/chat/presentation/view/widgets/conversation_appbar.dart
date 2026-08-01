part of '../conversations_screen.dart';

class _ConversationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const _ConversationAppbar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppLogo(color: null, size: UISizes.sp40),
      title: const AppText("المحادثات"),
      centerTitle: true,
      actions: const [AppMenuAnchor(items: [])],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(UISizes.h40);
}
