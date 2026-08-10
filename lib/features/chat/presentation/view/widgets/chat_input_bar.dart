part of '../chat_screen.dart';

class _ChatInputBar extends StatelessWidget {
  final ChatStyle style;
  const _ChatInputBar({required this.style});

  @override
  Widget build(BuildContext context) {
    return AppChip(
      radius: UISizes.r20,
      color: context.colors.surface,
      paddingVr: 8,
      paddingHr: 8,
      child: Row(
        children: [
          Expanded(
            child: AppTextField(
              hintText: "اكتب رسالتك هنا ..",
              maxLines: 6,
              minLines: 1,
              padding: EdgeInsets.symmetric(horizontal: UISizes.w8),
              filled: false,
              border: InputBorder.none,
            ),
          ),
          _buildAttachmentIcon(),
          _buildSendIcon(),
        ],
      ),
    );
  }

  Widget _buildSendIcon() => Builder(
    builder: (context) {
      return Container(
        height: UISizes.sp48,
        width: UISizes.sp48,
        decoration: BoxDecoration(
          color: style.appBarBackgroundColor,
          borderRadius: BorderRadius.circular(UISizes.r20),
        ),
        child: Icon(
          AppIcons.send,
          color: style.incomingTextColor,
          size: UISizes.sp24,
        ),
      );
    },
  );
  Widget _buildAttachmentIcon() => AppIconButton(
    backgroundColor: Colors.transparent,
    size: UISizes.sp24,
    icon: AppIcons.attach,
  );
}
