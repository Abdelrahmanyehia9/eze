part of '../conversations_screen.dart';

class _ConversationNewChatFloatingButton extends StatelessWidget {
  const _ConversationNewChatFloatingButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: context.colors.secondary,
      child: const Icon(AppIcons.add),
      onPressed: () {},
    );
  }
}
