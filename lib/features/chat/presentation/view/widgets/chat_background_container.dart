part of '../chat_screen.dart';

class _ChatBackgroundContainer extends StatelessWidget {
  final ChatStyle style;
  const _ChatBackgroundContainer({required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      color: style.chatBackgroundColor,
      child: style.chatBackgroundImage == null
          ? null
          : Image.asset(style.chatBackgroundImage!, fit: BoxFit.cover),
    );
  }
}
