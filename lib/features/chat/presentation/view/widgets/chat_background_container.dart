part of '../chat_screen.dart';

class _ChatBackgroundContainer extends StatelessWidget {
  const _ChatBackgroundContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      color: AppColors.primary100
    );
  }
}
