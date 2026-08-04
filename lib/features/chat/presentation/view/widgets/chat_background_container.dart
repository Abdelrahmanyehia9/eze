part of '../chat_screen.dart';

class _ChatBackgroundContainer extends StatelessWidget {
  const _ChatBackgroundContainer();

  @override
  Widget build(BuildContext context) {
    final theme = context.chatTheme;
    return Container(
      width: context.width,
      height: context.height,
      color: theme.chatBackgroundColor,
      child: theme.chatBackgroundImage == null
          ? null
          : Image.asset(theme.chatBackgroundImage!, fit: BoxFit.cover),
    );
  }
}
